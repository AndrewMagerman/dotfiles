-- ~/.config/nvim/lua/custom/lsp.lua
local M = {}

function M.setup(opts)
  opts = opts or {}
  local servers = opts.servers or {}
  local ensure = opts.ensure_installed or vim.tbl_keys(servers)

  -- Capabilities (Blink)
  local caps = vim.lsp.protocol.make_client_capabilities()
  local ok_blink, blink = pcall(require, 'blink.cmp')
  if ok_blink and blink.get_lsp_capabilities then
    caps = blink.get_lsp_capabilities(caps)
  end

  -- Per-server config (new API)
  for name, cfg in pairs(servers) do
    cfg = vim.tbl_deep_extend('force', { capabilities = caps }, cfg or {})
    vim.lsp.config(name, cfg)
  end

  -- Mason v2: install, but don't auto-enable the servers we configure here
  local configured = vim.tbl_keys(servers)

  require('mason').setup {}
  require('mason-tool-installer').setup { ensure_installed = ensure }
  require('mason-lspconfig').setup {
    ensure_installed = ensure,
    automatic_enable = { exclude = configured }, -- <- important
  }

  -- Explicitly enable our configured servers (uses vim.lsp.config settings)
  if #configured > 0 then
    vim.lsp.enable(configured)
  end

  -- No keymaps here (you set them via LspAttach in init.lua)
end

return M
