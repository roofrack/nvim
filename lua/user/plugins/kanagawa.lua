-- NOTE: Must source file and run :kanagawaCompile if making any changes to this file

local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
	return
end

-- Default options:
kanagawa.setup({
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	-- transparent = false, -- do not set background color
	transparent = false, -- do not set background color
	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = { -- add/modify theme and palette colors
		-- look an kanagawa nvim website at bottom for description of whats what
		palette = {
			-- sumiInk3 = "#2A2A2E", -- Rob you added this to give a nicer cursorline color
			-- the above sumiInk3 didnt make the cursorline better so I have an autocommand set inside
			-- the autocommands.lua file to do this
			sumiInk4 = "#1F1F28", -- lighter indent lines and line numbers
		},
		-- theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
	--[[ overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave"               -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    }, ]]
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
