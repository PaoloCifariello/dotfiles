
source (dirname (status -f))/aliases.fish

set PATH $HOME/.cargo/bin $PATH
set EDITOR nvim

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# enable starship
starship init fish | source
# enable zoxide
zoxide init fish | source
