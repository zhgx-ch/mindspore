#!/bin/bash
# Copyright 2020 Huawei Technologies Co., Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ============================================================================

if [ $# != 1 ] && [ $# != 2 ]
then 
	echo "Usage: sh run_gpu_resnet_benchmark.sh [DATASET_PATH] [BATCH_SIZE](optional)"
exit 1
fi

get_real_path(){
  if [ "${1:0:1}" == "/" ]; then
    echo "$1"
  else
    echo "$(realpath -m $PWD/$1)"
  fi
}

DATAPATH=$(get_real_path $1)
script_self=$(readlink -f "$0")
self_path=$(dirname "${script_self}")
if [ $# == 1 ]
then
    python ${self_path}/../gpu_resnet_benchmark.py --dataset_path=$DATAPATH
fi

if [ $# == 2 ]
then
    python ${self_path}/../gpu_resnet_benchmark.py --dataset_path=$DATAPATH --batch_size=$2
fi