#!/bin/bash
#SBATCH --job-name=contrastive_pretrain
#SBATCH --output=/home/eecs/paras/slurm/coderep/%j_pretrain.log
#SBATCH --ntasks=1
#SBATCH --mem=32gb
#SBATCH --gres=gpu:1
#SBATCH --time=24:00:00
#SBATCH --exclude=atlas,blaze

date;hostname;pwd
export PATH="/data/paras/miniconda3/bin:$PATH"
chmod 755 -R ~/slurm

cd /work/paras/representjs
pip install torch
pip install -e .
npm install
python representjs/pretrain.py 20006_pretrain_insertvardecl --n_epochs=2 --batch_size=8 --lr="1e-3" --data_limit_size=100000 --num_gpus=1 --checkpoint_iter_interval 500