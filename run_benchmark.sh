#! /bin/bash
# ./build/tracking_app_file \
#   --events_file=/data/datasets/dataset_ecd/shapes_translation/events.txt \
#   --camera_params_file=/root/haste-benchmark/haste_benchmark/calib_ecd.txt \
#   --output_file="/root/haste_benchmark/haste_benchmark/result.txt" \
#   --seed=0.6,125.0,52.0,0.0,0  \
#   --centered_initialization=false \
#   --tracker_type=haste_correlation_star \
#   --visualize=false

# Load only the first 4M events from file.
# Do not enforce centered initialization. Track will start arbitrarily later than seed.
# Employed tracker is HasteCorrelation*.
# Seeds read from specified file.
# Specify file where tracking states will be recorded.
# ./build/tracking_app_file \
#   --events_file="/data/datasets/dataset_ecd/shapes_6dof/events.txt" \
#   --camera_params_file="/root/haste-benchmark/haste_benchmark/calib_ecd.txt" \
#   --centered_initialization=false \
#   --tracker_type=haste_correlation_star \
#   --seeds_file="/data/results/event_feature_tracking/results/seed_shapes_6dof.csv" \
#   --output_file="/data/results/event_feature_tracking/results/eval_shapes_6dof.txt" \
#   --visualize=false
#  --num_events=4000000 \

################################################
#                   Datasets                   #
################################################
# shapes_6dof shapes_rotation shapes_translation
# boxes_6dof  boxes_rotation  boxes_translation
# poster_6dof poster_rotation poster_translation

################################################
#                   Methods                    #
################################################
# correlation
# haste_correlation   haste_correlation_star
# haste_difference    haste_difference_star

for METHOD in correlation haste_correlation haste_correlation_star haste_difference  haste_difference_star; do
  for DATASET in shapes_6dof shapes_rotation shapes_translation boxes_6dof  boxes_rotation  boxes_translation poster_6dof poster_rotation poster_translation; do
    ./build/tracking_app_file \
      --events_file="/data/datasets/dataset_ecd/${DATASET}/events.txt" \
      --camera_params_file="/root/haste-benchmark/haste_benchmark/calib_ecd.txt" \
      --centered_initialization=true \
      --tracker_type=${METHOD} \
      --seeds_file="/data/results/event_feature_tracking/results/seed_${DATASET}.csv" \
      --output_file="/data/results/event_feature_tracking/${DATASET}/${METHOD}/eval.txt" \
      --visualize=false
  done
done


