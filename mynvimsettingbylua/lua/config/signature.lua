function signature()
    vim.cmd [[packadd! vim-signature]]
    vim.cmd[[
        "设置signature
        let g:SignatureIncludeMarks = 'bcdefghijklmnopqrstuvwxyABCDEFGHIJKLMNOPQRSTUVWXYZ'
    ]]
end
signature()
