#!/bin/bash
ABS_PATH=$(cd $(dirname $0) && pwd)
PUBLIC=$ABS_PATH/../public

for f in $ABS_PATH/post_process/*; do
    . $f
done
