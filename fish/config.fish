## Startup ##
set fish_greeting ""

### Aliases ###

# Change Default Tools
alias ls "lsd"
alias cat "bat"
# Shortcuts
alias fishrc "nvim ~/.config/fish/config.fish"
alias update "source ~/.config/fish/config.fish"
alias pacman "sudo pacman"
alias add "git add"
alias commit "git commit -m"
alias tls "tmux ls"
alias tlsw "tmux list-windows"
# Tools
alias myip "curl http://ipecho.net/plain; echo"

## Add to $PATH ##
fish_add_path ~/.local/bin

zoxide init --cmd cd fish | source
