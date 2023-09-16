require('nvim-treesitter.install').prefer_git = true

local disable_function = function(lang)
		local buf_name = vim.fn.expand("%")
		if string.find(buf_name, ".typ") then
			return true
		end
	end

require('nvim-treesitter.configs').setup({
    ensure_installed = {"jsdoc", "css", "javascript", "kotlin", "latex",
    			"lua", "make", "markdown", "markdown_inline", 
			"java", "svelte", "typescript", "rust", "sql", 
			"cpp", "c", "cmake", "vim", "python"},
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
	disable = disable_function
    },
    indent = { enable = true, disable = {"python", "css"} },
})
