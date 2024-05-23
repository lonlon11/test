#!/bin/bash

# Print hello world and the current git branch
echo "Hello World! I am on branch $(git rev-parse --abbrev-ref HEAD)"