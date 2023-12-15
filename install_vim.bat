@echo off

set userdir=%USERPROFILE%
set vimConfig=%USERPROFILE%\_vimrc
set vimFiles=%USERPROFILE%\vimfiles
set vimConfigUrl=""

REM install vim executable
curl https://ftp.nluug.nl/pub/vim/pc/vim90w32.zip -o vim_install.zip
powershell -command "Expand-Archive -Force '%~dp0vim_install.zip' '%~dp0'"
cd vim/vim90
copy /y "vim.exe" "%userdir%/Documents/vim.exe"
cd ../../
del vim_install.zip
rmdir /q /s vim

REM install vim config
curl %vimConfigUrl% -o %vimConfig%
IF not exist %vimFiles% (mkdir %vimFiles%)
IF not exist %vimFiles%/colors (mkdir %vimFiles%\colors)
curl https://raw.githubusercontent.com/catppuccin/vim/main/colors/catppuccin_macchiato.vim -o %vimFiles%/colors/catppuccin_macchiato.vim


:exit
echo Done!
