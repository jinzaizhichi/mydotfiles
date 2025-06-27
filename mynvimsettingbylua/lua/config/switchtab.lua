local boolean tabflag = true
local function changetab()
    if tabflag == true then
        vim.o.expandtab = false
        vim.o.tabstop = nil
        vim.o.softtabstop = nil
        vim.o.shiftwidth = nil
        tabflag = false
    else
        vim.o.expandtab = true
        vim.o.tabstop = 4
        vim.o.softtabstop = 4
        vim.o.shiftwidth = 4
        tabflag = true
    end
end
vim.keymap.set("n", "<tab><tab>", changetab , nil)
vim.keymap.set("v", "<tab><tab>", changetab , nil)
