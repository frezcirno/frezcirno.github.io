#!/bin/bash
DIR=$(cd $(dirname $0) && pwd)

run-parts --regex '.*\.sh$' $DIR/post_process
