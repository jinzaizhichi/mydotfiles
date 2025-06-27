function whitespace()
    vim.cmd [[
        "定义一个变量作为开关，默认设置为打开 (1)。
        let g:strip_whitespace_on_save = 1
        "自动命令检查变量值决定是否删除行末空格。
        autocmd BufWritePre * if g:strip_whitespace_on_save | %s/\s\+$//e | endif
        "定义函数来切换这个功能的开关。
        function! ToggleRemoveTrailingWhitespace()
            if g:strip_whitespace_on_save
                let g:strip_whitespace_on_save = 0
                echo "Remove trailing whitespace: OFF"
            else
                let g:strip_whitespace_on_save = 1
                echo "Remove trailing whitespace: ON"
            endif
        endfunction
        "定义快捷键来触发切换。这里以 <F2> 作为示例。
        nnoremap <leader>ht :call ToggleRemoveTrailingWhitespace()<CR>
        "定义高亮组
        highlight TrailingWhitespace ctermbg=grey ctermfg=white guibg=grey guifg=white
        " 自动高亮行末空格
        autocmd VimEnter,Colorscheme * highlight TrailingWhitespace ctermbg=grey ctermfg=white guibg=grey guifg=white
        autocmd VimEnter,Colorscheme * match TrailingWhitespace /\s\+$/
        " 设置默认为关闭高亮
        let g:whitespace_highlighted = 1
        "创建一个函数来切换空格高亮
        function! ToggleWhitespaceHighlight()
            if !exists('g:whitespace_highlighted') || !g:whitespace_highlighted
                let g:whitespace_highlighted = 1
                match TrailingWhitespace /\s\+$/
                echo "Trailing whitespace highlight: ON"
            else
                let g:whitespace_highlighted = 0
                match none
                echo "Trailing whitespace highlight: OFF"
            endif
        endfunction
        " 添加快捷键映射，这里设置为 <F3>
        nnoremap <leader>hl :call ToggleWhitespaceHighlight()<CR>
    ]]
end
whitespace()
