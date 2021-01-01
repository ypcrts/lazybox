Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex

scoop install git aria2
scoop bucket add extras
scoop install neovim python 7zip keepassxc nodejs psutils 
#scoop install vcredist
