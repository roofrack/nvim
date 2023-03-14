-- [ Some functions to use in the snippets ] ---------------

local calculateHeadingLength = function(index)
	return f(function(arg)
		-- print(vim.inspect(insert1_len))
		-- Not sure why I need to use double [1][1] here but finially got
		-- this to work. So what ever is entered into the first insert node 'Heading' snippet
		-- gets its length calculated and returns a line of appropriate total length of 60. Fun!
		local nodeInsert1_length = #arg[1][1]
		local char = "-"
		local line_length = 52 - nodeInsert1_length
		local line = string.rep(char, line_length)
		return line
	end, { index })
end

return {

	------------------------------------------------------------
	s(
		"heading ] ----------",
		fmt(
			[[
  -- [ {} ] {}
  {}
  ]],
			{ i(1, "STUFF"), calculateHeadingLength(1), i(0) }
		)
	),
	------------------------------------------------------------

}
