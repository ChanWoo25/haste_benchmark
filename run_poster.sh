#! /bin/bash
export LC_ALL=C
export DATASET_DIR=/data/datasets
export RESULTS_DIR=/data/results
########################
# 230831 Seed file run #
########################
# boxes_6dof shapes_6dof poster_6dof dynamic_6dof
# boxes_translation shapes_translation poster_translation dynamic_translation
# boxes_rotation shapes_rotation poster_rotation dynamic_rotation
for RUN_ALGORITHM in correlation haste_correlation haste_correlation_star haste_difference  haste_difference_star; do
  for DATASET in poster_6dof poster_translation ; do
    for LEVEL in easy medi diff ; do
      for SEED_ALGO in EFT_31 Harris StrongArc ; do
          export SEED_FN="${RESULTS_DIR}/event_feature_tracking/seeds/${SEED_ALGO}/${DATASET}_${LEVEL}/seeds.csv"
          export SAVE_DIR="${RESULTS_DIR}/event_feature_tracking/${DATASET}_${LEVEL}/${SEED_ALGO}/${RUN_ALGORITHM}"
          ./build/tracking_app_file \
            --events_file="${DATASET_DIR}/dataset_ecd/${DATASET}/events.txt" \
            --camera_params_file="/root/haste-benchmark/haste_benchmark/calib_ecd.txt" \
            --centered_initialization=true \
            --tracker_type=${RUN_ALGORITHM} \
            --seeds_file="${SEED_FN}" \
            --output_dir="${SAVE_DIR}" \
            --visualize=false
      done
    done
  done
done
