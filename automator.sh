#!/bin/bash

# Get a list of all the branches of the repository
remote_branches=$(git branch -r)

# Filter the list to only contain 'main' and 'Optimization_X' branches, excluding 'HEAD'.
# Remove origin/ from the branch names
filtered_branches=$(echo "$remote_branches" | grep -E "origin/main|origin/Optimization_[0-9]+" | grep -v 'HEAD' | sed 's/origin\///')

# Loop through the filtered branches and list all folders in the root directory of the repository
for branch in $filtered_branches
do
    echo
    echo "===================================================================================================="
    # Checkout the branch, pull the latest changes, and echo the name of the branch
    git checkout "$branch"
    git pull origin "$branch"
    echo "Current branch: $branch"

    # Name of the tar file
    if [ "$branch" == "main" ]; then
        tar_file="Baseline"
    else
        tar_file="$branch"
    fi

    # Run the foo script for testing
    python foo.py "$tar_file"

    # Stage and commit the newly created file "$branch.tar.bz2"
    git add "$tar_file.tar.bz2"
    git commit -m "add $tar_file.tar.bz2, created at $(date)"
    git push origin "$branch"

    echo "===================================================================================================="

done
