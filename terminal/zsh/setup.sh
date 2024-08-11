pacman -S zsh cargo

cargo install starship

ln .zshrc ~/.zshrc
ln starship.toml ~/.config/starship.toml

curl -sfL git.io/antibody | sh -s - -b /usr/local/bin
