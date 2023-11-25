require("mason").setup()
require("mason-lspconfig").setup()

local servers = {
  tsserver = {},
  tailwindcss = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

require("neodev").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers),
})

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  -- vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set("n", "sh", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  vim.keymap.set("n", "[g", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
  vim.keymap.set("n", "]g", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
  vim.keymap.set(
    { "n", "x" },
    "<A-y>",
    "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
    opts
  )
  vim.keymap.set(
    "n",
    "<leader>ac",
    "<cmd>lua vim.lsp.buf.code_action()<cr>",
    opts
  )
  vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
end

mason_lspconfig.setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    })
  end,
})

-- Handling diagnostics better
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = false,
  })
