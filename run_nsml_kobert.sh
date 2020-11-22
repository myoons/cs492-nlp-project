#!/usr/bin/env bash

nsml run \
  -m 'kaist korquad kobert' \
  -d korquad-open-ldbd3 \
  -g 2 \
  -c 8 \
  -e run_squad_kobert.py \
  -a "--model_type kobert
    --model_name_or_path kobert-base-model
    --do_train
    --do_eval
    --data_dir train
    --num_train_epochs 1
    --per_gpu_train_batch_size 24
    --per_gpu_eval_batch_size 24
    --output_dir output
    --verbose_logging
    --overwrite_output_dir
    --version_2_with_negative"