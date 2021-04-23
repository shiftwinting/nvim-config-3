-- luke reineke format.nvim setup (clone of mhartington rewritten)
-- https://github.com/lukas-reineke/format.nvim
-- require'format'.setup {
-- ["*"] = {
--         {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
--     },
-- lua = {
--         {
--             cmd = { 'luafmt -w replace' },
--         }
--     }
-- }
require"format".setup     {
  -- ["*"] = {
  --     {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
  -- },
  vim = {{cmd = {"luafmt -w replace"}, start_pattern = "^lua << EOF$", end_pattern = "^EOF$"}},
  vimwiki = {
    {cmd = {"prettier -w --parser babel"}, start_pattern = "^{{{javascript$", end_pattern = "^}}}$"}
  }, 
  lua = {
    {
      cmd = {
        function(file)
          return string.format(
                   [[lua-format -c '/home/f1/.config/nvim/formatconfig/packer.lua-format' -i %s]],
                   file)
        end
      }
    }
  },

-- lua = {
--         {
--             cmd = {
--                 function(file)
--                     return string.format("luafmt -l %s -w replace %s", 160, file)
--                 end
--             }
--         }
--     },
  go = {{cmd = {"gofmt -w", "goimports -w"}, tempfile_postfix = ".tmp"}},
  javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
  markdown = {
    {cmd = {"prettier -w"}},
    --{cmd = {"black"}, start_pattern = "^```python$", end_pattern = "^```$", target = "current"}
    --{cmd = {'luafmt -w replace'}, start_pattern = [[```lua]], end_pattern = [[```]]}
  }
}

-- mhartington formatter.nvim setup
-- require('formatter').setup({
--   logging = false,
--   filetype = {
--     javascript = {
--         -- prettier
--        function()
--           return {
--             exe = "prettier",
--             args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
--             stdin = true
--           }
--         end
--     },
--     rust = {
--       -- Rustfmt
--       function()
--         return {
--           exe = "rustfmt",
--           args = {"--emit=stdout"},
--           stdin = true
--         }
--       end
--     },
--     lua = {
--         -- luafmt
--         function()
--           return {
--             exe = "lua-format",
--            args = { vim.api.nvim_buf_get_name(0) },
--             stdin = true
--           }
--         end
--       }
--   }
-- })

