    cd ~
    git clone git@github.com:santiagohecar/dotfiles.git && cd dotfiles

### Install and setup nvim
    ./vim/install_nvim.sh && ./vim/setup_nvim.sh
    
### Install php 5.3.29 (+ mysql + php-fpm + nginx)
    sudo ./php/install_php5.3.29.sh

### Install and setup go 1.11
    sudo ./go/install_go1.11.sh && ./go/setup_workspace.sh && . ~/.bashrc
