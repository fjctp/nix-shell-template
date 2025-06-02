#!/run/current-system/sw/bin/bash
# Transcoding using Intel QuickSync.

INPUT="$1" # Input file
OUTPUT="$2" # Output file

ffmpeg -init_hw_device qsv=hw \
    -filter_hw_device hw \
    -i ${INPUT} \
    -vf hwupload=extra_hw_frames=64,format=qsv \
    -c:v h264_qsv \
    -q 25 ${OUTPUT}
