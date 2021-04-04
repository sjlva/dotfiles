# dotfiles

My dotfiles, very simple and vim friendly.

## tmux

Tmux allows me to combine processes, shells and Vim in any way I need for the project at hand. I'm able to build my own IDE-like experience. I'm a big user and huge fan.  
Core to my tmux work is the combination of a plugin that bring Vim & tmux together, [vim-slime](https://github.com/jpalardy/vim-slime) for sending commands from vim to tmux, making possible to code in any language interpreter at the same config.

| ![vim-slime demo](https://i.imgur.com/yzfR9hy.gif) | 
|:--:| 
| *vim-slime demo, image from [vim-slime.](https://github.com/jpalardy/vim-slime)* |

## i3

i3 is fast. It is neither bloated nor fancy. I found it simple and efficient.  
I use with a minimalist configuration, without polybars or anything like that. Everything is invisible, and the commands look like Vim's.

## nvim 

I use few Vim plugins and don't spend much time customizing them. Usually, I change the other dotfiles to Vim's style. Vim provides a way of editing text that I love, it's not about productivity or speed, it's about being focused and having more freedom to think, when I don't need to worry about the tool, it's easier to focus on what matters.
It currently supports linting, syntax highlighting, autocomplete, git, and has a command-line fuzzy finder, [fzf](https://github.com/junegunn/fzf).

## Install

### tilix, firefox and some tilix colorschemes

This is step is optional, if tilix and firefox are not installed some i3 shortcuts must be remapped.

```bash
sudo pacman -S firefox
sudo pacman -S tilix

git clone https://github.com/MichaelThessel/tilix-gruvbox.git
cd tilix-gruvbox
sudo cp gruvbox-* /usr/share/tilix/schemes
cd ..
rm -rf tilix-gruvbox
```

### i3

Just copy the /.i3/config file to you i3 default path.

```bash
git clone https://github.com/sjlva/dotfiles.git
cp dotfiles/.i3/config $HOME/.i3
```
### tmux

```bash
sudo pacman -S tmux
tmux
tmux show -g > ~/.tmux.conf
cp dotfiles/tmux/.tmux.conf $HOME
```

### neovim

These steps installs `neovim`, `vim-plug`, `nodejs` (required for coc-vim), `R language` and `R language server` (both for `R` autocomplete functions).

```bash
sudo pacman -S neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sudo pacman -S nodejs npm
sudo pacman -S r
sudo R -e 'install.packages("languageserver", repos = "http://cran.us.r-project.org")
cp dotfiles/nvim/init.vim $HOME/.config/nvim/
```

After neovim installs, install the plugins by opening `neovim` and typing:

```bash
:PlugInstall
:CocInstall coc-r-lsp
```

