#! /bin/bash
export LC_ALL=C
export DATASET_DIR=/data/datasets
export RESULTS_DIR=/data/results

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

# for METHOD in correlation haste_correlation haste_correlation_star haste_difference  haste_difference_star; do
#   for DATASET in shapes_6dof shapes_rotation shapes_translation boxes_6dof  boxes_rotation  boxes_translation poster_6dof poster_rotation poster_translation; do
#     ./build/tracking_app_file \
#       --events_file="/data/datasets/dataset_ecd/${DATASET}/events.txt" \
#       --camera_params_file="/root/haste-benchmark/haste_benchmark/calib_ecd.txt" \
#       --centered_initialization=true \
#       --tracker_type=${METHOD} \
#       --seeds_file="/data/results/event_feature_tracking/results/seed_${DATASET}.csv" \
#       --output_file="/data/results/event_feature_tracking/${DATASET}/${METHOD}/eval.txt" \
#       --visualize=false
#   done
# done

# for METHOD in correlation haste_correlation haste_correlation_star haste_difference  haste_difference_star; do
#   export DATASET="case_a"
#   ./build/tracking_app_file \
#     --events_file="/data/esim_case_a.bin" \
#     --camera_size=480x360 \
#     --camera_params_file="/root/haste-benchmark/haste_benchmark/calib_syn.txt" \
#     --seed=0.11276500,216.0,121.0,0.0,0                     \
#     --centered_initialization=false \
#     --tracker_type=${METHOD} \
#     --output_file="/data/results/event_feature_tracking/${DATASET}/${METHOD}/eval.txt" \
#     --visualize=false
# done

# Case B
for METHOD in haste_correlation haste_correlation_star haste_difference  haste_difference_star; do
  export DATASET="case_B_dt05"
  ./build/tracking_app_file \
    --events_file="${DATASET_DIR}/dataset_ours/${DATASET}/events.bin" \
    --camera_size=480x360 \
    --camera_params_file="/root/haste-benchmark/haste_benchmark/calib_syn.txt" \
    --seed=0.13904700,278.0,195.0,0.0,0 \
    --centered_initialization=false \
    --tracker_type=${METHOD} \
    --output_file="${RESULTS_DIR}/event_feature_tracking/${DATASET}/${METHOD}/eval.txt" \
    --visualize=false
done

for METHOD in haste_correlation haste_correlation_star haste_difference  haste_difference_star; do
  export DATASET="case_B_dt10"
  ./build/tracking_app_file \
    --events_file="${DATASET_DIR}/dataset_ours/${DATASET}/events.bin" \
    --camera_size=480x360 \
    --camera_params_file="/root/haste-benchmark/haste_benchmark/calib_syn.txt" \
    --seed=1.97683700,274.0,192.0,0.0,0 \
    --centered_initialization=false \
    --tracker_type=${METHOD} \
    --output_file="${RESULTS_DIR}/event_feature_tracking/${DATASET}/${METHOD}/eval.txt" \
    --visualize=false
done

