-- lua/custom/indent.lua
-- Andrew's tab & indent policy
-- Default: 4-space soft tabs
-- Exceptions: Make/Go hard tabs; common web/markup 2 spaces; explicit Python 4

local M = {}

function M.setup()
  -- === Global defaults (apply to all buffers unless overridden) ===
  vim.opt.expandtab = true
  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 4
  vim.opt.softtabstop = 4
  vim.opt.smarttab = true

  -- Try to enable guess-indent, but don't error if it's not loaded yet.
  pcall(function()
    require('guess-indent').setup {
      auto_cmd = true,
      -- exclude filetypes we explicitly manage so guessing won't fight us
      filetype_exclude = {
        'netrw',
        'tutor',
        'make',
        'makefile',
        'go',
        'lua',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'json',
        'jsonc',
        'yaml',
        'yml',
        'html',
        'css',
        'scss',
        'markdown',
        'markdown.mdx',
      },
      buftype_exclude = { 'help', 'nofile', 'terminal', 'prompt' },
      override_editorconfig = false,
    }
  end)

  -- === Filetype-specific overrides ===
  local grp = vim.api.nvim_create_augroup('andrew_tabs', { clear = true })

  -- 1) Makefiles: MUST use real tabs (width 8)
  vim.api.nvim_create_autocmd('FileType', {
    group = grp,
    pattern = { 'make', 'makefile' },
    callback = function()
      -- schedule so we run after any plugin FileType handlers
      vim.schedule(function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.softtabstop = 0
      end)
    end,
  })

  -- 2) Go: gofmt uses hard tabs (display width 8)
  vim.api.nvim_create_autocmd('FileType', {
    group = grp,
    pattern = { 'go' },
    callback = function()
      -- schedule so we run after any plugin FileType handlers
      vim.schedule(function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.softtabstop = 0
      end)
    end,
  })

  -- 3) Common 2-space ecosystems (web/markup)
  vim.api.nvim_create_autocmd('FileType', {
    group = grp,
    pattern = {
      'lua',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'json',
      'jsonc',
      'yaml',
      'yml',
      'html',
      'css',
      'scss',
      'markdown',
      'markdown.mdx',
    },
    callback = function()
      vim.schedule(function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
      end)
    end,
  })

  -- 4) Python: explicit 4-space
  vim.api.nvim_create_autocmd('FileType', {
    group = grp,
    pattern = { 'python' },
    callback = function()
      vim.schedule(function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
      end)
    end,
  })

  -- Optional: prevent Normal-mode <Tab> from acting like <C-i> (jumplist forward)
  -- Uncomment if you find yourself jumping by accident:
  -- vim.keymap.set('n', '<Tab>', '<Nop>')
end

return M
