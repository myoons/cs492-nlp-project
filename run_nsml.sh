#!/usr/bin/env bash

./nsml run \
  -m 'KoElectra-base-v2 no_ans : 1 / has_ans : 4' \
  -d korquad-open-ldbd3 \
  -g 2 \
  -c 8 \
  -e run_squad.py \
  -a "--model_type electra
    --model_name_or_path monologg/koelectra-base-v2-discriminator
    --do_train
    --do_eval
    --data_dir train
    --num_train_epochs 5
    --learning_rate 5e-5
    --max_seq_length 384
    --per_gpu_train_batch_size 32
    --per_gpu_eval_batch_size 64
    --output_dir output
    --overwrite_output_dir
    --version_2_with_negative
    --n_best_size 30"
    
