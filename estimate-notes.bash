#!/bin/bash

# Estimate release notes content
#
# Required: "Contents" repository permissions (write)
#
# $1 -> Repository name with owner. For example, tshion/estimate-notes
# $2 -> Specifies the commitish value that will be the target for the release's tag.

repoName="$1"
targetCommitish="$2"

gh api \
    --method POST \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "/repos/$repoName/releases/generate-notes" \
    -f "tag_name=preview" \
    -f "target_commitish=$targetCommitish"
