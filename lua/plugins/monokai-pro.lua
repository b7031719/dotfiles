-- Color theme for Neovim
return {
	"loctvl842/monokai-pro.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		filter = "classic",
		styles = {
			comment = { italic = true },
			keyword = { italic = true }, -- any other keyword
			type = { italic = true }, -- (preferred) int, long, char, etc
			storageclass = { italic = true }, -- static, register, volatile, etc
			structure = { italic = true }, -- struct, union, enum, etc
			parameter = { italic = true }, -- parameter pass in function
			annotation = { italic = true },
		},
	},
	config = function(_, opts)
    require("monokai-pro").setup(opts)

		-- Set the color scheme for Neovim
		vim.cmd.colorscheme("monokai-pro")
	end,
}
