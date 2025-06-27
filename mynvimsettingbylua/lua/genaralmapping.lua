function custom_fold_text()
    -- 初始化一个表来储存折叠区域内的所有行
    local lines = {}
    -- 遍历折叠区域内的所有行
    for i = vim.v.foldstart, vim.v.foldend do
        table.insert(lines, vim.fn.getline(i))
    end
    -- 将所有行合并成一个字符串，每行用空格分隔
    local combinedLines = table.concat(lines, " ")
    -- 查找合并后的内容中第一个右括号")"的位置
    local firstRightParenPos = string.find(combinedLines, "[%)%{]")
    -- 如果找到右括号，截取到右括号为止的内容
    if firstRightParenPos then
        combinedLines = string.sub(combinedLines, 1, firstRightParenPos)
    end
    -- 计算折叠区域内的行数
    local numLines = #lines
    -- 如果最右边为左大括号"{"，则去除该字符
    if combinedLines:sub(-1) == "{" then
        combinedLines = combinedLines:sub(1, -2)
    end
    -- 将所有连续的空格替换为一个空格
    combinedLines = combinedLines:gsub("%s+", " ")
    -- 返回包含行数信息和内容的字符串
    return "+-- " .. numLines .. " lines: " .. combinedLines
end

local setmapping = function()
    vim.g.hidden = true
    --取消VI兼容,VI键盘模式不易用
    vim.o.compatible = false
    --显示行号, 或set number
    vim.wo.number = true
    --历史命令保存行数
    vim.o.history = 100
    -- 当文件被外部程序修改时，自动加载
    vim.o.autoread = true
    vim.bo.autoread = true
    -- 行结尾可以跳到下一行
    --vim.o.whichwrap = 'b,s,<,>,[,],h,l'
    vim.opt.whichwrap:append {['<'] = true, ['>'] = true, [','] = true, h = true, l = true}
    -- 鼠标支持
    vim.o.mouse = "a"
    -- 禁止创建备份文件
    vim.o.backup = false
    vim.o.writebackup = false
    vim.o.autowrite = true
    --允许区域选择
    vim.g.selection = "exclusive"
    vim.g.selectmode = "mouse,key"
    --取消自动备份及产生swp文件
    vim.o.wrap = false
    vim.wo.wrap = false
    vim.o.swapfile = false
    --设置更新时间
    vim.o.updatetime = 800
    --高亮光标所在行
    vim.wo.cursorline = true
    --取消光标闪烁
    vim.g.visualbell = flse
    --状态栏显示当前执行的命令
    vim.o.showcmd = true
    --设置命令行高度为1
    vim.g.cmdheight = 1
    --高亮显示匹配的括号
    vim.o.showmatch = true
    --在搜索的时候忽略大小写
    vim.o.ignorecase = true
    vim.o.smartcase = false
    --高亮被搜索的句子
    vim.o.hlsearch = true
    --在搜索时,输入的词句的逐字符高亮（类似firefox的搜索）
    vim.o.incsearch = true
    --继承前一行的缩进方式,特别适用于多行注释
    vim.o.autoindent = true
    --为C程序提供自动缩进
    vim.o.smartindent = true
    --使用C样式的缩进
    vim.o.cindent = true
    --制表符为4个空格,统一缩进为4个空格
    vim.o.expandtab = false
    vim.o.tabstop = nil
    vim.o.softtabstop = nil
    vim.o.shiftwidth = nil
    --vim.o.expandtab = true
    --vim.o.tabstop = 4
    --vim.o.softtabstop = 4
    --vim.o.shiftwidth = 4
    --允许使用退格键,或set backspace=2
    vim.o.backspace = "eol,start,indent"
    --在被分割的窗口间显示空白,便于阅读
    vim.o.fillchars = "vert: ,stl: ,stlnc: "
    vim.o.scrolloff = 3
    --设定字体
    vim.o.guifont = "Hack Nerd Font: h17"
    --vim.o.guifont= "Meslo LG S DZ Regular for Powerline:h16"
    --设定编码
    --vim.g.encoding = "utf-8"
    --vim.g.termencoding = "utf-8"
    --vim.g.fileencoding = "utf-8"
    --vim.g.fileencodings = "utf-8,chinese,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936"
    --vim.g.langmenu = "zh_CN.UTF-8"
    --自动补全
    vim.g.completeopt = "menu,menuone,noselect,noinsert"
    --标尺功能,显示当前光标所在行列号
    vim.g.ruler = true
    --自动补全命令时候使用菜单式匹配列表
    vim.g.wildmenu = true
    --设置超时时间
    vim.g.timeout = true
    vim.g.timeoutlen = 1000
    vim.g.ttimeoutlen = 1000

    --设置折叠
    --使用foldexpr指定的方式折叠代码
    vim.wo.foldenable = true
    vim.wo.foldmethod = "expr"
    --使用treesitter根据语言语法折叠代码
    vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
    -- 设置foldtext选项以自定义折叠显示
    vim.opt.foldtext = 'v:lua.custom_fold_text()'
    --vim.cmd("set foldmethod=expr")
    --vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
    --vim.o.foldcolumn = '1'
    --vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    --vim.o.foldlevelstart = 99
    --vim.o.foldenable = true
    --默认从第一级开始,大家可以去掉看有什么效果
    --set foldlevel=1
    --设置隐藏
    if vim.fn.has('conceal') then
      vim.g.conceallevel = 0
      vim.g.concealcursor = n
    end

    --配色方案
    vim.cmd("colorscheme solarized")
    vim.g.solarized_termcolors=16
    vim.g.background = "light"
    --设置256色
    vim.g.t_Co = 256
    if vim.fn.has('gui_running') == true then
        vim.g.lines = 999
        vim.g.columns = 999
        vim.g.fullscreen = false
        vim.g.guioptions = ""
    end
    --Don't pass messages to |ins-completion-menu|.
    --启动的时候不显示提示
    --vim.g.shortmess = {c=true, ati = true}
    vim.opt.shortmess:append {c = true, ati = true}
    --vim.cmd("set shortmess=ati")
    --vim.cmd("set shortmess+=c")
    --设置光标不闪烁
    vim.g.gcr = "a:block-blinkon0"
    --设置粘贴
    vim.opt.clipboard = "unnamedplus"
    vim.g.pastetoggle = "<m-i>"
    vim.cmd([[
      autocmd BufReadPost * silent! %s/\r\+$//e " 打开文件时自动删除结尾的 ^M
      autocmd TextChanged * silent! %s/\r\+$//e " 编辑时实时删除 ^M
      autocmd TextChangedI * silent! %s/\r\+$//e " 插入模式时实时删除 ^M
    ]])

    --打开语法高亮
    vim.cmd("syntax enable")
    vim.cmd("syntax on")
    --不同文件类型使用不同插件
    vim.cmd("filetype plugin indent on")
    vim.cmd("highlight Search ctermbg=Black")
    vim.cmd("highlight Search ctermfg=DarkGray")
    --vim.o.spell = true
