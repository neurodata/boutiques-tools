#!/bin/bash
#
# Usage: ./generate.sh [PIPELINE]
#
# Args:
#   [PIPELINE] - json file to evaluate; defaults to ndmg
#

if [ $# -eq 0 ]
  then
    pipeline=ndmg
else
    pipeline=$1
fi

docker run --rm -v $PWD:/work -w /work boutiques/boutiques validator.rb /usr/local/boutiques/schema/descriptor.schema.json cbrain_task_descriptors/ndmg.json
