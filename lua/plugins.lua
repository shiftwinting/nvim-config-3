local execute = vim.api.nvim_command
local fn = vim.fn
-- orig: local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

-- install path for packer
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end


local packer = nil
local function init()
  if packer == nil then
    packer = require('packer')
    util = require('packer.util')
    -- usein directory location
    packer.init({disable_commands = true})
  end

  local use = packer.use
  local use_rocks = packer.use_rocks
  packer.reset()

  -- Packer
-- how to put useins into separate folders:
-- use {'dracula/vim', as = 'dracula/draculaasd2'}
use {'wbthomason/packer.nvim', opt = true}

-- new plugins to try
-- use 'b3nj5m1n/kommentary'
-- use 'beauwilliams/statusline.lua'
use 'tpope/vim-commentary'
use 'akinsho/nvim-bufferline.lua' -- my own pick

-- other bufferlines 
-- https://github.com/romgrk/barbar.nvim

use {
  'glepnir/galaxyline.nvim',
    branch = 'main',
    -- your statusline
    -- some optional icons
    --requires = {'kyazdani42/nvim-web-devicons', opt = true}
}


use 'mhinz/vim-lookup'
----- end new plugins ----


-- telescope & extensions
use 'nvim-lua/popup.nvim'
use 'nvim-lua/plenary.nvim'
use {
'nvim-telescope/telescope.nvim',
    depends = { 'kyazdani42/nvim-web-devicons', opt = true }
}




use 'nvim-telescope/telescope-packer.nvim'

-- lua 
use 'rafcamlet/nvim-luapad'
use 'bfredl/nvim-luadev'
use 'tjdevries/nlua.nvim'
use 'euclidianAce/BetterLua.vim'
-- use 'tjdevries/vlog.nvim'
-- use 'tjdevries/manillua.nvim'


-- lsp 
use 'neovim/nvim-lspconfig'

 use 'nvim-lua/completion-nvim'

use 'C:/Users/F1/AppData/Local/nvim/plugins-me/Ultipreview'
--use 'C:/Users/F1/AppData/Local/nvim/plugins-manual/completion-nvim'
use 'tjdevries/lsp_extensions.nvim'
use 'ncm2/float-preview.nvim'
use 'glepnir/lspsaga.nvim'
use 'kosayoda/nvim-lightbulb'
use 'nvim-lua/lsp-status.nvim'


-- lsp snippets
use 'honza/vim-snippets'
use 'SirVer/ultisnips'


-- treesitter
-- use 'christianchiarulli/nvcode-color-schemes.vim'
use 'nvim-treesitter/nvim-treesitter'
use 'nvim-treesitter/playground'


--other 
use 'equalsraf/neovim-gui-shim'

-- viml
-- use '907th/vim-auto-save'

use {
  'lambdalisue/fern.vim',
    requires = {'lambdalisue/fern-renderer-nerdfont.vim', opt = true}
}


use { 
  'kyazdani42/nvim-web-devicons',
  commit = 'aaffb87',
  opt = true
  }


use 'junegunn/fzf.vim'
use 'mhinz/vim-startify'


-- font icons
use 'lambdalisue/nerdfont.vim'
use 'lambdalisue/glyph-palette.vim'
use 'ryanoasis/vim-devicons'

use 'tjdevries/colorbuddy.vim'
-- treesitter full lua awesome-neovim color schemes



-- colorbuddy themes
use { 'Th3Whit3Wolf/onebuddy', opt = false}
use {'Th3Whit3Wolf/spacebuddy', opt = false}
use { 'ishan9299/modus-theme-vim', opt = false}
-- https://github.com/tjdevries/gruvbuddy.nvim

-- awesome neovim themes
-- 
use 'Th3Whit3Wolf/one-nvim'
use { 'kyazdani42/blue-moon', opt = false}
use { 'glepnir/zephyr-nvim', opt = false}
use { 'rockerBOO/boo-colorscheme-nvim', opt = false}


use { 'theniceboy/nvim-deus', opt = false}
use { 'bkegley/gloombuddy', opt = false}
use { 'kyazdani42/blue-moon', opt = false}


-- coc 
-- use 'neoclide/coc.nvim', {'branch': 'release'}
-- use 'rafcamlet/coc-nvim-lua'

-- leave out replaced plugins
-- use 'liuchengxu/vim-which-key'
-- use 'vim-airline/vim-airline'
-- use 'vim-airline/vim-airline-themes'
-- use 'puremourning/vimspector'
-- use 'mfussenegger/nvim-dap'
-- use 'theHamsta/nvim-dap-virtual-text'
use 'tpope/vim-scriptease'
-- use 'vim-scripts/genutils'
-- use 'albfan/vim-breakpts'
-- use 'sbdchd/neoformat'
-- use 'voldikss/vim-floaterm'
-- use 'preservim/nerdcommenter'
-- use 'airblade/vim-rooter'
-- use 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

-- leave out replaced plugins lsp
-- use 'lighttiger2505/deoplete-vim-lsp'
-- use 'Shougo/deoplete.nvim', { 'do': ':UpdateRemoteuseins' }
-- use 'thomasfaingnaert/vim-lsp-snippets'
-- use 'thomasfaingnaert/vim-lsp-ultisnips'


end

local useins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return useins
