# Setup

1. Install
- *neovim*
- (vim-plug)[https://github.com/junegunn/vim-plug]
- *yarn* installed

2. Run PlugInstall
3. Install Coc extensions
- CocInstall coc-json
- CocInstall coc-python
- CocInstall coc-snippets
4. Change Coc settings:
```
{
  "languageserver": {
    "golang": {
      "command": "gopls",
      "rootPatterns": ["go.mod", ".vim/", ".git/", ".hg/"],
      "filetypes": ["go"]
    }
  },
  "python.venvPath": "/home/maliseiko/venv"
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
