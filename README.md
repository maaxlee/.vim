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
    },
    "robot": {
        "command": "robotframework_ls",
        "filetypes": ["robot"]
    }
  },
  "explorer.previewAction.onHover": false,
  "explorer.icon.enableNerdfont": true,
  "explorer.keyMappings.global": {
    "<cr>": ["expandable?", "expand", "open"],
    "v": "open:vsplit"
  },
  "clangd.enabled": true,
  "python.venvPath": "/home/maaxlee/venv",
  "python.jediEnabled": false,
  "python.envFile": "${workspaceFolder}/.env",
  "python.linting.enabled": true,
  "python.linting.flake8Enabled": true,
  "python.linting.lintOnSave": true,
  "python.linting.flake8Args": ["--max-line-length=119"],
  "python.linting.pylintEnabled": false,
  "http.proxy": "http://myproxy:8080"
}
```
5. Robot framework support (only python >=3.7)

```
pip install robotframework-lsp
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
<space>r run for open buffers
h - collapse node
```


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
