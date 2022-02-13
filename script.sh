#!/bin/bash 
# 
#SBATCH --job-name=yl_kn_m_no_frzn
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=knaralasetty@scu.edu 

module load hubpy3.7-tf2.3

# This is gonna be the training command for yolov5, while keeping the config files exist is coco128.YAML
python3 ./yolov5/train.py --img 640 --batch 16 --epochs 200 --data coco128.yaml --weights ./yolov5/yolov5s.pt --cfg ./yolov5/models/yolov5s.yaml --freeze 10

# This is gonna be the testing command, change the relative path of images
python3 ./yolov5/detect.py --weights ./yolov5/runs/train/exp13/weights/best.pt --save-txt --save-conf --source ./dataset/test/images/