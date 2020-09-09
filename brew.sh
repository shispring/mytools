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
#文档内容搜索工具
brew install the_silver_searcher
brew install autojump
brew install fzf
#比cat好用的浏览工具
brew install bat
brew install jq
#查找
brew install fd
#查找速度比grep快，命令：rg xxx
brew install ripgrep
#http请求工具，替代curl
brew install httpie
#多线程下载工具，替换wget、curl
brew install axel
#监控
brew install htop
brew search glances
#docker监控
brew install ctop
brew install lazydocker
#视频工具
brew install ffmpeg
