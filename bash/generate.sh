#!/bin/bash

# Run stable diffusion locally
function generate() {
	# Navigate to stable-diffusion repo
	cd ~/Documents/code/projects/ml/stable-diffusion
	source venv/bin/activate

	python scripts/txt2img.py --prompt "'$*'" --n_samples 1 --n_iter 1 --plms --precision full

	# Open the latest image
	cd outputs/txt2img-samples
	open $(ls -p | grep -v / | tail -1)
}