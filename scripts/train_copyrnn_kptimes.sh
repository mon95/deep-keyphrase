#!/bin/bash
ROOT_PATH=${PWD}
DATA_DIR=$ROOT_PATH/data
TRAIN_FILENAME=$DATA_DIR/kptimes.train2.jsonl
VALID_FILENAME=$DATA_DIR/kptimes.valid.jsonl
TEST_FILENAME=$DATA_DIR/kptimes.test.jsonl
VOCAB_PATH=$DATA_DIR/kptimes_vocab.txt
DEST_DIR=$DATA_DIR/kptimes/
EXP_NAME=copyrnn_kptimes_basic

# export CUDA_VISIBLE_DEVICES=1

python3 deep_keyphrase/copy_rnn/train.py -exp_name $EXP_NAME \
  -train_filename $TRAIN_FILENAME \
  -valid_filename $VALID_FILENAME -test_filename $TEST_FILENAME \
  -batch_size 128 -max_src_len 1500 -learning_rate 1e-3 \
  -token_field title_and_abstract_tokens -keyphrase_field keyword_tokens \
  -vocab_path $VOCAB_PATH -dest_base_dir $DEST_DIR \
  -bidirectional -teacher_forcing -copy_net -shuffle -prefetch \
  -schedule_lr -schedule_step 10000