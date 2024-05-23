#!/bin/bash

# Get a list of all the branches of the repository
remote_branches=$(git branch -r)

# Filter the list to only contain 'main' and 'Optimization_X' branches, excluding 'HEAD'.
# Remove origin/ from the branch names
filtered_branches=$(echo "$remote_branches" | grep -E "origin/main|origin/Optimization_[0-9]+" | sed 's/origin\///')

# filtered_branches=$(echo "$remote_branches" | grep -E 'origin/(main|Optimization_)' | grep -v 'HEAD')


# Loop through the filtered branches and list all folders in the root directory of the repository
for branch in $filtered_branches
do

    if [ $branch == "main" ]; then
        branch="Baseline"
    fi

    echo
    echo "===================================================================================================="
    # Checkout the branch, pull the latest changes, and echo the name of the branch
    git checkout $branch
    git pull origin $branch
    echo "Current branch: $branch"

    # Run the foo script for testing
    python foo.py $branch

    # Stage and commit the newly created file "$branch.tar.bz2"
    git add "$branch.tar.bz2"
    git commit -m "add $branch.tar.bz2, created at $(date)"
    git push origin $branch

    echo "===================================================================================================="

    
    # current_branch=$branch
    # # If current branch is 'main', rename it to 'Baseline'
    # if [ $branch == "main" ]; then
    #     branch="Baseline"
    # fi

    # echo "Current branch: $branch"

    # # Pull the latest changes from the remote repository
    # git pull

    # # Run the foo script for testing
    # python foo.py $current_branch

    # # Stage and commit the newly created file "$current_branch.tar.bz2"
    # git add "$current_branch.tar.bz2"
    # git commit -m "add $current_branch.tar.bz2, created at $(date)"
    # git push
done