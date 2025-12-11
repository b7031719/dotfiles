-- All language servers are configured in this file
return {
  {
    -- Neovim built in LSP client
    -- Sends and receives events from Neovim to language servers via language server protocol
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              -- Prevents the vim commands from being highlighted as an error
              globals = { "vim" },
            },
          },
        },
      })
      vim.lsp.config('pyright', {
        capabilities = capabilities,
      })
      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
      })
      vim.lsp.config('bashls', {
        capabilities = capabilities,
      })
      vim.lsp.config('html', {
        capabilities = capabilities,
      })
      vim.lsp.config('cssls', {
        capabilities = capabilities,
      })

      -- keymaps for language server functions
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>oi", function()
        vim.lsp.buf.code_action({
          context = { only = { "source.organizeImports" } },
          apply = true,
        })
      end)
    end,
  },
}
