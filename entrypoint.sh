#!/bin/sh -l
set -ex

chmod +x /sync.sh
export git_source=$1
export git_source_key=$2
export git_remote=$3
export git_remote_key=$4

echo 0 > /tmp/git-sync-returncode.txt

set -o pipefail; /sync.sh  2>&1 | tee /tmp/git-sync-aciton.log || echo $? > /tmp/git-sync-returncode.txt

export return_code=`cat /tmp/git-sync-returncode.txt`
#unix2dos /tmp/git-sync-aciton.log
export run_log=`tail -n 18  /tmp/git-sync-aciton.log` 

run_log="${run_log//'%'/'%25'}"
run_log="${run_log//$'\n'/'%0A'}"
run_log="${run_log//$'\r'/'%0D'}"

if [[ "${return_code}" -ne 0 ]]; then export succeed="false"; else  export  succeed="true"; fi 
if [[ "${return_code}" -ne 0 ]]; then export message="$git_source sync to $git_remote  Failed"; else  export  message="$git_source sync to $git_remote successed"; fi

echo "::set-output name=succeed::$succeed"
echo "::set-output name=message::$message"
echo "::set-output name=return_code::$return_code"
echo "::set-output name=run_log::$run_log"

exit $returncode

