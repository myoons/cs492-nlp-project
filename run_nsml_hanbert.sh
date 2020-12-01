#!/usr/bin/env bash

nsml run \
  -m 'kaist korquad hanbert' \
  -d korquad-open-ldbd3 \
  -g 2 \
  -c 8 \
  -e run_squad_hanbert.py \
  -a "--model_type hanbert \
    --model_name_or_path HanBert-54kN-torch \
    --do_train
    --do_eval
    --data_dir train
    --num_train_epochs 5
    --per_gpu_train_batch_size 32
    --per_gpu_eval_batch_size 64
    --output_dir output
    --verbose_logging
    --overwrite_output_dir
    --version_2_with_negative
    --learning_rate 5e-5
    --adam_epsilon 1e-8"