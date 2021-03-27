#!/bin/bash

# エラーが発生するとスクリプトを終了する
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
# CMDとENTRYPOINTを1つのDockerfileに併用する場合は、CMDの値がENTRYPOINTの末尾に追加される。(CMDがENTRYPOINTのオプションとして扱われる)
exec "$@"