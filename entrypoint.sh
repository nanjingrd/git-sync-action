#!/bin/sh -l
set -ex

chmod +x /sync.sh
export git_source=$1
export git_source_key=$2
export git_remote=$3
export git_remote_key=$4

echo 0 > /tmp/git-sync-returncode.txt

set -o pipefail; /sync.sh  2>&1 | tee /tmp/git-sync-aciton.log || echo $? > /tmp/git-sync-returncode.txt

export sync_code=`cat /tmp/git-sync-returncode.txt`
unix2dos /tmp/git-sync-aciton.log
export sync_log=`cat /tmp/git-sync-aciton.log` 

sync_log="${sync_log//'%'/'%25'}"
sync_log="${sync_log//$'\n'/'%0A'}"
sync_log="${sync_log//$'\r'/'%0D'}"

echo "::set-output name=sync_code::$sync_code"
echo "::set-output name=sync_log::$sync_log"

exit $returnCode

