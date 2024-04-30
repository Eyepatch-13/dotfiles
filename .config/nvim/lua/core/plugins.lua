local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  use {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.6',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use ({
	  'folke/tokyonight.nvim'
  })

  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use {
  	"jiaoshijie/undotree",
  	config = function()
    		require('undotree').setup()
  	end,
  	requires = {
    	"nvim-lua/plenary.nvim",
  	},
  }

  use {
    	"ThePrimeagen/harpoon",
    	branch = "harpoon2",
    	requires = { {"nvim-lua/plenary.nvim"} }
  }

  use 'tpope/vim-commentary'

  use 'tpope/vim-fugitive'

  use 'airblade/vim-gitgutter'

  use {
	  'williamboman/mason.nvim',
	  config = function()
		  require('mason').setup()
	  end,
  }

  use 'hrsh7th/nvim-cmp'

  use {
  	'VonHeikemen/lsp-zero.nvim',
  	branch = 'v3.x',
  	requires = {
    		{'williamboman/mason.nvim'},
    		{'williamboman/mason-lspconfig.nvim'},
    		{'neovim/nvim-lspconfig'},
    		{'hrsh7th/nvim-cmp'},
    		{'hrsh7th/cmp-nvim-lsp'},
    		{'L3MON4D3/LuaSnip'},
  	}
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  }

  use {
    "tpope/vim-surround",
  }

  use {
    "AndrewRadev/splitjoin.vim"
  }
  
  use {
    "ggandor/leap.nvim"
  }

  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  }

  use {
    "mistricky/codesnap.nvim",
    run = 'make',
    config = function()
        require("codesnap").setup({
          mac_window_bar = false,
          title = "Eyepatch",
          has_breadcrumbs = true,
          bg_theme = "grape",
          watermark = "Eyepatch"
        })
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
