
set PATH $HOME/.cargo/bin $PATH
set EDITOR vim

starship init fish | source

abbr -a l 'exa -l'
abbr -a ls 'exa'
abbr -a ll 'exa -la'

abbr -a vi 'nvim'
abbr -a vim 'nvim'

abbr -a lg 'lazygit'
