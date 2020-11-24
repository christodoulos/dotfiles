" """""""""""""""" "
" junegunn/fzf.vim "
" """""""""""""""" "

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)


" .............................................................................
" lambdalisue/fern.vim
" .............................................................................

" Disable netrw.

let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings
let g:fern#disable_default_mappings = 1

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark)
  nmap <buffer> K <Plug>(fern-action-mark-children:leaf)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" """"""""""""""""""" "
" preservim/nerdcommenter
" """"""""""""""""""" "

let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

" """"""""""""""""" "
" mhinz/vim-grepper "
" """"""""""""""""" "

let g:grepper={}
let g:grepper.tools=["rg"]

xmap gr <plug>(GrepperOperator)

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s//g \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
    \ "sy
    \ gvgr
    \ :cfdo %s/<C-r>s//g \| update
     \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" """""""""""""""""""""""""""""" "
" ntpeters/vim-better-whitespace "
" """""""""""""""""""""""""""""" "

let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_on_save=1

" """""""""""""""" "
" Konfekt/FastFold "
" """""""""""""""" "

let g:fastfold_savehook=0
let g:fastfold_fold_command_suffixes=[]

" """""""""""""""""""""" "
" junegunn/limelight.vim "
" """""""""""""""""""""" "

let g:limelight_conceal_ctermfg=244

" """""""""""""""""""""""""""" "
" iamcco/markdown-preview.nvim "
" """""""""""""""""""""""""""" "

let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='${MYLOCAL}/lib/github-markdown-css/github-markdown.css'

" """"""""""""" "
" airline fonts "
" """"""""""""" "

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" """"""" "
" neomake "
" """"""" "

" Call When writing a buffer (no delay).
call neomake#configure#automake('w')

" function! MyOnBattery()
"   return readfile('/sys/class/power_supply/AC/online') == ['0']
" endfunction
"
" if MyOnBattery()
"   call neomake#configure#automake('w')
" else
"   call neomake#configure#automake('nw', 1000)
" endif

let g:neomake_python_enabled_makers = ['flake8']

" """""""" "
" deoplete "
" """""""" "
" use deoplete
let g:deoplete#enable_at_startup = 1
" close preview after autocompletion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" navigate through auto-completion with tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" """"""""" "
" neoformat "
" """"""""" "

"let g:neoformat_enabled_yaml = ['prettier']
"let g:neoformat_enabled_python = ['black']

"augroup fmt
"  autocmd!
"  autocmd BufWritePre * Neoformat
"augroup END

" davidhalter/jedi-vim
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" machakann/vim-highlightedyank
" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000

" """"""""""""""""""""""""" "
" Prettier related settings "
" """"""""""""""""""""""""" "
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" """"""""""""""""""""""" "
" Python related settings "
" """"""""""""""""""""""" "

"let g:python3_host_prog='/usr/bin/python3'
"let g:python_host_prog='/usr/bin/python2'

"" PEP8 python indentation
"
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
"
"" Python flagging unnecessary whitespace
"
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
