#!/usr/bin/env bash

nsml run \
  -m 'kaist korquad koelectra' \
  -d korquad-open-ldbd3 \
  -g 2 \
  -c 8 \
  -e run_squad.py \
  -a "--model_type koelectra \
    --model_name_or_path monologg/koelectra-base-v3-discriminator \
    --do_train
    --do_eval
    --data_dir train
    --num_train_epochs 7
    --per_gpu_train_batch_size 12
    --per_gpu_eval_batch_size 24
    --output_dir output
    --verbose_logging
    --overwrite_output_dir
    --version_2_with_negative"