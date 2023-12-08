#!/bin/bash

Invite_Member() {
    local org_Name="$1"
    local Token="$2"
    local Email="$3"
    local Role="$4"
    local Team_id="$5"

    local api_url="https://api.github.com/orgs/${org_Name}/invitations"

    local data=$(cat <<EOF
{
  "email": "${Email}",
  "role": "${Role}",
  "team_ids": [${Team_id}]
}
EOF
    )

    curl -L \
      -X POST \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer ${Token}" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      "${api_url}" \
      -d "$data"
}

# Example Call
# Invite_Member "org_name" "token" "email@example.com" "role" "team_id"


Invite_Member "Shell-script68" "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" "muralivvrsn75683@gmail.com" "direct_member" "4"
