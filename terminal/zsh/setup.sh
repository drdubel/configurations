sudo pacman -S zsh cargo cmake

cargo install starship

cp .zshrc ~/
cp starship.toml ~/.config/
cp .zsh_plugins.txt ~/
touch ~/.env

curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
