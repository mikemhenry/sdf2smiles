# Docker file we are building on top of 
FROM ghcr.io/mamba-org/micromamba:2.0.8-alpine3.20

# Some metadata for the image
LABEL org.opencontainers.image.source=https://github.com/mikemhenry/sdf2smiles
LABEL org.opencontainers.image.description="Convert SDF into SMILES"
LABEL org.opencontainers.image.licenses=MIT

# We need to copy in files needed to build the envrionment 
COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yaml convert.py .

# We now install what we need into the base micromamba environment
# See https://micromamba-docker.readthedocs.io/en/latest/quick_start.html#quick-start
RUN micromamba install -y -n base -f environment.yaml && \
    micromamba clean --all --yes

# The envrionment isn't automacally activated for `docker build` (but it is for `docker run`)
ARG MAMBA_DOCKERFILE_ACTIVATE=1

# We need a place to mount files inside the container
USER  root
RUN mkdir -p /opt/app/
USER $MAMBA_USER

# Set the working directory 
WORKDIR /opt/app/

# Set entrypoint, this makes it so we just have to pass in an SDF file inot the container
# and not worry abbout the path to the script
ENTRYPOINT ["/usr/local/bin/_entrypoint.sh", "python", "/tmp/convert.py"]
