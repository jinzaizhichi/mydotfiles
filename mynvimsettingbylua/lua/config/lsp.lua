local api = vim.api
local lsp = vim.lsp

local M = {}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
local navic = require("nvim-navic")
-- It's good practice to namespace custom handlers to avoid collisions
vim.diagnostic.config({
  underline = false,
  virtual_text = {
    true,
    severity = vim.diagnostic.severity.ERROR
  },
  signs = {
    true,
    severity = vim.diagnostic.severity.ERROR
  },
  severity_sort = true,
  update_in_insert = false,
})

-- Change diagnostic signs.
vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "⚡", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

local custom_attach = function(client, bufnr)
  -- Mappings.
  local opts = {silent = true, buffer = bufnr}
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<2-LeftMouse>", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<space>wl", function() inspect(vim.lsp.buf.list_workspace_folders()) end, opts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "[a", function() vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR}) end, opts)
  vim.keymap.set("n", "]a", function() vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR}) end, opts)
  vim.keymap.set("n", "<space>q", function() vim.diagnostic.setqflist({open = true, severity = vim.diagnostic.severity.ERROR}) end, opts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)

  -- Set some key bindings conditional on server capabilities
  if client.server_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
  end
  if client.server_capabilities.document_range_formatting then
    buf_set_keymap("x", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR><ESC>", opts)
  end

  --if client.server_capabilities.document_highlight then
  vim.cmd([[
    hi link LspReferenceRead Visual
    hi link LspReferenceText Visual
    hi link LspReferenceWrite Visual
    highlight DiagnosticVirtualTextError guifg=Gray
    highlight DiagnosticError guifg=Gray
    highlight DiagnosticSignError guifg=Gray
    highlight DiagnosticFloatingError guifg=Gray
    highlight DiagnosticUnderlineError guifg=Gray
    highlight DiagnosticVirtualTextWarn guifg=Gray
    highlight DiagnosticWarn guifg=Gray
    highlight DiagnosticSignWarn guifg=Gray
    highlight DiagnosticFloatingWarn guifg=Gray
    highlight DiagnosticUnderlineWarn guifg=Gray
  ]])
  --end

  --augroup lsp_document_highlight
  --autocmd! * <buffer>
  --autocmd cursorhold <buffer> lua vim.lsp.buf.document_highlight()
  --autocmd cursormoved <buffer> lua vim.lsp.buf.clear_references()
  --augroup end

  if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
  end

  require 'illuminate'.on_attach(client)
  if vim.g.logging_level == 'debug' then
    local msg = string.format("Language server %s started!", client.name)
    vim.notify(msg, 'info', {title = 'nvim-config'})
  end
end

local nvim_lsp = require("lspconfig")

-- Change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
lsp.handlers["textDocument/hover"] = lsp.with(
  lsp.handlers.hover,
  {
    border = "rounded",
  }
)

vim.cmd([[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
  augroup END
]])

--set up markdown lsp
nvim_lsp.remark_ls.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}

--set up c/c++ lsp
nvim_lsp.clangd.setup({
  on_attach = custom_attach,
  capabilities = capabilities,
  single_file_support = false,
  cmd = { "clangd"},
  root_dir = nvim_lsp.util.root_pattern("compile_commands.json"),
  filetypes = { "c", "cpp", "cc", "h" },
  index = {
    threads = 2,
  },
  flags = {
    debounce_text_changes = 1000,
  },
})

--set up python lsp
nvim_lsp.pylsp.setup({
  on_attach = custom_attach,
  capabilities = capabilities,
  single_file_support = true,
  root_dir = nvim_lsp.util.root_pattern(".root", "compile_commands.json", "compile_flags.txt", ".git") or dirname,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  },
  flags = {
    debounce_text_changes = 1000,
  },
})

--set up vim lsp
nvim_lsp.vimls.setup({
  on_attach = custom_attach,
  flags = {
    debounce_text_changes = 500,
  },
  single_file_support = true,
  capabilities = capabilities,
})

--set up bash lsp
nvim_lsp.bashls.setup({
  on_attach = custom_attach,
  root_dir = nvim_lsp.util.root_pattern(".root"),
  flags = {
    debounce_text_changes = 500,
  },
  capabilities = capabilities,
})

--set up sql lsp
nvim_lsp.sqls.setup({
  on_attach = custom_attach,
  flags = {
    debounce_text_changes = 500,
  },
  capabilities = capabilities,
})

--set up json lsp
nvim_lsp.jsonls.setup({
  on_attach = custom_attach,
  flags = {
    debounce_text_changes = 500,
  },
  single_file_support = true,
  capabilities = capabilities,
})

--set up go lsp
nvim_lsp.gopls.setup({
  on_attach = custom_attach,
  flags = {
    debounce_text_changes = 500,
  },
  capabilities = capabilities,
})

--set up xml lsp
nvim_lsp.lemminx.setup({
  on_attach = custom_attach,
  flags = {
    debounce_text_changes = 500,
  },
  capabilities = capabilities,
})

local sumneko_binary_path = vim.fn.exepath("lua-language-server")
if vim.g.is_mac or vim.g.is_linux and sumneko_binary_path ~= "" then
  local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ":h:h:h")

  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  nvim_lsp.sumneko_lua.setup({
    on_attach = custom_attach,
    cmd = { sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
    capabilities = capabilities,
  })
end

return M
