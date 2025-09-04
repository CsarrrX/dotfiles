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
}

 
})

