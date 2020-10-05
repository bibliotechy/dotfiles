function push
    git push $argv origin (git rev-parse --abbrev-ref HEAD)
end