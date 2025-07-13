# Neovim configuration

## Introduction

*This is a fork of [nvim-lua/kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim) which is a fork of [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) that moves from a single file to a multi file configuration.*

Neovim configuration that is

* Small
* Modular
* Slightly Documented

## Understand the configuration

*You must have some experience with the lua language and neovim editor. Watch a 15 minutes video on each and you are good to go*

It is divided in 4 main files, appart from the init.lua one. This files are under the lua directory.

* keymaps.lua
* lazy-bootstrap.lua
* lazy-plugins.lua
* options.lua

```
.
├── init.lua
├── lua
│   ├── custom
│   │   └── plugins
│   │       └── init.lua
│   ├── keymaps.lua
│   ├── kickstart
│   │   ├── health.lua
│   │   └── plugins
│   │       ├── autopairs.lua
│   │       ├── blink-cmp.lua
│   │       ├── colorscheme.lua
│   │       ├── conform.lua
│   │       ├── gitsigns.lua
│   │       ├── lspconfig.lua
│   │       ├── markdown.lua
│   │       ├── mini.lua
│   │       ├── neo-tree.lua
│   │       ├── telescope.lua
│   │       ├── todo-comments.lua
│   │       ├── treesitter.lua
│   │       └── which-key.lua
│   ├── lazy-bootstrap.lua
│   ├── lazy-plugins.lua
│   └── options.lua
└── README.md
```


### Keymaps

Defines global keymaps for core functions of neovim

*Search about neovim keymaps, modes and the commands/actions so you understand what is happening*

The keymaps are:

| Keys     | Mode | Command/Action      |
|----------|-----|-----------|
| `<esc>`    | n  | :nohlsearch  |
| `<leader>`q      | n  | LSP quick diagnostics     |
| `<leader>`ca      | n  | LSP code actions     |
| `<esc><esc>`  | t  | Exit terminal mode     |
| `<c-h>` | n | Moves windows focus to the left |
| `<c-j>` | n | Moves windows focus down |
| `<c-k>`| n | Moves windows focus up |
| `<c-l>`   | n | Moves windows focus to the right |
| H | n | Goes to the previous buffer |
| L | n | Goes to the next buffer |

*Bear in mind that keymaps are case sensitive*

#### Recommended

[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo
so that you have your own copy that you can modify, then install by cloning the
fork to your machine.

