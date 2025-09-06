vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")

require("lazy").setup({
  -- librerías necesarias
  "nvim-lua/plenary.nvim",

    {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.texlab.setup{
        settings = {
          texlab = {
            build = {
              executable = "latexmk",
              args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
              forwardSearchAfter = true,
              onSave = true,
            },
          },
        },
      }
    end,
  },

  {
    "lervag/vimtex",
    config = function()
      require("myconfig.vimtex") 
    end
  },
  
  {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",            -- o "storm", "moon"
    transparent = false,
    dim_inactive = false,
    lualine_bold = false,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd("colorscheme tokyonight")
  end,
  },

  {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- para LSP (texlab)
    "hrsh7th/cmp-buffer",       -- palabras del buffer
    "hrsh7th/cmp-path",         -- rutas
    "hrsh7th/cmp-omni",         -- usa omnifunc (vimtex)
    "micangl/cmp-vimtex",       -- integración directa con vimtex
    "kdheepak/cmp-latex-symbols" -- símbolos matemáticos
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter para aceptar
        ["<C-Space>"] = cmp.mapping.complete(),           -- Ctrl+Espacio para forzar menu
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vimtex" },
        { name = "omni" },
        { name = "latex_symbols" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
},

{
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup{
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            },
          },
          prompt_prefix = "🔍 ",
          selection_caret = "➤ ",
        },
        pickers = {
          find_files = { hidden = true },
          live_grep = {},
          buffers = { sort_lastused = true, ignore_current_buffer = true },
        },
      }

      -- Mappings rápidos
      local map = vim.keymap.set
      map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
      map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
      map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
      map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
  end
}

 
})

