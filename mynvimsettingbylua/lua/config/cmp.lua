local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
  return
end
local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
  return
end

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local function jumpable(dir)
  local win_get_cursor = vim.api.nvim_win_get_cursor
  local get_current_buf = vim.api.nvim_get_current_buf

  local function inside_snippet()
    -- for outdated versions of luasnip
    if not luasnip.session.current_nodes then
      return false
    end

    local node = luasnip.session.current_nodes[get_current_buf()]
    if not node then
      return false
    end

    local snip_begin_pos, snip_end_pos = node.parent.snippet.mark:pos_begin_end()
    local pos = win_get_cursor(0)
    pos[1] = pos[1] - 1 -- LuaSnip is 0-based not 1-based like nvim for rows
    return pos[1] >= snip_begin_pos[1] and pos[1] <= snip_end_pos[1]
  end

  ---sets the current buffer's luasnip to the one nearest the cursor
  ---@return boolean true if a node is found, false otherwise
  local function seek_luasnip_cursor_node()
    -- for outdated versions of luasnip
    if not luasnip.session.current_nodes then
      return false
    end

    local pos = win_get_cursor(0)
    pos[1] = pos[1] - 1
    local node = luasnip.session.current_nodes[get_current_buf()]
    if not node then
      return false
    end

    local snippet = node.parent.snippet
    local exit_node = snippet.insert_nodes[0]

    -- exit early if we're past the exit node
    if exit_node then
      local exit_pos_end = exit_node.mark:pos_end()
      if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    node = snippet.inner_first:jump_into(1, true)
    while node ~= nil and node.next ~= nil and node ~= snippet do
      local n_next = node.next
      local next_pos = n_next and n_next.mark:pos_begin()
      local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
          or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

      -- Past unmarked exit node, exit early
      if n_next == nil or n_next == snippet.next then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end

      if candidate then
        luasnip.session.current_nodes[get_current_buf()] = node
        return true
      end

      local ok
      ok, node = pcall(node.jump_from, node, 1, true) -- no_move until last stop
      if not ok then
        snippet:remove_from_jumplist()
        luasnip.session.current_nodes[get_current_buf()] = nil

        return false
      end
    end

    -- No candidate, but have an exit node
    if exit_node then
      -- to jump to the exit node, seek to snippet
      luasnip.session.current_nodes[get_current_buf()] = snippet
      return true
    end

    -- No exit node, exit from snippet
    snippet:remove_from_jumplist()
    luasnip.session.current_nodes[get_current_buf()] = nil
    return false
  end

  if dir == -1 then
    return inside_snippet() and luasnip.jumpable(-1)
  else
    return inside_snippet() and seek_luasnip_cursor_node() and luasnip.jumpable()
  end
end

require("luasnip.loaders.from_vscode").lazy_load() -- load freindly-snippets
require("luasnip.loaders.from_vscode").load({ paths = { -- load custom snippets
  vim.fn.stdpath("config") .. "/my-snippets"
} }) -- Load snippets from my-snippets folder

cmp_config = {
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  completion = {
    ---@usage The minimum length of a word to complete on.
    keyword_length = 1,
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    max_width = 0,
    kind_icons = {
      Class = "🅒 ",
      Color = "🎨",
      Constant = "🔢",
      Method = "ƒ ",
      File = "📄",
      Constructor = " ",  -- 构造函数
      Enum = " ",    -- Enum
      EnumMember = " ",
      Event = " ",   -- Event
      Field = " ",
      Folder = " ",  -- Folder
      Function = " ",
      Interface = " ",-- Interface
      Keyword = "\u{f30c} ",
      Module = " ",  -- Module
      Operator = "\u{e68f} ",-- Operator
      Property = " ",-- Property
      Reference = " ",
      Snippet = " ",
      Struct = " ",  -- Struct
      Text = "\u{e756} ",    -- Text
      TypeParameter = "\u{e6c4} ",    -- Text
      Unit = "\u{e6ac} ",    -- Unit
      Value = "\u{e6aa} ",   -- Value
      Variable = " "  -- Variable
    },
    source_names = {
      nvim_lsp = "(LSP)",
      luasnip = "(Snippet)",
      emoji = "(Emoji)",
      path = "(Path)",
      calc = "(Calc)",
      nvim_lsp_signature_help = "(Signature)",
      buffer = "(Buffer)",
      spell = "(Spell)",
      look = "(Dictionary)",
      cmp_tabnine = "(Tabnine)",
      nvim_lua = "(Nvim_lua)",
      treesitter = "(Treesitter)",
      creates = "(Creates)",
    },
    duplicates = {
      buffer = 1,
      path = 1,
      nvim_lsp = 0,
      luasnip = 1,
    },
    duplicates_default = 0,
    format = function(entry, vim_item)
      local max_width = cmp_config.formatting.max_width
      if max_width ~= 0 and #vim_item.abbr > max_width then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
      end
      vim_item.kind = cmp_config.formatting.kind_icons[vim_item.kind]
      vim_item.menu = cmp_config.formatting.source_names[entry.source.name]
      vim_item.dup = cmp_config.formatting.duplicates[entry.source.name]
          or cmp_config.formatting.duplicates_default
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = 'nvim_lsp_signature_help' },
    {
        name = 'look',
        keyword_length = 2,
        option = {
            convert_case = true,
            loud = true
        }
    },
    { name = "cmp_tabnine" },
    { name = "buffer" },
    { name = "spell" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "creates" },
  },
  mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif jumpable() then
                luasnip.jump(1)
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
            end, {
                "i",
                "s",
        }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
            end, {
                "i",
                "s",
        }),

    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() and cmp.confirm(cmp_config.confirm_opts) then
        if jumpable() then
          luasnip.jump(1)
        end
        return
      end

      if jumpable() then
        if not luasnip.jump(1) then
          fallback()
        end
      else
        fallback()
      end
    end),
  },
}

cmp.setup(cmp_config)
-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
      { { name = 'path' } },
      { { name = 'cmdline' }}
  )
})
-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
  { {name = 'buffer'} },
  { {name = 'cmdline'} }
  )
})

-- Use buffer source for `/`.
cmp.setup.cmdline('?', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
  { {name = 'buffer'} },
  { {name = 'cmdline'} }
  )
})

require("nvim-autopairs").setup()
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
--cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"

