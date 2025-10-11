# Neovim Configuration Directory Structure

This document lists the **directories and files with semantic meaning** in a Neovim configuration (i.e., directories that Neovim itself treats specially, not just user conventions).  
The paths below assume a typical Unix setup, where the configuration root is:

```
~/.config/nvim
```

---

## 📂 Directory Overview

```
~/.config/nvim
├─ init.lua                  # Entry point – always loaded first
├─ plugin/                   # Auto-sourced at startup (every file here runs)
├─ after/                    # Late overrides; mirrors other directories below
│  ├─ plugin/                # Late plugin configs
│  ├─ ftplugin/              # Late per-filetype configs
│  ├─ syntax/                # Late syntax overrides
│  └─ queries/               # Late Tree-sitter query overrides
├─ ftplugin/                 # Per-filetype settings (e.g. python.lua)
├─ ftdetect/                 # Filetype detection (sets 'ft' for new files)
├─ syntax/                   # Legacy (Vimscript) syntax additions or overrides
├─ colors/                   # Color schemes (:colorscheme <name>)
├─ queries/                  # Tree-sitter highlight/fold/injection queries (*.scm)
├─ indent/                   # Indentation rules per filetype
├─ compiler/                 # :compiler definitions for build/test integration
├─ spell/                    # Spell files (e.g. en.utf-8.add)
├─ autoload/                 # Legacy Vimscript autoloaded functions (foo#bar())
├─ doc/                      # Help files (:helptags and :help)
├─ pack/                     # Native package management (built-in plugin system)
│  └─ mypack/
│     ├─ start/<plugin>/     # Auto-loaded packages
│     └─ opt/<plugin>/       # Optional packages (:packadd <plugin>)
└─ lsp/                      # (Neovim ≥0.11) LSP configs by server name
   └─ basedpyright.lua       # Returns a config table, enabled via vim.lsp.enable("basedpyright")
```

---

## 🧩 Notes

- **`plugin/`** – Every `.lua` or `.vim` file here is executed automatically at startup.  
  Commonly used for always-on keymaps, options, or LSP setup.

- **`after/`** – Loaded *after* everything else.  
  Mirrors the other directories so you can override settings safely.

- **`ftplugin/`** – Runs only for buffers of the matching filetype (`python.lua`, `markdown.vim`, etc.).

- **`queries/`** – Contains Tree-sitter customization files like `highlights.scm`, `injections.scm`, and `folds.scm`.  
  (Use `after/queries/` for overrides.)

- **`pack/*/{start,opt}`** – Built-in package system (no external plugin manager required).  
  - `start/` plugins load automatically on startup.  
  - `opt/` plugins must be manually loaded with `:packadd`.

- **`lsp/` (since Neovim 0.11)** – Drop-in configuration files for LSP servers.  
  Each file’s name defines its server name, and it should **return a Lua table** describing the configuration.  
  Example:
  ```lua
  -- ~/.config/nvim/lsp/basedpyright.lua
  return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", ".git" },
    settings = { basedpyright = { analysis = { typeCheckingMode = "standard" } } },
  }
  ```
  Then enable it with:
  ```lua
  vim.lsp.enable("basedpyright")
  ```

---

## 🧠 Additional Facts

- `lua/` is **not** special by itself — it’s simply a place for Lua modules you can `require()`.  
  It’s a *convention*, not an auto-sourced directory.
- `init.lua` (or `init.vim`) is always loaded first.
- Files under these directories are discovered through Neovim’s **runtimepath** (`:echo &rtp`).

---

## 🔍 References

- `:help runtimepath`
- `:help initialization`
- `:help lsp-config`
- [Neovim 0.11 LSP documentation](https://neovim.io/doc/user/lsp.html)
- [Neovim source: runtimepath loading order](https://github.com/neovim/neovim/tree/master/runtime)
