#!/bin/bash

create_Respository() {
    local org="$1"
    local token="$2"
    local repo_name="$3"
    local description="$4"
    local homepage="$5"
    local is_private="$6"
    local has_issues="$7"
    local has_projects="$8"
    local has_wiki="$9"

    local api_url="https://api.github.com/orgs/${org}/repos"

    local data=$(cat <<EOF
{
    "name": "${repo_name}",
    "description": "${description}",
    "homepage": "${homepage}",
    "private": ${is_private},
    "has_issues": ${has_issues},
    "has_projects": ${has_projects},
    "has_wiki": ${has_wiki}
}
EOF
    )

    curl -L \
        -X POST \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer ${token}" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        "${api_url}" \
        -d "${data}"
}

# Example usage of the function
 create_Respository "Shell-script68" "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" "marketData" "data" "https://github.com" false true true true




