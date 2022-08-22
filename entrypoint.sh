#!/bin/sh -l
set -ex
echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"
# CI	始终设置为 true。
# GITHUB_ACTION	当前运行的操作的名称，或步骤的 id。 例如，对于操作 __repo-owner_name-of-action-repo。

# GitHub 将删除特殊字符，并在当前步骤运行没有 ID的脚本时使用名称 __run。 如果在同一作业中多次使用相同的脚本或操作，则名称将包含一个由序号前跟下划线组成的后缀。 例如，运行的第一个脚本名称 __run，则第二个脚本将命名为 __run_2。 同样，actions/checkout 第二次调用时将变成 actionscheckout2。
# GITHUB_ACTION_PATH	操作所在的路径。 此属性仅在复合操作中受支持。 您可以使用此路径访问与操作位于同一存储库中的文件。 例如，/home/runner/work/_actions/repo-owner/name-of-action-repo/v1。
# GITHUB_ACTION_REPOSITORY	对于执行操作的步骤，这是操作的所有者和存储库名称。 例如 actions/checkout。
# GITHUB_ACTIONS	当 GitHub Actions 运行工作流程时，始终设置为 true。 您可以使用此变量来区分测试是在本地运行还是通过 GitHub Actions 运行。
# GITHUB_ACTOR	发起工作流程的个人或应用程序的名称。 例如 octocat。
# GITHUB_API_URL	返回 API URL。 例如：https://api.github.com。
# GITHUB_BASE_REF	工作流程运行中拉取请求的基本引用或目标分支的名称。 这仅在触发工作流运行的事件 pull_request 或 pull_request_target 时才会设置。 例如 main。
# GITHUB_ENV	运行器上从工作流程命令到设置环境变量的文件路径。 此文件对于当前步骤是唯一的，并且会针对作业中的每个步骤进行更改。 例如，/home/runner/work/_temp/_runner_file_commands/set_env_87406d6e-4979-4d42-98e1-3dab1f48b13a。 更多信息请参阅“GitHub Actions 的工作流程命令”。
# GITHUB_EVENT_NAME	触发工作流程的事件的名称。 例如，workflow_dispatch。
# GITHUB_EVENT_PATH	运行器上包含完整事件 web 挂钩负载的文件的路径。 例如 /github/workflow/event.json。
# GITHUB_GRAPHQL_URL	返回 GraphQL API URL。 例如：https://api.github.com/graphql。
# GITHUB_HEAD_REF	工作流程运行中拉取请求的头部引用或来源分支。 此属性仅在触发工作流程运行的事件为 pull_request 或 pull_request_target 时才设置。 例如，feature-branch-1。
# GITHUB_JOB	当前作业的 job_id。 例如，greeting_job。
# GITHUB_PATH	运行器上从工作流程命令到设置系统 PATH 变量的文件路径。 此文件对于当前步骤是唯一的，并且会针对作业中的每个步骤进行更改。 例如 /home/runner/work/_temp/_runner_file_commands/add_path_899b9445-ad4a-400c-aa89-249f18632cf5。 更多信息请参阅“GitHub Actions 的工作流程命令”。
# GITHUB_REF	触发工作流程的分支或标记参考。 For workflows triggered by push, this is the branch or tag ref that was pushed. For workflows triggered by pull_request, this is the pull request merge branch. For workflows triggered by release, this is the release tag created. For other triggers, this is the branch or tag ref that triggered the workflow run. This is only set if a branch or tag is available for the event type. The ref given is fully-formed, meaning that for branches the format is refs/heads/<branch_name>, for pull requests it is refs/pull/<pr_number>/merge, and for tags it is refs/tags/<tag_name>. 例如 refs/heads/feature-branch-1。
# GITHUB_REF_NAME	触发工作流程的分支或标记名称。 For example, feature-branch-1.
# GITHUB_REPOSITORY	所有者和存储库名称。 例如 octocat/Hello-World。
# GITHUB_STEP_SUMMARY	包含工作流程命令中作业摘要的文件在运行器上的路径。 此文件对于当前步骤是唯一的，并且会针对作业中的每个步骤进行更改。 例如，/home/rob/runner/_layout/_work/_temp/_runner_file_commands/step_summary_1cb22d7f-5663-41a8-9ffc-13472605c76c。 更多信息请参阅“GitHub Actions 的工作流程命令”。
# GITHUB_WORKFLOW	工作流程的名称。 例如 My test workflow。 如果工作流程文件未指定名称，则此变量的值是存储库中工作流程文件的完整路径。
# RUNNER_ARCH	执行作业的运行器的架构。 可能的值包括 X86、X64、ARM 或 ARM64。
# RUNNER_NAME	执行作业的运行器的名称。 例如 Hosted Agent
# RUNNER_TOOL_CACHE	包含 GitHub 托管运行器预安装工具的目录路径。 更多信息请参阅“关于 GitHub 托管的运行器”。 例如 C:\hostedtoolcache\windows
echo "-----------------------Pre Define------------------------"
#export CI_SERVER_HOST="github.com"
echo "-------------------------------ENVIRONMENT VARIABLES-------------------------------"

