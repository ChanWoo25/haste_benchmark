#! /bin/bash
./build/tracking_app_file \
  --events_file=/data/datasets/dataset_ecd/shapes_translation/events.txt \
  --camera_params_file=/root/haste_benchmark/haste_benchmark/calib_ecd.txt \
  --output_file="/root/haste_benchmark/haste_benchmark/result.txt" \
  --seed=0.6,125.0,52.0,0.0,0  \
  --centered_initialization=false \
  --tracker_type=haste_correlation_star \
  --visualize=false