end

local leadermap = function()
    vim.g.mapleader = ";"
    vim.g.maplocalleader = " "
    vim.api.nvim_set_keymap("n", " ", "", {noremap = true})
    vim.api.nvim_set_keymap("x", " ", "", {noremap = true})
end

local mapmap = function()
    --当光标一段时间保持不动了,就禁用高亮
    vim.cmd('autocmd cursorhold * set nohlsearch')
    --输入查找命令时,再启用高亮
    vim.api.nvim_set_keymap('n', 'n', ':set hlsearch<cr>n', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', 'N', ':set hlsearch<cr>N', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '*', ':set hlsearch<cr>*', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '#', ':set hlsearch<cr>#', { noremap = true, silent = true })
    --插入空格
    vim.api.nvim_set_keymap('n', '[w', 'i <esc>l', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', ']w', 'a <esc>h', { noremap = true, silent = true })
    --插入文件名
    vim.api.nvim_set_keymap('i', '<c-r>', '<c-r>=expand("%:t")<cr>', { noremap = true, silent = true })
    --insert mode shortcut
    vim.api.nvim_set_keymap('i', '<c-h>', '<Left>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '<c-j>', '<Down', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '<c-k>', '<Up>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '<c-l>', '<Right>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '<c-d>', '<Delete>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '<c-o>', '<Tab>', { noremap = true, silent = true })
    --设置close和cclose
    vim.api.nvim_set_keymap('n', '<c-b>', '<c-u>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<localleader><localleader>', '<ESC>A;<ESC>', { noremap = true, silent = true })
end

local loadcore = function()
    leadermap()
    setmapping()
    mapmap()
end

loadcore()
