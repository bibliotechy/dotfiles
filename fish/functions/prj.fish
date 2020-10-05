function prj
    cd (find $HOME/projects -maxdepth 1 -type d| fzf)
end
