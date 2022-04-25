local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  --use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  --use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use 'folke/tokyonight.nvim' -- Tokyonight Theme
  use 'norcalli/nvim-colorizer.lua'
  use {
    "vimwiki/vimwiki", branch = "dev",
    -- keys = { "<leader>x" },
    config = function()
      vim.g["vimwiki_list"] = {
        {
          path = "~/.local/vimwiki/",
          template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/",
          syntax = "markdown",
          ext = ".md"
        }
      }
      vim.g["vimwiki_global_ext"] = 0
    end
  }
  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end 
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
