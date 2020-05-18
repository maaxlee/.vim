# Setup

1. Install
- *neovim*
- (vim-plug)[https://github.com/junegunn/vim-plug]
- *yarn* installed
- *ripgrep*
- *fzf*

2. Run PlugInstall
3. Install Coc extensions
- CocInstall coc-json
- CocInstall coc-python
- CocInstall coc-snippets
- CocInstall coc-explorer
4. Change Coc settings:
```json
{
  "languageserver": {
    "golang": {
      "command": "gopls",
      "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/"],
      "filetypes": ["go"]
    }
  },
  "explorer.previewAction.onHover": false,
  "explorer.icon.enableNerdfont": true,
  "explorer.keyMappings": {
    "<cr>": ["expandable?", "expand", "open"],
    "v": "open:vsplit"
  },
  "python.venvPath": "/home/maliseiko/venv",
  "python.jediEnabled": false
}
```
5. Install language servers

```
pip install python-language-server
```

# Keymaps
## Code navigation
```
gd Defenition
gr Referencies
gi Implementation
gy Type definition
<leader>rn rename
<space>a - enable linter
K - function documentation
<leader>f - format selected
```

## Pydocstring
Generate docstring
```
<leader>ds
```

## File explorer
```
<space>e run explorer
h - collapse node
```

# Tips and tricks
Fix vendoring for golang projects

```
export GOFLAGS="-mod=vendor"
```
and then run vim
