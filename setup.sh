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
ln -fs "$(pwd)/i3" ~/.config/
ln -fs "$(pwd)/dotfiles/ssh-config" "$HOME/.ssh/config"

# NVIM ########################################################################
ln -fs "$(pwd)/nvim" ~/.config/

# SETUP #######################################################################

mkdir -p "$HOME/.npm-global"
npm config set prefix "$HOME/.npm-global"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
