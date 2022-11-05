git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
curl https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/VictorMono/Medium/complete/Victor%20Mono%20Medium%20Nerd%20Font%20Complete.ttf --output victor_mono.ttf
open victor_mono.ttf
rm victor_mono.ttf
