#!/bin/bash

IMAGE_B=${1:-"images/sugarskull-B.jpg"}
PREFIX=${2:-"/home/ubuntu/experiment/image-analogies/examples/out"}
VGG_WEIGHTS=${3-vgg16_weights.h5}
HEIGHT=512
PATCH_SIZE=1  # try 1 for less interesting, but faster-rendering effects
SKULL_IMAGE_A=images/sugarskull-A.jpg
SKULL_IMAGE_AP=images/sugarskull-Ap.jpg
OUTPUT_PATH="/home/ubuntu/experiment/image-analogies/examples/out"

echo "Make a sugar skull"
make_image_analogy.py \
  --a_image_path=$SKULL_IMAGE_A \
  --ap_image_path=$SKULL_IMAGE_AP \
  --b_image_path=$IMAGE_B \
  --result_prefix=$PREFIX/neo  \
  --height=$HEIGHT \
  --mrf-w=1.5 \
  --a-scale-mode=match \
  --patch-size=$PATCH_SIZE \
  --contrast=1 \
  --vgg-weights=$VGG_WEIGHTS --output-full \
  --iters=1 \
  --analogy-w=0\
  --b-content-w=1.0\
  --scales=3

#copy latest image to /data/output
cp `ls -t | head -1` /data/output/