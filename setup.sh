cd $(dirname "$0")

# ZSH SETUP ##################################################################i#
# install oh-my-zsh
rm -rf "$HOME/.oh-my-zsh"

yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -fs "$(pwd)/dotfiles/.zshrc" "$HOME"

# download plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
	${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# SCRIPTS ####################################################################
ln -fs "$(pwd)/scripts" "$HOME/.local/scripts"

# move to dotfiles location
cd $(dirname "$0")

ln -fs "$(pwd)/dotfiles/.tmux.conf" ~

# NVIM ########################################################################
ln -fs "$(pwd)/nvim" ~/.config/

