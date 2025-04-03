# sdf2smiles

I wrote a little script to print out the SMILES string from an sdf file.
For more information, see this blog post.

## Usage

The script can read in a single SDF file that contains one or more molecules.
There are two main ways to use this script.
You can either call it directly with Python or use docker.

### script

First, create an environment with the necessary dependencies and activate it:

```bash
$ micromamba create -n sdf2smiles --file environment.yaml
$ micromamba activate sdf2smiles
```

Then run the script:

```bash
$ python convert.py ethane.sdf
Converting ethane_template.sdf to SMILES
ethane: [H][C]([H])([H])[C]([H])([H])[H]
```

### docker

You can use this script without installing anything by using docker:

```bash
$ docker run --rm -v$(pwd):/opt/app mmh42/sdf2smiles:latest ethane.sdf
Converting ethane_template.sdf to SMILES
ethane: [H][C]([H])([H])[C]([H])([H])[H]
```

This example assumes you have a `ethane.sdf` in your current directory.
You can change $(pwd) to point to a different local directory to read SDF files from.
