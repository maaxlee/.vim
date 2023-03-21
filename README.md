# Setup

1. Install
- *neovim*
- (vim-plug)[https://github.com/junegunn/vim-plug]
- *npm* installed
- *ripgrep*
- *fzf*

2. Run PlugInstall
3. Install lsp servers

```
# in a venv/pyenv
pip install robotframework-lsp

npm i -g pyright
npm i -g bash-language-server
npm i -g dockerfile-language-server-nodejs

```

# Keymaps
## Code navigation
```
gd Defenition
gD Declaration
gi Implementation
gr References
<space>D Type defenition
<space>rn Rename
<space>a Diagnosis list
]d Next diagnosis item
[d Next diagnosis item

```

## Pydocstring
Generate docstring
```
<leader>ds
```

## File explorer
NerdTree <C-t>

## Symbols list
```
<space>vv open Sympols list by vista
```

# Tips and tricks
Fix vendoring for golang projects

```
export GOFLAGS="-mod=vendor"
```
and then run vim
