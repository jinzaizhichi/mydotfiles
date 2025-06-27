function cleverf()
    vim.cmd [[packadd! clever-f.vim]]
    vim.cmd [[
        map f <Plug>(clever-f-f)
        map F <Plug>(clever-f-F)
        map t <Plug>(clever-f-t)
        map T <Plug>(clever-f-T)
    ]]
end
cleverf()
