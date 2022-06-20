
-- [ General settings] -------------------------------------
-- Lets use a little Lua here to set the options.

local options = {
  wrap = false,                            -- display lines as one long line
  fileencoding = "utf-8",                  -- the encoding written to a file
  mouse = "a",                             -- allow the mouse to be used in neovim
  number = true,                           -- set numbered lines
  cursorline = true,                           -- set numbered lines
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  termguicolors = true,
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


-- [ White space ] -----------------------------------------
-- Or you can set options the plain old regular way.
  vim.opt.expandtab = true                        -- convert tabs to spaces
  vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
  vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
