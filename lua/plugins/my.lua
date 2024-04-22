-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  {
    "rcarriga/nvim-notify",
    config = function()
      require("archvim/config/notify")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      if os.getenv("NERD_FONTS") ~= nil then
        require("nvim-tree.renderer.components.icons").devicons = require("nvim-web-devicons")
      end
    end,
    cond = function()
      return os.getenv("NERD_FONTS") ~= nil
    end,
  },

  -- auto completions
  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup({})
    end,
  },

  -- for nvim-cmp
  "lukas-reineke/cmp-under-comparator",
  "onsails/lspkind-nvim",
  "roobert/tailwindcss-colorizer-cmp.nvim",

  {
    "hrsh7th/nvim-cmp",
    requires = {
      -- {
      --     'yehuohan/cmp-im',
      --     'yehuohan/cmp-im-zh',
      -- },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "f3fora/cmp-spell",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      "chrisgrieser/cmp_yanky",
      "onsails/lspkind.nvim",
      -- 'petertriho/cmp-git',
      "lukas-reineke/cmp-rg",
      "lukas-reineke/cmp-under-comparator",
      -- 'hrsh7th/cmp-copilot', -- INFO: uncomment this for AI completion
      -- {"tzachar/cmp-tabnine", run = "./install.sh"}, -- INFO: uncomment this for AI completion
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        run = "make install_jsregexp || true",
        requires = {
          "rafamadriz/friendly-snippets",
        },
        config = function()
          require("archvim/config/luasnip")
        end,
      },
    },
    config = function()
      require("archvim/config/nvim-cmp")
    end,
  },

  -- lsp syntax diagnostics
  {
    "williamboman/mason.nvim",
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "mason-org/mason-registry",
    },
    run = ":MasonUpdate",
    config = function()
      require("archvim/config/mason")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("archvim/config/lspconfig")
    end,
    -- requires = {
    --     'ray-x/lsp_signature.nvim',
    -- },
  },
  -- {
  --     "tami5/lspsaga.nvim",
  --     config = function() require'archvim/config/lspsaga' end,
  -- },
  {
    "dgagn/diagflow.nvim",
    config = function()
      require("archvim/config/diagflow")
    end,
  },

 -- {
 --     'andersevenrud/nvim_context_vt',
 --     config = function() require "archvim/config/nvim_context_vt" end,
 -- },

 -- -- code refactoring
 -- {
 --     'LucHermitte/vim-refactor',
 --     requires = {
 --         'LucHermitte/lh-vim-lib',
 --         'LucHermitte/lh-tags',
 --         'LucHermitte/lh-dev',
 --         'LucHermitte/lh-style',
 --         'LucHermitte/lh-brackets',
 --     },
 -- },
 -- {
 --     "ThePrimeagen/refactoring.nvim",
 --     requires = {
 --         {"nvim-lua/plenary.nvim"},
 --         {"nvim-treesitter/nvim-treesitter"},
 --     },
 --     config = function() require'archvim/config/refactoring' end,
 -- },
  

  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup({})
    end,
  },
  {
    "folke/noice.nvim",
    config = function()
      require("archvim/config/noice")
    end,
    requires = {
      "MunifTanjim/nui.nvim",
    },
  },

  -- lint and error signs
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({})
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      require("bqf").setup({})
    end,
    requires = {
      {
        "junegunn/fzf",
        run = function()
          vim.fn["fzf#install"]()
        end,
      },
    },
  },
  -- {   -- uncomment to enable cpplint
  --     'mfussenegger/nvim-lint',
  --     config = function() require"archvim/config/nvim-lint" end,
  -- },
  -- {
  --     "petertriho/nvim-scrollbar",
  --     config = function() require"scrollbar".setup{} end,
  -- },

  -- marks and todos
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  },
  -- {
  --     'chentoast/marks.nvim',
  --     config = function() require"archvim/config/marks" end,
  -- },
  --
  -- zen-mode
  "folke/zen-mode.nvim",
  {
    "folke/twilight.nvim",
    config = function()
      require("archvim/config/twilight")
    end,
  },

  -- dap and debuggers
  -- {
  --     'gisodal/vimgdb',
  --     run = 'python setup.py install',
  -- },
  -- {
  --     'folke/neodev.nvim',
  --     config = function() require'archvim/config/neodev' end,
  -- },
  -- for nvim-dap-ui
  "mfussenegger/nvim-dap",
  "nvim-neotest/nvim-nio",
  "theHamsta/nvim-dap-virtual-text",
  {
    "rcarriga/nvim-dap-ui",
    requires = {
    },
    config = function()
      require("archvim/config/nvim-dap")
    end,
  },

  -- {
  --     'cpiger/NeoDebug',
  --     config = function() end,
  -- },

  -- semantic highlighting and textobjects
  {
    "nvim-treesitter/nvim-treesitter",
    context_commentstring = {
    enable = true,
    enable_autocmd = false,
    -- or "config" if you're still using the old configuration key
    languages = {
      typescript = '// %s',
    },
  },
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("archvim/config/nvim-treesitter")
    end,
    requires = {
      "p00f/nvim-ts-rainbow",
      "nvim-treesitter/nvim-treesitter-textobjects",
      -- "JoosepAlviste/nvim-ts-context-commentstring",
      -- 'nvim-treesitter/nvim-treesitter-context',
      "windwp/nvim-ts-autotag",
      "andymass/vim-matchup",
      "mfussenegger/nvim-treehopper",
    },
  },

  -- {
  --     -- "romgrk/nvim-treesitter-context",
  --     "SmiteshP/nvim-navic",
  --     requires = 'nvim-treesitter/nvim-treesitter',
  -- },
  --
  -- color and themes
  {
    "ellisonleao/gruvbox.nvim",
    requires = "rktjmp/lush.nvim",
  },
  -- {
  --     'AlphaTechnolog/pywal.nvim',
  --     as = 'pywal',
  -- },
  "glepnir/zephyr-nvim",
  "shaunsingh/nord.nvim",
  -- 'tikhomirov/vim-glsl',

  -- git support
  -- {
  --     'lewis6991/gitsigns.nvim',
  --     config = function() require'archvim/config/gitsigns' end,
  -- },
  -- 'tpope/vim-fugitive',
  {
    "NeogitOrg/neogit",
    requires = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    config = function()
      require("neogit").setup({})
    end,
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("archvim/config/lualine")
    end,
    requires = {
      "archibate/lualine-time",
      -- 'archibate/lualine-lsp-progress',
    },
  },

  -- brace pairing
  -- {
  --     "ur4ltz/surround.nvim",
  --     config = function() require 'archvim/config/surround' end,
  -- },
  {
    "kylechui/nvim-surround",
    config = function()
      require("archvim/config/nvim-surround")
    end,
  },
  -- {
  --     'm4xshen/autoclose.nvim',
  --     config = function() require 'archvim/config/autoclose' end,
  -- },
  -- {
  --     'windwp/nvim-autopairs',
  --     config = function() require'archvim/config/nvim-autopairs' end,
  -- },
  -- "terryma/vim-expand-region",

  -- code actions
  {
    "sbdchd/neoformat",
    config = function()
      require("archvim/config/neoformat")
    end,
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("archvim/config/nvim-comment")
    end,
  },

  -- session and projects
  -- {
  --     "Shatur/neovim-session-manager",
  --     requires = "nvim-lua/plenary.nvim",
  --     config = function() require'archvim/config/neovim-session-manager' end,
  -- },
  -- {
  --     "startup-nvim/startup.nvim",
  --     requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  --     config = function()
  --         require"startup".setup()
  --     end,
  -- },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup({})
    end,
  },
  -- 'djoshea/vim-autoread',
  -- {
  --     "rmagatti/auto-session",
  --     config = function() require'archvim/config/auto-session' end,
  -- },
  --{ -- this performance stucks, so i disable it
  --"mbbill/undotree",
  --config = function() require'archvim/config/undotree' end,
  --},
  -- {   -- uncomment to enable autosave
  --     'Pocco81/AutoSave.nvim',
  --     config = function() require'archvim/config/autosave' end,
  -- },

  -- fuzzy searching
  {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make || true",
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "tami5/sqlite.lua" }, -- need to install sqlite lib
      },
      "nvim-telescope/telescope-ui-select.nvim",
      "LinArcX/telescope-changes.nvim",
      "nvim-telescope/telescope-github.nvim",
      -- "nvim-telescope/telescope-live-grep-raw.nvim",
    },
    config = function()
      require("archvim/config/telescope")
    end,
  },
  -- {
  --     "nvim-pack/nvim-spectre",
  --     requires = {
  --         "nvim-lua/plenary.nvim",
  --         "BurntSushi/ripgrep",
  --     },
  --     config = function() require"archvim/config/nvim-spectre" end,
  -- },

  -- buffer and files
  {
    "akinsho/bufferline.nvim",
    tag = "*",
    requires = {
      "famiu/bufdelete.nvim",
    },
    config = function()
      require("archvim/config/bufferline")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("archvim/config/nvim-tree")
    end,
  },

  -- terminal and tasks
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("archvim/config/toggleterm")
    end,
  },
  {
    "Civitasv/cmake-tools.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("archvim/config/cmake-tools")
    end,
  },
  -- {
  --     "Mythos-404/xmake.nvim",
  --     requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --     config = function() require'xmake'.setup{} end,
  --     branch = 'v1',
  -- },
  -- {
  --     'stevearc/overseer.nvim',
  --     config = function() require'archvim/config/overseer' end,
  -- },
  -- {
  --     'skywind3000/asynctasks.vim',
  --     requires = {'skywind3000/asyncrun.vim', 'voldikss/vim-floaterm'},
  --     config = function() require'archvim/config/asynctasks' end,
  -- },

  -- cursor motion
  {
    "folke/which-key.nvim",
    config = function()
      require("archvim/config/which-key")
    end,
  },
  {
    "phaazon/hop.nvim",
    config = function()
      require("archvim/config/hop")
    end,
  },
  {
    "MunifTanjim/nui.nvim",
  },

  {
      "arnamak/stay-centered.nvim",
      config = function() require"stay-centered" end,
  },

  {'mg979/vim-visual-multi'},

  {
      "RRethy/vim-illuminate",
      config = function()
          vim.g.Illuminate_ftblacklist = {
              "NvimTree",
              "vista_kind",
              "toggleterm",
              "lsp-installer",
          }
      end,
  },

  -- neo-pioneering
  -- {
  --     os.getenv('ARCHIBATE_COMPUTER') and '/home/bate/Codes/nvim-gpt' or 'archibate/nvim-gpt',
  --     requires = { 'nvim-telescope/telescope.nvim' },
  --     config = function() require"archvim/config/nvim-gpt" end,
  -- },
  --
  {
    os.getenv("ARCHIBATE_COMPUTER") and "/home/bate/Codes/genius.nvim" or "archibate/genius.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("archvim/config/genius")
    end,
  },
  
  -- 'Exafunction/codeium.vim',
  -- {
  --     "Exafunction/codeium.nvim",
  --     requires = {
  --         "nvim-lua/plenary.nvim",
  --         "hrsh7th/nvim-cmp",
  --     },
  --     config = function()
  --         require"codeium".setup{}
  --     end,
  -- },

  -- markdown editing
  -- {
  --     'iamcco/markdown-preview.nvim',
  --     run = function() vim.fn["mkdp#util#install"]() end,
  --     setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
  --     config = function() vim.cmd [[let g:mkdp_browser = '/usr/bin/chromium']] end,
  --     ft = { "markdown" },
  --     requires = 'iamcco/mathjax-support-for-mkdp',
  -- },

  {
      'mzlogin/vim-markdown-toc',
      ft = { "markdown" },
  },
   -- {
   --     'plasticboy/vim-markdown',
   --     requires = 'godlygeek/tabular',
   --     config = function() vim.cmd [[let g:vim_markdown_math = 1]] end,
   --     ft = { "markdown" },
   -- },
  {
      'ferrine/md-img-paste.vim',
      config = function() vim.cmd [[
      let g:mdip_imgdir = 'img' " save image in ./img
      let g:mdip_imgname = 'image'
      autocmd FileType markdown nnoremap <silent> mp :call mdip#MarkdownClipboardImage()<CR>
              ]] end,
              ft = { "markdown" },
  },

   -- pinyin input method
  'h-hg/fcitx.nvim',
    -- {
    --     'ZSaberLv0/ZFVimIM',
    --     requires = {
    --         'ZSaberLv0/ZFVimJob',
    --         -- 'ZSaberLv0/ZFVimGitUtil',
    --         'ZSaberLv0/ZFVimIM_openapi',
    --         'ZSaberLv0/ZFVimIM_pinyin_huge',
    --     },
    --     config = function() require'archvim/config/zfvimim' end,
    -- },

    -- neovim profiling and debugging
    -- 'dstein64/vim-startuptime',

}
