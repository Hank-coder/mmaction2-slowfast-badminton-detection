#!/usr/bin/env bash

# Copyright (c) Facebook, Inc. and its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##############################################################################
##-r表示一秒多少帧 -q:v表示存储jpeg的图像质量，一般2是高质量。 一秒三十帧图像
# Extract frames from videos.

IN_DATA_DIR="./ava/videos_cut"
OUT_DATA_DIR="./ava/rawframes"

if [[ ! -d "${OUT_DATA_DIR}" ]]; then
  echo "${OUT_DATA_DIR} doesn't exist. Creating it.";
  mkdir -p ${OUT_DATA_DIR}
fi

for video in $(ls -A1 -U ${IN_DATA_DIR}/*)
do
  video_name=${video##*/}

  if [[ $video_name = *".webm" ]]; then
    video_name=${video_name::-5}
  else
    video_name=${video_name::-4}
  fi

  out_video_dir=${OUT_DATA_DIR}/${video_name}
  mkdir -p "${out_video_dir}"

  out_name="${out_video_dir}/img_%05d.jpg"

 # Only convert if directory doesn't already contain frames
  if [ $(ls "${out_video_dir}" | wc -l) -eq 0 ]; then
    ffmpeg -i "${video}" -r 30 -q:v 1 -start_number 0 "${out_name}"
  fi
done
