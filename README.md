# lexming's dotfiles

Collection of dotfiles structured to be managed with
[GNU Stow](https://www.gnu.org/software/stow/).

```
$ stow -t "$HOME" bash
```

## GNU Bash

🏠 https://www.gnu.org/software/bash/  
📌 [dotfiles](dots/bash)

## Starship

🏠 https://starship.rs/  
📌 [dotfiles](dots/starship/.config)

Light customization of the default [Starship](https://starship.rs/) prompt
for [GNU Bash](https://www.gnu.org/software/bash/) showing the local time and
current command line number in history.

Example screenshot in combination with [JetBrainsMono](https://github.com/JetBrains/JetBrainsMono)
![Starship prompt screenshot](/assets/starship_prompt.png)

## Neovim

🏠 https://neovim.io/  
📌 [dotfiles](dots/neovim/.config/nvim)

Lean configuration for neovim that enhances its role as a quick text editor,
avoiding bloating it up to a fully fledged IDE.

![Neovim screenshot](/assets/nvim_screen.png)

### Plugins

* Plugin manager: [folke/lazy.nvim](https://github.com/folke/lazy.nvim)
* Color Theme: [EdenEast/nightfox.nvim](https://github.com/EdenEast/nightfox.nvim)
* Tree-sitter: [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* LSP client configs: [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* LSP server manager: [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
* Git Decorations: [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
* Gist Integration: [Rawnly/gist.nvim](https://github.com/Rawnly/gist.nvim)
* Document position: [vladdoster/remember.nvim](https://github.com/vladdoster/remember.nvim)
* Soft scrolling: [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)
* Indentation guides: [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
* Better statusline: [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
* Quick motions: [ggandor/leap.nvim](https://github.com/ggandor/leap.nvim)
