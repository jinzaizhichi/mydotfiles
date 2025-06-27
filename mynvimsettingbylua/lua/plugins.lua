-- Only required if you have packer in your `opt` pack

vim.cmd [[packadd! packer.nvim]]

return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    use {'kana/vim-textobj-user'}
    use {'kana/vim-textobj-indent'}
    use {'kana/vim-textobj-syntax'}
    use {'kana/vim-textobj-line'}
    use {'kana/vim-textobj-entire'}
    use {'sgur/vim-textobj-parameter'}
    use {'glts/vim-textobj-comment'}
    use {'Julian/vim-textobj-brace'}
    use {'shaunsingh/solarized.nvim'}

    use {'glepnir/dashboard-nvim'}
    use {'liuchengxu/vim-clap'}

    use {'preservim/nerdcommenter'}
    use {'tpope/vim-unimpaired'}
    use {'tpope/vim-surround'}
    use {'dkprice/vim-easygrep'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-rsi'}

    use {'easymotion/vim-easymotion'}
    use {'rhysd/clever-f.vim'}
    use {'tommcdo/vim-exchange'}
    use {'terryma/vim-expand-region'}

    use {'SmiteshP/nvim-navic'}
    use {'nvim-lualine/lualine.nvim', after = 'nvim-navic'}
    use {'kdheepak/tabline.nvim', after = "lualine.nvim"}
    use {'arkav/lualine-lsp-progress', after = "lualine.nvim"}
    use {'RRethy/vim-illuminate'}

    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'rafamadriz/friendly-snippets'}
    use {"saadparwaiz1/cmp_luasnip"} -- snippet completions
    use {"hrsh7th/cmp-nvim-lua"}
    use {"L3MON4D3/LuaSnip"} --snippet engine
    use {'f3fora/cmp-spell'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {"lukas-reineke/cmp-under-comparator"}
    use {'tzachar/cmp-tabnine', run = 'sh install.sh'}
    use {'octaltree/cmp-look'}
    use {'windwp/nvim-autopairs'}
    use {'KadoBOT/cmp-plugins'}
    use {'hrsh7th/cmp-nvim-lsp-signature-help'}

    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'neovim/nvim-lspconfig'}
    use {'kevinhwang91/nvim-bqf', event = 'BufEnter'}

    use {'psliwka/vim-smoothie', event = 'BufEnter'}
    use {'rhysd/accelerated-jk', event = 'BufEnter'}
    use {"andymass/vim-matchup", event = "VimEnter"}

    use {'simnalamburt/vim-mundo', event = 'BufEnter'}
    use {'kshenoy/vim-signature', event = 'BufEnter'}

    use {'mhinz/vim-janah', event = 'VimEnter'}
    use {'farmergreg/vim-lastplace', event = 'VimEnter'}
    use {'xolox/vim-misc', event = 'VimEnter'}
    use {'xolox/vim-session', event = 'VimEnter'}

    use {'skywind3000/vim-terminal-help', event = 'BufEnter'}
    use {'skywind3000/asyncrun.vim'}
    use {'skywind3000/asynctasks.vim'}
    use {'rcarriga/nvim-notify'}
    use {'airblade/vim-rooter', event = 'BufEnter'}
    use {'mileszs/ack.vim', event = 'BufEnter'}
    use {'rking/ag.vim', event = 'BufEnter'}
    use {'dyng/ctrlsf.vim', event = 'BufEnter'}
    use {'jeetsukumaran/vim-buffergator', event = 'BufEnter'}
    use {'ConradIrwin/vim-bracketed-paste', event = 'BufEnter'}

    use {'Shougo/defx.nvim', event = 'BufEnter'}
    use {'kristijanhusak/defx-icons', event = 'BufEnter'}
    use {'kristijanhusak/defx-git', event = 'BufEnter'}

    use {'derekwyatt/vim-fswitch', event = 'BufEnter'}
    use {'honza/vim-snippets', event = 'BufEnter'}
    use {'SirVer/ultisnips', ft = {'tex'}, event = 'BufEnter'}

    use {'DanilaMihailov/beacon.nvim', event = 'BufEnter'}
    use {'justinmk/vim-dirvish', event = 'BufEnter'}

    use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension', event = 'BufEnter'}
    use {'preservim/tagbar', event = 'BufEnter'}
    use {'mhinz/vim-signify', event = 'BufEnter'}

    use {'moll/vim-bbye', event = 'BufEnter'}
    use {'will133/vim-dirdiff', event = 'BufEnter'}
    use {'mg979/vim-visual-multi', event = 'BufEnter'}
    use {'liuchengxu/vim-which-key', event = 'BufEnter'}
    use {'lewis6991/impatient.nvim', event = 'BufEnter'}
    --缩进线
    use {'Yggdroot/indentLine', event = 'BufEnter'}

    use {'stsewd/tree-sitter-comment'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'tree-sitter/tree-sitter-c'}
    use {'tree-sitter/tree-sitter-cpp'}
    use {'nvim-treesitter/nvim-treesitter-refactor'}
    use {'p00f/nvim-ts-rainbow'}
    use {'nvim-treesitter/nvim-treesitter-textobjects'}

    use {'tpope/vim-fugitive'}
    use {'kdheepak/lazygit.nvim'}
    use {'godlygeek/tabular', event = 'BufEnter'}
    -- ssh远程vim自动切换本地输入法
    use "lxyoucan/sshim.vim"

    --use {'ntpeters/vim-better-whitespace'}
    --use {'mbbill/undotree', event = 'BufEnter'}
    --use {'kyazdani42/nvim-web-devicons', event = 'BufEnter'}
    --use {'folke/trouble.nvim'}
    --use {'google/vim-maktaba'}
    --use {'google/vim-codefmt'}
    --use {'google/vim-glaive'}
    --use {'lervag/vimtex', event = 'BufEnter'}
    --use {'mfussenegger/nvim-lint'}
    --use {'ludovicchabant/vim-gutentags', event = 'BufEnter'}
    --use {'skywind3000/gutentags_plus', event = 'BufEnter'}
    --use {'nvim-neorg/neorg'}
    --use {'nvim-neorg/neorg-telescope'}
    --use {'nvim-neorg/tree-sitter-norg'}
    ----markdown相关
    --use {'tpope/vim-markdown', ft = {'md'}}
    --use {'iamcco/mathjax-support-for-mkdp', ft = {'md'}}
    --use {'mzlogin/vim-markdown-toc', ft = {'md'}}
    --use {'jszakmeister/markdown2ctags', ft = {'md'}}
    --use {'joker1007/vim-markdown-quote-syntax', ft = {'md'}}
    ---- install without yarn or npm
    --use {"iamcco/markdown-preview.nvim", ft = {'md'}}
    --use {
        --"askfiy/nvim-picgo",
        --config = function()
            ---- it doesn't require you to do any configuration
            --require("nvim-picgo").setup()
        --end
    --}
    --use {'dkarter/bullets.vim', ft = {'md'}}
    ----PlantUML相关
    --use {'tyru/open-browser.vim', ft = {'plantuml'}, event = 'BufEnter'}
    --use {'weirongxu/plantuml-previewer.vim', ft = {'plantuml'}, event = 'BufEnter'}
    --use {'sheerun/vim-polyglot', ft = {'plantuml', 'markdown'}}
    ----翻译
    --use {'ianva/vim-youdao-translater', event = 'BufEnter'}
    ----切换中文输入法
    --use {'brglng/vim-im-select'}
    --use {'deaniiyu/PySneak'}
    --use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
    --use {'Ninlives/cmp-rime'}
    --use {'Ninlives/pyrime'}
    --use {'ray-x/lsp_signature.nvim'}
    --use {'nvim-treesitter/playground'}
    --use {'folke/zen-mode.nvim'}
    --use {'dhruvasagar/vim-table-mode'}
    --日历和笔记
    --use {'puremourning/vimspector',
    --setup = [[vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO']],
    --event = 'BufEnter'
    --}
    --use {'sakhnik/nvim-gdb'}
    --use {'vimwiki/vimwiki', event = 'BufEnter'}
    --use {'itchyny/calendar.vim', event = 'BufEnter'}
    --use {'editorconfig/editorconfig-vim'}
    --use {'neoclide/coc.nvim'}
    --use {'xcodebuild/fcitx-vim-osx'}
    --use "vim-test/vim-test"
    --use {
    --"rcarriga/vim-ultest",
    --run = ":UpdateRemotePlugins"
    --}
    --use {'ZWindL/chword.vim'}
    --use {'wsdjeg/vim-chat'}
    --use {'onsails/lspkind-nvim'}
    --use 'itchyny/lightline.vim'
    --use {'neoclide/coc.nvim', branch = 'release'}
    --use {'jiangmiao/auto-pairs'}
    --use 'aymericbeaumet/vim-symlink'
    --use {'neoclide/coc.nvim', branch = "master", run = 'cd app && yarn install --frozen-lockfile'}
    --use 'kdheepak/lazygit.nvim'
    --use 'nvim-lua/plenary.nvim'
    --use 'Shatur/neovim-session-manager'
    --use {'nvim-telescope/telescope.nvim',
    --requires = {
    --{'nvim-lua/plenary.nvim'}
    --}
    --}
    --use 'goolord/alpha-nvim'
    --use 'L3MON4D3/LuaSnip'
    --use 'hrsh7th/vim-vsnip'
    --use 'hrsh7th/vim-vsnip-integ'
    ----函数原型提醒
    --use 'Shougo/echodoc.vim'
    ----目录树图标
    --use 'ryanoasis/vim-devicons'
    --use 'junegunn/fzf'
    --use 'justinmk/vim-syntax-extra'
    ----java文本增强
    --use 'uiiaoo/java-syntax.vim'
    ----java编译运行
    --use 'wsdjeg/JavaUnit.vim'
    ----java测试文件跳转
    --use 'keitokuch/vim-junit-jump'
    ----java生成单元测试文件
    --use 'Chris-Slade/vim-makeunit'
    ----python错误检测
    --use 'nvie/vim-flake8'
    ----python缩进
    --use 'Vimjas/vim-python-pep8-indent'
    ----python自动格式化
    --use 'tell-k/vim-autopep8'
    ----彩虹括号
    --use 'luochen1990/rainbow'
    ----根据类定义自动生成函数框架
    --use 'derekwyatt/vim-protodef'
    ----语法检测
    --use 'dense-analysis/ale'
    --use 'regen100/cmake-language-server'
    --use 'junegunn/fzf'
    --use 'junegunn/fzf.vim'
    ----语法高亮
    --use 'scrooloose/syntastic'
    --命令模式下插入当前文件全路径名
    --也可以在insert模式下ctrl+r shift+5
    --:put =expand('%:p')
    --命令模式下插入缓冲区其他文件全路径名
    --也可以在insert模式下ctrl+r shift+3
    --:put =expand('#:p')
end)
