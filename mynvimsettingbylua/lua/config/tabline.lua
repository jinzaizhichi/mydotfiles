function tabline()
    vim.cmd [[packadd! tabline.nvim]]
    vim.cmd [[
        nnoremap <c-c> :bdelete!<cr>
        nnoremap <c-b> :TablineBufferNext<cr>
        nnoremap <c-h> :TablineBufferPrevious<cr>
        nnoremap <left> :TablineBufferFirst<cr>
        nnoremap <right> :TablineBufferLast<cr>
        nnoremap <leader>ln  :TablineTabNew #<CR>
        nnoremap <leader>lt :TablineToggleShowAllBuffers<cr>
    ]]
end

tabline()
require'tabline'.setup {
      -- Defaults configuration options
      enable = true,
      options = {
      -- If lualine is installed tabline will use separators configured in lualine by default.
      -- These options can be used to override those settings.
        section_separators = {'|❯', '|❮'},
        component_separators = {'▶', '◀'},
        max_bufferline_percent = 90, -- set to nil by default, and it uses vim.o.columns * 2/3
        show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
        show_devicons = true, -- this shows devicons in buffer section
        show_bufnr = false, -- this appends [bufnr] to buffer section,
        show_filename_only = true, -- shows base filename only instead of relative path in filename
      }
}

vim.cmd[[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]
