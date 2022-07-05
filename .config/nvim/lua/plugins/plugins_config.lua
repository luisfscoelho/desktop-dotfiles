local g = vim.g

require("gitsigns").setup()
require("nvim-autopairs").setup()
require("nvim_comment").setup()
require("trouble").setup()

require("better_escape").setup {
  mapping = {"jk"},
}

require("colorizer").setup {
  "*";
  css = {
    RGB = true;
    RRGGBB = true;
    names = true;
    RRGGBBAA = true;
    rgb_fn = true;
    hsl_fn = true;
    css = true;
    css_fn = true;
    mode = 'background';
  };
  html = {
    mode = "foreground";
  }
}

require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
  -- ensure_installed = "all";
  ensure_installed = {
    "c",
    "toml",
    "json",
    "yaml",
    "cmake",
    "dockerfile",
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "elixir",
    "rust",
    "python",
    "graphql",
  },
}

require("telescope").setup {
  defaults = {
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
  },
  extensions = {
    fzf = {
       fuzzy = true, -- false will only do exact matching
       override_generic_sorter = false, -- override the generic sorter
       override_file_sorter = true, -- override the file sorter
       case_mode = "smart_case", -- or "ignore_case" or "respect_case"
       -- the default case_mode is "smart_case"
    },
    media_files = {
       filetypes = { "png", "webp", "jpg", "jpeg" },
       find_cmd = "rg", -- find command (defaults to `fd`)
    },
  },
}

require ("lsp_signature").setup {
  bind = true,
  max_height = 22,
  max_width = 120,
  handler_opts = {
    border = "rounded"
  }
}

require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
}

-- nvim-cmp
g.completeopt = {"menu", "menuone", "noselect"}
local cmp = require("cmp")

cmp.setup {
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  snippet = {
    -- We recommend using *actual* snippet engine.
    -- It's a simple implementation so it might not work in some of the cases.
    expand = function(args)
      local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
      local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
      local indent = string.match(line_text, '^%s*')
      local replace = vim.split(args.body, '\n', true)
      local surround = string.match(line_text, '%S.*') or ''
      local surround_end = surround:sub(col)

      replace[1] = surround:sub(0, col - 1)..replace[1]
      replace[#replace] = replace[#replace]..(#surround_end > 1 and ' ' or '')..surround_end
      if indent ~= '' then
        for i, line in ipairs(replace) do
          replace[i] = indent..line
        end
      end

      vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
  formatting = {
    format = require('lspkind').cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
      },
    }),
  },
}

-- nvim-cmp end

require('nvim-tree').setup {
  disable_netrw = true,
  hijack_cursor = true,
  hijack_netrw  = true,
  open_on_setup = true,
  update_cwd    = true,
  update_focused_file = {
    enable = true,
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 1000,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

-- lspconfig
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
   properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
   },
}

local lspconfig = require "lspconfig"

local path_to_elixirls = vim.fn.expand("~/Code/elixir-ls/rel/language_server.sh")

local servers = {
  "bashls",
  "clangd",
  "cssls",
  "dockerls",
  "dotls",
  "eslint",
  "graphql",
  "html",
  "jsonls",
  "pyright",
  "rescriptls",
  "rust_analyzer",
  "sqlls",
  "tsserver",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
     on_attach = attach,
     capabilities = capabilities,
     flags = {
        debounce_text_changes = 150,
     },
  }
end

lspconfig.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = attach,
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = false,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  }
})

lspconfig.efm.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {"elixir"}
})

-- end lspconfig

require('bufferline').setup {
  options = {
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
  }
}

vim.cmd[[colorscheme dracula]]

require("lualine").setup {
  options = {
    theme = "dracula-nvim"
  }
}

