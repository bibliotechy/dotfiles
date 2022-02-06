function delete_merged
    git checkout main && git branch --merged main | grep -v "*" | xargs -I{} git branch -d {} && git remote prune origin
end
