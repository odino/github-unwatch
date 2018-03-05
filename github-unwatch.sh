#!/bin/bash

# echo $GH_TOKEN
# echo $GH_USER
# echo $GH_PAGES

run_list_repos() {
  for (( N=1; N<=$GH_PAGES; N++ ))
  do
  	curl -s -H "Authorization: token $GH_TOKEN" "https://api.github.com/users/$GH_USER/subscriptions?page=$N" | jq -r 'to_entries[] | .value.full_name'
  done
}

run_unsubscribe() {
  echo "Unsubscribed from:"
  while read REPO ;
  do
    curl -s -H "Authorization: token $GH_TOKEN" -X DELETE "https://api.github.com/repos/$REPO/subscription" && echo " - $REPO"
  done
  echo "done."
}


run_$1
