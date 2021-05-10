#!/usr/bin/env bash 
set -euo pipefail

echo "Running workflow for PR created on $4 branch"
echo "Running the $6 job"

  response=$(curl \
  -X POST \
  -H "Authorization: $1" "https://api.bitrise.io/v0.1/apps/$2/builds" \
  -d "{
	\"hook_info\": {
		\"type\": \"bitrise\",
    \"build_trigger_token\":\"$1\"
	},
	\"build_params\": {
    \"branch\": \"$4\",
		\"branch_dest\": \"$5\",
		\"pull_request_id\": \"$7\",
    \"workflow_id\": \"$6\",
    \"pull_request_head_branch\":\"$4\",
    \"branch_repo_owner\":\"talabat-dhme\",
    \"branch_dest_repo_owner\":\"talabat-dhme\",
    \"commit_hash\":\"$3\"
	}
}")

output=$?
echo "$response"
echo ::set-output name=response::$output
(exit $output)