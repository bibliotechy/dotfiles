set XDG_CONFIG_HOME ~/.config/fish/functions
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin 
set EDITOR /usr/bin/vim
set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths
set PATH $PATH /Users/cbn/.local/bin
set PATH $PATH $HOME/.cargo/bin
if test -e ~/.local.fish
	source ~/.local.fish
end
source ~/.iterm2_shell_integration.(basename $SHELL)
# Created by `userpath` on 2020-12-21 16:20:20
set PATH $PATH /Users/chad/.local/bin
set -g fish_user_paths "/usr/local/opt/node@14/bin" $fish_user_paths
set -g fish_user_paths "/opt/homebrew/bin/" $fish_user_paths

# Created by `pipx` on 2024-01-30 00:32:57
set PATH $PATH /Users/local-chnelson/.local/bin


set -x PATH $HOME/.rbenv/bin $PATH
rbenv init - | source
source ~/.cdl-ssm-util/session-fish-snippet.fish

source /opt/homebrew/opt/asdf/libexec/asdf.fish
#status --is-interactive; and source (pyenv virtualenv-init - |psub) 
