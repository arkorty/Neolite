require("neo-tree").setup({
	hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
	-- in whatever position is specified in window.position
	-- "open_current",  -- netrw disabled, opening a directory opens within the
	-- window like netrw would, regardless of window.position
	-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
})
