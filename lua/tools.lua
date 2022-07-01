-- Intro to the lua vim api
-- https://teukka.tech/luanvim.html

-- local api = vim.api

local M ={}

-- function M.makeScratch()
  -- print("this is inside scratch")
  --[[ api.nvim_command('enew') -- equivalent to :enew
  vim.bo[0].buftype="nofile"
  vim.bo[0].bufhidden="hide"
  vim.bo[0].swapfile=false ]]
-- end


function M.happy()
  print("hello Robert")
end

vim.api.nvim_exec([[ command! Scratch lua require'tools'.happy() ]], false)

return M


-- So now to run this code can enter the following in the command line...
-- lua require'tools'.makeScratch()
-- Could also make a command for it by...
-- command! Scratch lua require'tools'.makeScratch()
-- and so now just enter Scratch in the command line

