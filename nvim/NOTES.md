# Neovim

Trigger auto completion
https://stackoverflow.com/questions/77697425/how-to-trigger-lsp-suggestion-popup-in-neovim
Ctrl+Space

Run Lua code
```lua
:lua <some lua here>
```

Open watch at cursor
```lua
:lua require("dap.ui.widgets").hover(nil, { border = "rounded" })
```

Open watch at cursor (within modal)
```lua
:lua require("dapui").eval()
```
