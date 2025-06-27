function whichkey()
    vim.cmd [[packadd! vim-which-key]]
    vim.cmd[[
        "vim-which-key设置
        nnoremap <silent> <leader> :<c-u>WhichKey ';'<cr>
        nnoremap <silent> <localleader> :<c-u>WhichKey '\s'<cr>
    ]]
end
whichkey()
