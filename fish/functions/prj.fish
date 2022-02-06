function prj
    cd (find $HOME/projects -maxdepth 2 -type d| fzf)
end