echo "CI="$CI
echo "GITHUB_ACTION="$GITHUB_ACTION
echo "GitHub="$GitHub
echo "GITHUB_ACTION_PATH="$GITHUB_ACTION_PATH
echo "GITHUB_ACTION_REPOSITORY="$GITHUB_ACTION_REPOSITORY
echo "GITHUB_ACTIONS="$GITHUB_ACTIONS
echo "GITHUB_ACTOR="$GITHUB_ACTOR
echo "GITHUB_API_URL="$GITHUB_API_URL
echo "GITHUB_BASE_REF="$GITHUB_BASE_REF
echo "GITHUB_ENV="$GITHUB_ENV
echo "GITHUB_EVENT_NAME="$GITHUB_EVENT_NAME
echo "GITHUB_EVENT_PATH="$GITHUB_EVENT_PATH
echo "GITHUB_GRAPHQL_URL="$GITHUB_GRAPHQL_URL
echo "GITHUB_HEAD_REF="$GITHUB_HEAD_REF
echo "GITHUB_JOB="$GITHUB_JOB
echo "GITHUB_PATH="$GITHUB_PATH
echo "GITHUB_REF="$GITHUB_REF
echo "GITHUB_REF_NAME="$GITHUB_REF_NAME
echo "GITHUB_REPOSITORY="$GITHUB_REPOSITORY
echo "GITHUB_STEP_SUMMARY="$GITHUB_STEP_SUMMARY
echo "GITHUB_WORKFLOW="$GITHUB_WORKFLOW
echo "RUNNER_ARCH="$RUNNER_ARCH
echo "RUNNER_NAME="$RUNNER_NAME
echo "RUNNER_TOOL_CACHE="$RUNNER_TOOL_CACHE
echo "---------------------------------------------cache file before runing-----------------------------"
sleep 2
mkdir -p ~/source
ls ~/source

export git_source=$1
export git_source_key=$2
export git_remote=$3
export git_remote_key=$4
echo "---------------------------------------------git clone from github--------------------------------"
mkdir -p /root/.ssh
mkdir -p ~/.ssh

echo $git_source_key | base64 -d > /git_source_key
chmod 400 /git_source_key

echo $git_remote_key | base64 -d > /git_remote_key
chmod 400 /git_remote_key
#ssh-keygen -y -f /git_source_key > /git_source_key.pub
#cat  /git_source_key.pub
#ssh -o  StrictHostKeyChecking=no -o IdentitiesOnly=yes -i /git_source_key -F /dev/null -vvvT git@github.com

#echo "git@${CI_SERVER_HOST}:${GITHUB_REPOSITORY}.git"
#git clone -c core.sshCommand="/usr/bin/ssh -i /git_source_key" git@${CI_SERVER_HOST}:${GITHUB_REPOSITORY}.git  /root/source  && cd /root/source
mkdir ./code
cd ./code
GIT_SSH_COMMAND='ssh -o  StrictHostKeyChecking=no -o IdentitiesOnly=yes -i /git_source_key -F /dev/null ' git clone --mirror $git_source
git config --bool core.bare false
git reset --hard
#git clone git@github.com:nanjingrd/datagate.git
git config user.email "devops@cprd.tech"
git config user.name "codesync"

for branch in $(git for-each-ref --format='%(refname)' refs/heads/); do
    echo $branch
    git remote add sync_remote $git_remote || true 
    git remote -v
    GIT_SSH_COMMAND='ssh -o  StrictHostKeyChecking=no -o IdentitiesOnly=yes -i /git_remote_key -F /dev/null ' git fetch sync_remote
    git checkout -b realsource sync_remote/$branch
    git merge realsource --allow-unrelated-histories   --strategy-option ours --no-edit
    GIT_SSH_COMMAND='ssh -o  StrictHostKeyChecking=no -o IdentitiesOnly=yes -i /git_remote_key -F /dev/null ' git push -u sync_remote $branch 
done

GIT_SSH_COMMAND='ssh -o  StrictHostKeyChecking=no -o IdentitiesOnly=yes -i /git_remote_key -F /dev/null ' git push -u sync_remote --tags

echo "::set-output name=sync_code::$?"
echo "::set-output name=sync_result::' ' "



