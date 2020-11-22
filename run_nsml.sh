#!/usr/bin/env bash

./nsml run \
  -m 'KoElectra' \
  -d korquad-open-ldbd3 \
  -g 2 \
  -c 8 \
  -e run_squad.py \
  -a "--model_type KoElectra
    --model_name_or_path monologg/koelectra-base-v2-discriminator
    --do_train
    --do_eval
    --data_dir train
    --num_train_epochs 2
    --learning_rate 2e-4
    --max_seq_length 384
    --per_gpu_train_batch_size 48
    --per_gpu_eval_batch_size 48
    --output_dir output
    --overwrite_output_dir
    --version_2_with_negative"
