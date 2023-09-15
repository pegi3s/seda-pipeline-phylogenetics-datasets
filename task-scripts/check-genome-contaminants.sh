#!/bin/bash

TASK_AFTER=$(env | grep "^task_after=" | sed 's/^task_after*=//')

INPUT=${workingDirectory}/${output}/${TASK_AFTER}
OUTPUT=${workingDirectory}/${output}/${task_id}

mkdir -p ${OUTPUT}

find $INPUT -name "*Metazoa*" -exec cp {} ${OUTPUT} \;