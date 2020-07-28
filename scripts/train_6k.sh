#!/bin/bash

# Default recipe for 8x GPU 16GB with TensorCores (fp16/AMP).
# For other configurations, adjust
#
#     batch-size x graient-accumulation-steps
#
# to maintain a total of 64x4=256 samples per step.
#
#   | Prec. | #GPU | -bs | --gradient-accumulation-steps |
#   |-------|------|-----|-------------------------------|
#   | AMP   |    1 |  64 |                             4 |
#   | AMP   |    4 |  64 |                             1 |
#   | AMP   |    8 |  32 |                             1 |
#   | FP32  |    1 |  32 |                             8 |
#   | FP32  |    4 |  32 |                             2 |
#   | FP32  |    8 |  32 |                             1 |

mkdir -p output
python train.py \
    --cuda \
    --cudnn-enabled \
    -o ./output/ \
    --log-file ./output/nvlog.json \
    --dataset-path data-17-6k \
    --training-files filelists-6k/mel_dur_pitch_filelist-6k-train.txt \
    --validation-files filelists-6k/mel_dur_pitch_filelist-6k-val.txt \
    --test-files filelists-6k/mel_dur_pitch_test-20.txt \
    --pitch-mean-std-file data-17-6k/pitch_char_stats__filelist-6k-train.json \
    --epochs 150 \
    --epochs-per-checkpoint 10 \
    --warmup-steps 1500 \
    -lr 0.1 \
    -bs 32\
    --optimizer lamb \
    --grad-clip-thresh 1000.0 \
    --dur-predictor-loss-scale 0.1 \
    --pitch-predictor-loss-scale 0.1 \
    --weight-decay 1e-6 \
    --gradient-accumulation-steps 4 \
    --amp-run
