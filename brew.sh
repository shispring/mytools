#!/bin/sh

# 替换brew.git
cd "$(brew --repo)"
git remote set-url origin https://mirrors.ustc.edu.cn/brew.git
# 替换homebrew-core.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
# 替换homebrew-cask
cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-cask
git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git

echo "check brew source start ..."
# brew.git镜像源
git -C "$(brew --repo)" remote -v
# homebrew-core.git镜像源
git -C "$(brew --repo homebrew/core)" remote -v
# homebrew-cask.git镜像源
git -C "$(brew --repo homebrew/cask)" remote -v

echo "check brew source end ..."

# 刷新源
# brew update --verbose
# exit

cd ~
brew install lrzsz
brew install python3
brew install openssl
brew install php
brew install php-cs-fixer
brew install tree
brew install mycli
brew install the_silver_searcher
brew install autojump
brew install fzf
brew install ffmpeg
