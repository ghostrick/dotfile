set nocompatible
filetype plugin indent on

if !has('gui_running')
    set notimeout
    set ttimeout
    set timeoutlen=100
endif

set nowrap

scriptencoding utf-8
set encoding=utf-8
set guifont=*
set t_Co=256
set hlsearch
set ignorecase
set smartcase
set wrap
"set shell=git
"set shell=/bin/bash

set nolist
set autoindent

set ruler
set number
set wildmenu
set showcmd

"set shiftwidth=4
"set softtabstop=4
"set expandtab
"set tabstop=4
"set shiftwidth=4
"set smarttab
set backspace=indent,eol,start
set clipboard=unnamed


" key map
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
map <C-n> :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('kchmck/vim-coffee-script')
call dein#add('wavded/vim-stylus')
call dein#add('digitaltoad/vim-pug')
call dein#add('othree/html5.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('othree/yajs.vim')
call dein#add('w0ng/vim-hybrid')
call dein#add('leafgarland/typescript-vim')
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tyru/open-browser.vim')
call dein#add('basyura/twibill.vim')
call dein#add('mattn/webapi-vim')
call dein#add('vim-scripts/TwitVim')
call dein#add('elixir-lang/vim-elixir')
call dein#add('ryym/vim-riot')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('rust-lang/rust.vim')
call dein#add('dart-lang/dart-vim-plugin')
call dein#add('posva/vim-vue')
call dein#add('mattn/emmet-vim')
call dein#add('plasticboy/vim-markdown')
call dein#add('tyru/open-browser.vim')
call dein#add('shime/vim-livedown')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('purescript-contrib/purescript-vim')

"call dein#update()
call dein#end()
call dein#save_state()

colorscheme hybrid
set background=dark

" markdown
au BufRead,BufNewFile *.md set filetype=markdown

let g:NERDTreeDirArrowExpandable  = '🍣'
let g:NERDTreeDirArrowCollapsible = '🍣'
syntax on


"補完
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css           setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml           setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" -----------------
"   lightline.vim
" -----------------

set ambiwidth=single
set laststatus=2
"wombat
let g:lightline = {
        \  'colorscheme': 'wombat',
        \  'mode_map': {'c': 'NORMAL'},
    \  'separator': { 'left': "\u2b80", 'right': "\u2b82" },
    \  'subseparator': { 'left': "\u2b81", 'right': "\u2b83" },
        \  'active': {
        \     'left': [ ['mode', 'paste', 'shinchoku'], [ 'fugitive', 'filename' ] ]
        \   },
        \  'component_function': {
        \     'modified': 'LightlineModified',
        \     'readonly': 'LightlineReadonly',
        \     'fugitive': 'LightlineFugitive',
        \     'filename': 'LightlineFilename',
        \     'fileformat': 'LightlineFileformat',
        \     'filetype': 'LightlineFiletype',
        \     'fileencoding': 'LightlineFileencoding',
        \     'mode': 'LightlineMode',
        \   }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" TwitVim
let twitvim_browser_cmd = 'open' " for Mac
"let twitvim_browser_cmd = 'C:¥Program Files¥Your_Browser_Path' " for Windows
let twitvim_force_ssl = 1
let twitvim_count = 40

" openURL
function! OpenLink()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  endif
endfunction

map <Leader>w :call OpenLink()<CR>

" shinchoku.vim
let shinchoku_reset_time = 5

" rust
let g:rustfmt_autosave = 1

" 保存時に^M除去
"autocmd BufWritePre * :set fileformat=unix
