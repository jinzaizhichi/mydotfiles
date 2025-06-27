-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/root/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/root/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LeaderF = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/LeaderF",
    url = "https://github.com/Yggdroot/LeaderF"
  },
  LuaSnip = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["accelerated-jk"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/accelerated-jk",
    url = "https://github.com/rhysd/accelerated-jk"
  },
  ["beacon.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/beacon.nvim",
    url = "https://github.com/DanilaMihailov/beacon.nvim"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-look"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-look",
    url = "https://github.com/octaltree/cmp-look"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-plugins"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-plugins",
    url = "https://github.com/KadoBOT/cmp-plugins"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["defx-git"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/defx-git",
    url = "https://github.com/kristijanhusak/defx-git"
  },
  ["defx-icons"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/defx-icons",
    url = "https://github.com/kristijanhusak/defx-icons"
  },
  ["defx.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/defx.nvim",
    url = "https://github.com/Shougo/defx.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  nerdcommenter = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["solarized.nvim"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/solarized.nvim",
    url = "https://github.com/shaunsingh/solarized.nvim"
  },
  tagbar = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  ultisnips = {
    after_files = { "/root/.local/share/nvim/site/pack/packer/opt/ultisnips/after/plugin/UltiSnips_after.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["vim-dirvish"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-dirvish",
    url = "https://github.com/justinmk/vim-dirvish"
  },
  ["vim-easygrep"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-easygrep",
    url = "https://github.com/dkprice/vim-easygrep"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-expand-region"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-fswitch"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-fswitch",
    url = "https://github.com/derekwyatt/vim-fswitch"
  },
  ["vim-janah"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-janah",
    url = "https://github.com/mhinz/vim-janah"
  },
  ["vim-lastplace"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-lastplace",
    url = "https://github.com/farmergreg/vim-lastplace"
  },
  ["vim-matchup"] = {
    after_files = { "/root/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-misc"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-misc",
    url = "https://github.com/xolox/vim-misc"
  },
  ["vim-mundo"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rsi"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-rsi",
    url = "https://github.com/tpope/vim-rsi"
  },
  ["vim-session"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-session",
    url = "https://github.com/xolox/vim-session"
  },
  ["vim-signature"] = {
    after_files = { "/root/.local/share/nvim/site/pack/packer/opt/vim-signature/after/plugin/signature.vim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-signature",
    url = "https://github.com/kshenoy/vim-signature"
  },
  ["vim-signify"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-signify",
    url = "https://github.com/mhinz/vim-signify"
  },
  ["vim-smoothie"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-smoothie",
    url = "https://github.com/psliwka/vim-smoothie"
  },
  ["vim-snippets"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/root/.local/share/nvim/site/pack/packer/opt/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-brace"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-textobj-brace",
    url = "https://github.com/Julian/vim-textobj-brace"
  },
  ["vim-textobj-comment"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-textobj-comment",
    url = "https://github.com/glts/vim-textobj-comment"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-textobj-entire",
    url = "https://github.com/kana/vim-textobj-entire"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-textobj-indent",
    url = "https://github.com/kana/vim-textobj-indent"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-textobj-line",
    url = "https://github.com/kana/vim-textobj-line"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter",
    url = "https://github.com/sgur/vim-textobj-parameter"
  },
  ["vim-textobj-syntax"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-textobj-syntax",
    url = "https://github.com/kana/vim-textobj-syntax"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/root/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType tex ++once lua require("packer.load")({'ultisnips'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-session', 'vim-matchup', 'vim-lastplace', 'vim-misc', 'vim-janah'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'vim-snippets', 'vim-dirvish', 'LeaderF', 'beacon.nvim', 'vim-signature', 'accelerated-jk', 'vim-fswitch', 'vim-mundo', 'vim-smoothie', 'tagbar', 'ultisnips', 'defx-git', 'defx-icons', 'vim-signify', 'defx.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /root/.local/share/nvim/site/pack/packer/opt/ultisnips/ftdetect/snippets.vim]], true)
vim.cmd [[source /root/.local/share/nvim/site/pack/packer/opt/ultisnips/ftdetect/snippets.vim]]
time([[Sourcing ftdetect script at: /root/.local/share/nvim/site/pack/packer/opt/ultisnips/ftdetect/snippets.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
