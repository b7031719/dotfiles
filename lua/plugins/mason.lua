return {
	{
		"mason-org/mason.nvim",
    enabled = function()
      local is_nixos = vim.fn.executable("nixos-version") == 1      -- Do not enable if on NixOS as Mason installed binaries conflict with Nix
      return not is_nixos
    end,
    opts = {},
	},
	{
		-- Mason-lspconfig provides the ensure-installed function for installing language servers
		"mason-org/mason-lspconfig.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"bashls",
				"html",
				"cssls",
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"eslint_d",
				"flake8",
				"stylua",
				"prettier",
				"black",
				"isort",
			},
			automatic_installation = true,
			handlers = {},
		},
	},
}
