function git()
    vim.cmd [[packadd! lazygit.nvim]]
    vim.cmd [[
        " setup mapping to call :LazyGit
        nnoremap <silent> <leader>gg :LazyGit<CR>
    ]]
end
git()
