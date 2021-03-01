
source (dirname (status -f))/aliases.fish

set PATH $HOME/.cargo/bin $PATH
set EDITOR nvim

starship init fish | source

