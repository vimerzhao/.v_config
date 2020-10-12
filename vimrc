" 通用配置
if has('gui_running')
    colorscheme monokain
    if !exists("g:spf13_no_big_font")
        if LINUX() && has("gui_running")
            set guifont=Monaco\ 14,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        elseif OSX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
        elseif WINDOWS() && has("gui_running")
            " 高亮显示当前行/列
            set cursorline
            set cursorcolumn
            set guifont=Consolas:h17,Monaco:h14,Andale_Mono:h14,Menlo:h14,Courier_New:h14
            set nospell
            " full screen
            autocmd GUIEnter * simalt ~x
        endif
    endif
endif

" for tmux
if exists('$TMUX')
    set term=screen-256color
endif

" 处理TMUX或一些终端的鼠标形状问题
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif


" 判定平台，Window/Mac/Linux能做的事情，需要做的事情不一样
" https://superuser.com/questions/194715/how-to-make-vim-settings-computer-dependent-in-vimrc
if has('win32')
elseif has('mac')
elseif has('unix')
endif

Plugin 'SirVer/ultisnips'
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsExpandTrigger="<c-l>"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<c-s-k>"
" 这个插件的UltiSnips目录不生效，这里手动触发一下
"set rtp+=~/.vim/bundle/vim-snippets
"set rtp+=~/.v_config/.vim


Plugin 'ycm-core/YouCompleteMe'
