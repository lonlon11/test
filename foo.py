import os
import sys
import tarfile


# Create the files 1.csv, 2.csv, 3.csv
def create_files():
    for i in range(1, 4):
        with open(f"{i}.csv", "w") as f:
            f.write("Hello, World!")

# Archive the files 1.csv, 2.csv, 3.csv into a <branchname>.tar.bz2
def archive_files(branchname):
    with tarfile.open(f"{branchname}.tar.bz2", "w:bz2") as tar:
        for i in range(1, 4):
            tar.add(f"{i}.csv")

# Delete the files 1.csv, 2.csv, 3.csv
def delete_files():
    for i in range(1, 4):
        os.remove(f"{i}.csv")


if __name__ == "__main__":

    # If no branch name is provided, use "teapot" as the branch name
    if len(sys.argv) == 1:
        branchname = "teapot"
    else:
        branchname = sys.argv[1]
    
    create_files()
    archive_files(branchname)
    delete_files()