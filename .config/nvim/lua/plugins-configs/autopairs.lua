local autopairs_ok, autopairs = pcall(require, 'nvim-autopairs')
if not autopairs_ok then
	vim.notify("There was a problem while requiring nvim-autopairs plugin")
end

local Rule_ok, Rule = pcall(require, 'nvim-autopairs.rule')
if not Rule_ok then
	vim.notify("There was a problem while requiring autopairs.Rule")
end

autopairs.setup({
  check_ts = true,
  fast_wrap = {
      map = '<leader>p',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },
})

-- Arrow key on javascript
autopairs.add_rules {
  Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
    :use_regex(true)
    :set_end_pair_length(2),
}
