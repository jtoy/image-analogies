#!/usr/bin/env bash

#Set environment variables
export LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-7.5/lib64
export PATH=$PATH:/usr/local/cuda-7.5/bin

# Execute example scripts or main script

if [[ "$1" == "--example" ]]
then
    bash $2
else
    make_
fi