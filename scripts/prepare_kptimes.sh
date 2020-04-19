#!/bin/bash
ROOT_PATH=${PWD}
DATA_DIR=$ROOT_PATH/data 
SRC_TRAIN=$DATA_DIR/raw/kptimes/KPTimes.train.jsonl
SRC_VALID=$DATA_DIR/raw/kptimes/KPTimes.valid.jsonl
SRC_TEST=$DATA_DIR/raw/kptimes/KPTimes.test.jsonl
DEST_TRAIN=$DATA_DIR/kptimes.train2.jsonl
DEST_VALID=$DATA_DIR/kptimes.valid.jsonl
DEST_TEST=$DATA_DIR/kptimes.test.jsonl
DEST_VOCAB=$DATA_DIR/vocab_kptimes.txt

python3 deep_keyphrase/data_process/preprocess_kptimes.py -src_filename $SRC_TRAIN \
        -dest_filename $DEST_TRAIN -dest_vocab_path $DEST_VOCAB -src_lower -target_lower
# python3 deep_keyphrase/data_process/preprocess_kptimes.py -src_filename $SRC_VALID \
#         -dest_filename $DEST_VALID -src_lower -target_lower
# python3 deep_keyphrase/data_process/preprocess_kptimes.py -src_filename $SRC_TEST \
#         -dest_filename $DEST_TEST -src_lower -target_lower