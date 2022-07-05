local present, packer = pcall(require, "plugins.packerInit")

if not present then
  return false
end

local use = packer.use

return packer.startup(function()
  use {"nvim-lua/plenary.nvim"}
  use {"wbthomason/packer.nvim", event = "VimEnter"}
  use {"kyazdani42/nvim-web-devicons"}
  use {"lukas-reineke/indent-blankline.nvim"}
  use {"max397574/better-escape.nvim"}
  use {"norcalli/nvim-colorizer.lua"}
  use {"nvim-treesitter/nvim-treesitter", run = ':TSUpdate'}
  use {'nvim-telescope/telescope.nvim'}
  use {"neovim/nvim-lspconfig"}
  use {"ray-x/lsp_signature.nvim"}
  use {"hrsh7th/nvim-cmp"}
  use {"hrsh7th/cmp-nvim-lua"}
  use {"hrsh7th/cmp-nvim-lsp"}
  use {"hrsh7th/cmp-buffer"}
  use {"hrsh7th/cmp-path"}
  use {"onsails/lspkind-nvim"}
  use {"folke/trouble.nvim"}
  use {"fedepujol/move.nvim"}

  use 'Mofiqul/dracula.nvim'

  use {"nvim-lualine/lualine.nvim", requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  use {"akinsho/bufferline.nvim"}

  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
  use {"windwp/nvim-autopairs"}
  use {"terrortylor/nvim-comment"}
  use {"kyazdani42/nvim-tree.lua"}
end)
