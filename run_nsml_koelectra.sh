#!/usr/bin/env bash

nsml run \
  -m 'ans_paragraph : no_ans_paragraph = 10 : 3, threshold 0.85 script context' \
  -d korquad-open-ldbd3 \
  -g 2 \
  -c 8 \
  -e run_squad.py \
  -a "--model_type koelectra \
    --model_name_or_path monologg/koelectra-base-v2-discriminator \
    --do_train
    --do_eval
    --data_dir train
    --num_train_epochs 5
    --max_seq_length 512
    --max_query_length 64
    --max_answer_length 30
    --n_best_size 20
    --per_gpu_train_batch_size 32
    --per_gpu_eval_batch_size 64
    --output_dir output
    --overwrite_output_dir
    --version_2_with_negative
    --learning_rate 5e-5
    --adam_epsilon 1e-8"