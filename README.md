# Dotfiles

Personal dotfiles configuration for macOS development environment.

## Overview

This repository contains configuration files for various development tools and applications, managed with GNU Stow for easy symlink management.

## Contents

- **aerospace/** - AeroSpace window manager configuration
- **brew/** - Homebrew package management (Brewfile)
- **direnv/** - Directory-based environment configuration
- **ghostty/** - Ghostty terminal emulator settings
- **git/** - Git configuration
- **karabiner/** - Karabiner-Elements keyboard customization
- **nvim/** - Neovim editor configuration with Lua
- **tmux/** - Terminal multiplexer configuration
- **zed/** - Zed editor settings and keymaps
- **zsh/** - Zsh shell configuration

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Install dependencies via Homebrew:
   ```bash
   brew bundle --file=brew/Brewfile
   ```

3. Use Stow to symlink configurations:
   ```bash
   # Install all configurations
   stow */
   
   # Or install specific configurations
   stow nvim zsh tmux
   ```

## Key Tools

- **Terminal**: Ghostty
- **Editor**: Neovim with Lua configuration
- **Shell**: Zsh
- **Package Manager**: Homebrew
- **Window Manager**: AeroSpace
- **Keyboard Customization**: Karabiner-Elements
- **Version Control**: Git with custom configuration

## Neovim Setup

The Neovim configuration uses:
- Lazy.nvim plugin manager
- Modular Lua configuration structure
- Custom keymaps and globals

## Package Management

The Brewfile includes essential development tools:
- Command line utilities (ripgrep, fzf, bat, eza)
- Development tools (gh, lazygit, docker tools)
- Programming languages and runtimes
- Fonts and terminal applications

## Customization

Each directory contains specific configuration files that can be modified as needed. The modular structure allows for easy customization and selective installation of components.