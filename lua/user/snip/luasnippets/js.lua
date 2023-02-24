local ls = require("luasnip")
local types = require("luasnip.util.types")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local l = require("luasnip.extras").lambda
local postfix = require("luasnip.extras.postfix").postfix
local rep = require("luasnip.extras").rep

ls.filetype_extend("typescript", { "javascript" }) -- Rob you added this to add js snippets to typescript
ls.add_snippets("javascript", {

	------------------------------------------------------------

	s("happy", t("console.log()")),

	------------------------------------------------------------

	s("/", {
		t({ "/** @type {import('.$types')." }),
		i(1, " JSDocs Stuff"),
		t({ "} */" }),
	}),

	------------------------------------------------------------
})
