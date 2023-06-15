#! /usr/bin/env bash

script_dir=$(pwd)

mk_dirs() {
    mkdir ~/Documents/git
    mkdir ~/Documents/Code
}

dotfiles() {
    cd ~/Documents/git
    git clone https://github.com/thejasonplayz/my-dotfiles 

    repo_dir=$git_dir/my-dotfiles

    cd $repo_dir
    ./stow.sh
}

nix_build() {
    sudo nix build .#nixosConfigurations.main-desktop.config.system.build.toplevel

    cd $script_dir/result/bin
    sudo ./switch-to-configuration switch

    sudo kill -9 -1 
}

fresh_install() {
    mk_dirs
    dotfiles
    nix_build
}

case $1 in 
    "fresh_install")
        fresh_install;;
    "mk_dirs")
        mk_dirs;;
    "nix_build")
        nix_build;;
    *)
        echo "Invalid option. Expected 'fresh_install', 'mk_dirs', or 'nix_build'";;
esac