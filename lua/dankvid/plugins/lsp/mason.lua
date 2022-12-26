local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end


mason.setup()
--https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md
mason_lspconfig.setup({
  ensure_installed = {
    "clangd",
    "gopls",
    "jdtls",
    "sumneko_lua"
  }
})

mason_null_ls.setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "cpplint",
    "golangci-lint"

  }
})
