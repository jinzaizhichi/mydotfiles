function history()
    vim.cmd [[packadd! vim-mundo]]
    vim.cmd [[packadd! vim-janah]]
    vim.cmd [[packadd! vim-lastplace]]
    vim.cmd [[packadd! vim-misc]]
    vim.cmd [[packadd! vim-session]]
    vim.cmd[[
        "设置undotree
        if has("persistent_undo")
            set undofile
            set undodir=/root/.config/nvim/plugged/undotree/.undodir
        endif
        nnoremap <leader>un :<c-u>MundoToggle<cr>
        "设置vim-session
        let g:session_autosave = 'yes'
        let g:session_autoload = 'no'
    ]]
end
history()
