This document describes the objectives

# Purpose

I want to use a combination of software that I want to use consistently in different target systems. I am trying for a way to maintain this setup in such a way that it is portable between the systems.

# Target machines

## Macbook pro Apple M1 Max

## Work Thinkpad with WSL

## Devcontainer

Here I want to use the Devcontainer dotfiles methodology, i.e. I will need an installation script as well

# Desired setup/software

- use the XDG Base Directory Specification

## Software

- shell: zsh with oh-my-zsh
- terminal: ghostty
- tmux
- neovim

# Existing setup

- chezmoi used, current repo for chezmoi is `https://github.com/AndrewMagerman/.dotfiles`. current repo on macbook is /Users/andrewmagerman/.local/share/chezmoi
- cluttered $HOME Directory
- tmux conf is in ~/.tmux.conf. tmux plugins are in ~/.config/tmux/plugins/
- oh-my-zsh folder is in ~/.oh-my-zsh
- nvim config is in ~/.config/nvim
