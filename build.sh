#! /usr/bin/env bash

script_dir = $(pwd)

nix build .#nixosConfigurations.jasonw.config.system.build.topLevel

cd $pwd/result/bin
sudo ./switch-to-configuration switch