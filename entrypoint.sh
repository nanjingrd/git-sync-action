#!/bin/sh -l
set -ex

chmod +x /sync.sh
set -o pipefail; /sync.sh  2>&1 | tee /tmp/git-sync-aciton.log || echo \$? > /tmp/git-sync-returncode.txt

export sync_code=`cat /tmp/git-sync-returncode.txt`
export sync_log=`cat /tmp/git-sync-aciton.log`

echo "::set-output name=sync_code::$sync_code"
echo "::set-output name=sync_log::$sync_log"



