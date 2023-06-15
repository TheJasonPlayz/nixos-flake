#! /usr/bin/env bash

script_dir=$(pwd)

nix build .#nixosConfigurations.main-desktop.config.system.build.toplevel

cd $script_dir/result/bin
sudo ./switch-to-configuration switch