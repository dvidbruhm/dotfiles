My Neovim config for python and rust dev. Here are the steps to get everything working.

```
# install neovim, for example:
sudo apt install neovim
pip install neovim

# clone this config repo in ~/.config/nvim

# install vim-plug and nodejs (for coc.nvim):

# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
# nodejs
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs

# Then inside neovim:
:PlugInstall
:CocInstall coc-python

# For token highlight:
:CocInstall coc-highlight

# Install rust analyzer:
:CocInstall coc-rust-analyzer

```

Bonus zsh plugins I use:

```
plugins=(git history-substring-search zsh-autosuggestions zsh-syntax-highlighting fzf)
```
