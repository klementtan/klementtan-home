return require("packer").startup(function()
	use("wbthomason/packer.nvim") --> packer plugin manager

	-->
	use("Pocco81/TrueZen.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("nvim-lualine/lualine.nvim") --> a statusline written in lua
	use("kyazdani42/nvim-tree.lua") --> file explorer
	use("akinsho/toggleterm.nvim")
	use("nvim-lua/plenary.nvim")
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }
	use("numToStr/Comment.nvim")
	use("rcarriga/nvim-notify")
	use("windwp/nvim-autopairs")

	use("kyazdani42/nvim-web-devicons")
	use("ntpeters/vim-better-whitespace")


	-- use("sunjon/shade.nvim") --> dim inactive windows
	-- use("junegunn/goyo.vim")
	use("fladson/vim-kitty") --> kitty syntax highlighting
	-- use("jubnzv/mdeval.nvim") --> evaluates code blocks inside markdown, vimwiki, orgmode.nvim and norg docs
	use("startup-nvim/startup.nvim")
	use("lervag/vimtex")

    use{"ojroques/vim-oscyank", tag = "v1.0.0"}

	-- use("vigoux/LanguageTool.nvim")
	use("mfussenegger/nvim-dap")
	--> colorschemes
    use("sainnhe/gruvbox-material")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    --> git
    use {
  'lewis6991/gitsigns.nvim',
      -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    use{'sindrets/diffview.nvim', requires ='nvim-lua/plenary.nvim'}

	--> treesitter & treesitter modules/plugins
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) --> treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects") --> textobjects
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("nvim-treesitter/nvim-treesitter-context")
	use("rhysd/vim-clang-format")
	use("p00f/nvim-ts-rainbow")
	use("nvim-treesitter/playground")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	use("nvim-neorg/neorg")

	--> lsp
	use("neovim/nvim-lspconfig") --> Collection of configurations for built-in LSP client
	use("williamboman/nvim-lsp-installer") --> Companion plugin for lsp-config, allows us to seamlesly install language servers
	--use("jose-elias-alvarez/null-ls.nvim") --> inject lsp diagnistocs, formattings, code actions, and more ...
	use("tami5/lspsaga.nvim") --> icons for LSP diagnostics
	use("onsails/lspkind-nvim") --> vscode-like pictograms for neovim lsp completion items
	use("hrsh7th/nvim-cmp") --> Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") --> LSP source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") --> Snippets source for nvim-cmp
	use("L3MON4D3/LuaSnip") --> Snippets plugin
end)
