#!/bin/bash

# Get a list of all the branches of the repository
remote_branches=$(git branch -r)

# Filter the list to only contain 'main' and 'Optimization_X' branches, excluding 'HEAD'.
filtered_branches=$(echo "$remote_branches" | grep -E 'origin/(main|Optimization_)' | grep -v 'HEAD')
# echo "Filtered branches (only 'main' and 'Optimization_X', excluding 'HEAD'):"
# echo "$filtered_branches"

# Loop through the filtered branches and list all folders in the root directory of the repository
for branch in $filtered_branches
do

    # Checkout the branch, pull the latest changes, and echo the name of the branch
    git checkout $branch
    git pull
    echo "Current branch: $branch"
    
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