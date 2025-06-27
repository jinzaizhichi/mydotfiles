function dashboard()
    vim.cmd [[packadd! dashboard-nvim]]
    vim.cmd [[
        "设置dashboard
        let g:dashboard_default_executive ='clap'
        let g:indentLine_fileTypeExclude = ['dashboard']
        let g:dashboard_fzf_engine='ag'
        let g:dashboard_custom_header = [
              \'             ▄▄▀▀▀▀▀▀▀▀▄▄              ',
              \'          ▄▀▀            ▀▄▄           ',
              \'        ▄▀                  ▀▄         ',
              \'       ▌             ▀▄       ▀▀▄      ',
              \'      ▌                ▀▌        ▌     ',
              \'     ▐                  ▌        ▐     ',
              \'     ▌▐    ▐    ▐       ▌         ▌    ',
              \'    ▐ ▌    ▌  ▐ ▌      ▐       ▌▐ ▐    ',
              \'    ▐ ▌    ▌▄▄▀▀▌▌     ▐▀▌▀▌▄  ▐ ▌ ▌   ',
              \'     ▌▌    ▐▀▄▌▌▐▐    ▐▐▐ ▐ ▌▌ ▐ ▌▄▐   ',
              \'   ▄▀▄▐    ▌▌▄▀▄▐ ▌▌ ▐ ▌▄▀▄ ▐  ▐ ▌ ▀▄  ',
              \'  ▀▄▀  ▌  ▄▀ ▌█▐  ▐▐▀   ▌█▐ ▀▄▐ ▌▌   ▀ ',
              \'   ▀▀▄▄▐ ▀▄▀ ▀▄▀        ▀▄▀▄▀ ▌ ▐      ',
              \'      ▀▐▀▄ ▀▄        ▐      ▀▌▐        ',
              \'        ▌ ▌▐ ▀              ▐ ▐        ',
              \'        ▐ ▐ ▌    ▄▄▀▀▀▀▄    ▌ ▐        ',
              \'         ▌▐ ▐▄   ▐     ▌  ▄▀  ▐        ',
              \'        ▐  ▌▐▐▀▄  ▀▄▄▄▀ ▄▀▐   ▐        ',
              \'        ▌▌ ▌▐ ▌ ▀▄▄    ▄▌▐ ▌  ▐        ',
              \'       ▐ ▐ ▐▐ ▌    ▀▀▄▀▌▐  ▌  ▌        ',
              \'       ▌  ▌▐ ▌        ▐▀▄▌ ▐           ',
              \]

        let g:dashboard_custom_shortcut={
          \ 'last_session' : 'Semicolon d l',
          \ 'find_history' : 'Semicolon d h',
          \ 'find_file' : 'Semicolon d f',
          \ 'new_file' : 'Semicolon d n',
          \ 'find_word' : 'Semicolon d t',
          \ 'change_colorscheme' : 'Semicolon d c',
          \ 'book_marks' : 'Semicolon d r',
          \ }

        nnoremap <silent> <Leader>db :<c-u>Dashboard<cr>
        nnoremap <silent> <Leader>ds :<c-u>SessionSave<cr>
        nnoremap <silent> <Leader>dl :<c-u>SessionLoad<cr>
        nnoremap <silent> <Leader>dh :<c-u>DashboardFindHistory<cr>
        nnoremap <silent> <Leader>df :<c-u>DashboardFindFile<cr>
        nnoremap <silent> <Leader>dc :<c-u>DashboardChangeColorscheme<cr>
        nnoremap <silent> <Leader>dt :<c-u>DashboardFindWord<cr>
        nnoremap <silent> <Leader>dr :<c-u>DashboardJumpMark<cr>
        nnoremap <silent> <Leader>dn :<c-u>DashboardNewFile<cr>

    ]]
end
dashboard()
