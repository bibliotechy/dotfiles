function fssh
  while ! ssh $argv
    echo "Command failed, retrying..." >&2
  end
end

