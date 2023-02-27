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

-- Add spaces between parentheses
local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
autopairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({
        brackets[1][1]..brackets[1][2],
        brackets[2][1]..brackets[2][2],
        brackets[3][1]..brackets[3][2],
      }, pair)
    end)
}
for _,bracket in pairs(brackets) do
  autopairs.add_rules {
    Rule(bracket[1]..' ', ' '..bracket[2])
      :with_pair(function() return false end)
      :with_move(function(opts)
        return opts.prev_char:match('.%'..bracket[2]) ~= nil
      end)
      :use_key(bracket[2])
  }
end

-- Arrow key on javascript
autopairs.add_rules {
  Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
    :use_regex(true)
    :set_end_pair_length(2),
}
