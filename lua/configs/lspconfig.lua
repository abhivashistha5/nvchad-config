require("nvchad.configs.lspconfig").defaults()

-- read :h vim.lsp.config for changing options of lsp servers
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- local util = require "lspconfig/util"

local servers = {
  -- {
  --   "rust_analyzer",
  --   {
  --     on_attach = on_attach,
  --     capabilities = capabilities,
  --     filetypes = { "rust" },
  --     root_dir = util.root_pattern "Cargo.toml",
  --     settings = {
  --       ["rust-analyzer"] = {
  --         cargo = {
  --           allFeatures = true,
  --         },
  --       },
  --     },
  --   },
  -- },
  { "ts_ls" },
  { "cssls" },
  { "lua_ls" },
  { "html" },
  {
    "yamlls",
    {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "yaml" },
      settings = {
        yaml = {
          customTags = {
            "!reference sequence", -- for gitlab-ci
          },
        },
      },
    },
  },
  { "clangd" },
}

for _, lsp in pairs(servers) do
  local name, config = lsp[1], lsp[2]
  vim.lsp.enable(name)
  if config then
    vim.lsp.config(name, config)
  end
end
