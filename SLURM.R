#!/usr/bin/bash
### BHP batch 1
#SBATCH --job-name=BHP_batch_1
# ==== SLURM JOB SETTINGS ====
#Define how many nodes you need. Each node has 64 cores.
#SBATCH -N 6 -n 6
# time needed to execute, in days-hours:minutes:seconds
#SBATCH --time=10:00:00
# How much memory you need.
# --mem will define memory per node and
# --mem-per-cpu will define memory per CPU/core. Choose one of those.
#SBATCH --mem=0
# ==== LOAD MODULES / ACTIVATE ENV ====

module load megadetector
module load miniconda

conda activate megadetector

# ==== PATHS ====
# Path to uploaded images
INPUT_DIR=/mnt/DATA/beasley/Sites_batch_1
# Output will be written here             
OUTPUT_JSON=/home/beasley/BHP_batch_1_output.json    # Output will be written here

# ==== RUN MEGADETECTOR ====

python -m megadetector.detection.run_detector_batch MDV5A "$INPUT_DIR" "$OUTPUT_JSON" --output_relative_filenames --recursive --checkpoint_frequency 1000 --quiet

echo "MegaDetector Job Finished."
### run the following commands
echo "This script is running on: "$HOSTNAME
echo "This script was submitted by: "$USER
echo "MegaDetector Job Finished."
sleep 60