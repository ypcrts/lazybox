sudo apt-get install\
  vcsh\
  htop\
  powertop\
  tmux\
  git\
  gnupg\
  ssh\
  zsh\
  vim-nox\
  rsync\
  keychain
  # nodejs-legacy\
  # npm

chsh -s /bin/zsh `whoami`
vcsh clone https://github.com/ypcrts/dots dots
vcsh dots reset --HARD origin/master
vcsh dots remote rm origin
vcsh dots remote add origin gh:ypcrts/dots
