
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "css", "html", "javascript", "json", "lua", "php", "toml", "yaml" }, -- had to leave out typescript because of tar error
  highlight = {
    enable = true,              -- false will disable the whole extensio
  },
  indent = {
  enable = true

  },
  incremental_selection = {
      enable = true,
        keymaps = {
        init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
      },
}

















