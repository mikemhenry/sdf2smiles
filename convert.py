import sys

from openff.toolkit import Molecule


def convert(sdf_path: str) -> None:
    """
    Converts a structure from an SDF file to SMILES notation and prints the result.

    Args:
        sdf_path (str): The path to the SDF file containing molecular structures.

    This function reads the SDF file, parses the molecules, and converts them into SMILES format.
    For multiple molecules in the SDF file, it will print the SMILES representation of each.
    For a single molecule, it prints the SMILES notation of that molecule.
    """
    print(f"Converting {sdf_path} to SMILES")

    mols = Molecule.from_file(sdf_path)
    match mols:
        case list():
            for mol in mols:
                print(f"{mol.name}: {mol.to_smiles()}")
        case Molecule():
            print(f"{mols.name}: {mols.to_smiles()}")


if __name__ == "__main__":
    convert(sys.argv[1])
