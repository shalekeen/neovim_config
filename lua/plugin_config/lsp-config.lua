require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "marksman",
        "jdtls",
        "kotlin_language_server",
        "rust_analyzer",
        "clangd",
        "cssls",
        "tsserver",
        "jsonls",
	"svelte",
    }
})
local lspconfig = require('lspconfig')
local lsp_servers = {
	"lua_ls",
	"marksman",
	"jdtls",
	"kotlin_language_server",
	"rust_analyzer",
	"clangd",
	"cssls",
	"tsserver",
	"jsonls",
	"svelte",
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
   -- Enable completion triggered by <c-x><c-o>
   client.server_capabilities.semanticTokensProvider = nil

   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
   if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
         group = augroup,
         buffer = bufnr,
         callback = function()
            vim.lsp.buf.format()
         end,
      })
end

   -- Mappings.
   -- See `:help vim.lsp.*` for documentation on any of the below functions
   local bufopts = { noremap = true, silent = true, buffer = bufnr }
   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
   vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, bufopts)
   vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
   vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
   vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
   end, bufopts)
   vim.keymap.set('n', '<C-i>', vim.lsp.buf.type_definition, bufopts)
   vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
   vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
   vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Cmp stuff
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, server in ipairs(lsp_servers) do
   lspconfig[server].setup {
      on_attach = on_attach,
      capabilities = capabilities,
   }
end

local patterns = { '*.lua', '*.tsx', '*.jsx', '*.ts', '*.js', '*.css', '*.html', '*.yaml', '*.rb', '*.java', '*.rs',
   '*.json', '*.sql' }

vim.api.nvim_create_augroup('AutoFormatting', {})
vim.api.nvim_create_autocmd('BufWritePre', {
   pattern = patterns,
   group = 'AutoFormatting',
   callback = function()
      vim.lsp.buf.format({ async = false })
   end,
})

-- null-ls config for linters and formatters
local null_ls = require('null-ls')
null_ls.setup({
    sources = {
	null_ls.builtins.formatting.prettierd.with({
		extra_filetypes = {"svelte"},
        })
    },
    on_attach = on_attach
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    source = "always",  -- Or "if_many"
  },
})

vim.api.nvim_set_keymap('n', '<C-d>', ':lua vim.diagnostic.open_float()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})

