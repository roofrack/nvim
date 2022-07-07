-- This works but do not know how to use the "nodes" in these snippets
-- so I am just going to use place snippets in the luasnip config file for now and
-- use the "add_snippet function".
-- Maybe down the road I can figure this out and organize my snippets by filetype.

return {
  parse({trig = "trigger"}, "loaded!!"),
  parse({trig = "AnotherExample"}, "This loaded too!!")
}
