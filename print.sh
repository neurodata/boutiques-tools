#!/bin/bash
#
# Usage: ./print.sh [PIPELINE] [INPUTS]
#
# Args:
#   [PIPELINE] - json file to evaluate; defaults to ndmg
#   [INPUTS] - json or csv file containing inputs; defaults to inputs.json (for ndmg)
#

if [ $# -eq 0 ]
  then
    inputs=ndmg_inputs
    pipeline=ndmg
elif [ $# -eq 1 ]
  then
    echo "Error: please provide inputs to your pipeline"
    exit -1
else
    pipeline=$1
    inputs=$2
fi

docker run --rm -v $PWD:/work -w /work boutiques/boutiques localExec.py -i inputs/${inputs}.json cbrain_task_descriptors/${pipeline}.json
