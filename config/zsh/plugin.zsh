# plugin
## autosuggestions
[ -d ~/.config/zsh/zsh-autosuggestions ] ||
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/zsh-autosuggestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

## color_command
[ -d ~/.config/zsh/zsh-syntax-highlighting ] ||
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
