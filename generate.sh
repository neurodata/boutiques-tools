#!/bin/bash
#
# Usage: ./generate.sh [PIPELINE] [NUMBER]
#
# Args:
#   [PIPELINE] - json file to evaluate; defaults to ndmg
#   [NUMBER] - number of samples to generate; defaults to 5
#

if [ $# -eq 0 ]
  then
    pipeline=ndmg
    num=5
elif [ $# -eq 1 ]
  then
     pipeline=$1
    num=5
else
    pipeline=$1
    num=$2
fi

docker run --rm -v $PWD:/work -w /work boutiques/boutiques localExec.py -n ${num} -r cbrain_task_descriptors/${pipeline}.json
