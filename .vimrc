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

set nolist
set autoindent

set ruler
set number
set wildmenu
set showcmd
set cursorline

set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set clipboard=unnamed

" ビープ音無効化
set visualbell t_vb=
set noerrorbells

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

call dein#add('Shougo/neocomplete')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('w0ng/vim-hybrid')
call dein#add('scrooloose/nerdtree')
call dein#add('itchyny/lightline.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tyru/open-browser.vim')
call dein#add('vim-scripts/TwitVim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('plasticboy/vim-markdown')
call dein#add('tyru/open-browser.vim')
call dein#add('shime/vim-livedown')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('kien/ctrlp.vim')

" programming syntax
call dein#add('leafgarland/typescript-vim')
call dein#add('othree/yajs.vim')
call dein#add('elixir-lang/vim-elixir')
call dein#add('keith/swift.vim')
call dein#add('zah/nim.vim')

" css syntax
call dein#add('hail2u/vim-css3-syntax')
call dein#add('wavded/vim-stylus')

" html syntax
call dein#add('slim-template/vim-slim')
call dein#add('digitaltoad/vim-pug')
call dein#add('othree/html5.vim')


call dein#end()
call dein#save_state()

colorscheme hybrid
set background=dark
syntax on


" ---------------------------
"  lightline.vim settings
" ---------------------------

set ambiwidth=single
set laststatus=2
"wombat
let g:lightline = {
        \  'colorscheme': 'wombat',
        \  'mode_map': {'c': 'NORMAL'},
        \  'separator': { 'left': "\u2b80", 'right': "" },
        \  'subseparator': { 'left': "\u2b81", 'right': "" },
        \  'active': {
        \     'left': [ ['mode', 'paste'], [ 'fugitive', 'filename' ] ],
        \     'right': [ ['lineinfo'] ]
        \   },
        \  'inactive': {
        \     'right': [ ['lineinfo'] ]
        \  },
        \  'component_function': {
        \     'modified': 'LightlineModified',
        \     'fugitive': 'LightlineFugitive',
        \     'filename': 'LightlineFilename',
        \     'mode': 'LightlineMode',
        \   }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '*' : &modifiable ? '' : '-'
endfunction

function! LightlineFilename()
  return (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#gMyFileformatet_status_string() :
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

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" ---------------------------
" important settings
" ---------------------------

nnoremap <ESC><ESC> :nohlsearch<CR>


" ---------------------------
" develop settings
" --------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

nnoremap @p :CtrlP<CR>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|deps'

" neocomplete
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><C-Tab> pumvisible() ? "\<Up>" : "\<C-Tab>"

"neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


" ---------------------------
" hobby settings
" ---------------------------

" TwitVim
let twitvim_browser_cmd = 'open' " for Mac
let twitvim_force_ssl = 1
let twitvim_count = 40

" テキスト上のリンクを開けるようにする
function! OpenLink()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  endif
endfunction

map <Leader>w :call OpenLink()<CR>

" markdown折りたたみ無効
let g:vim_markdown_folding_disabled=1

" markdownの末尾空白のハイライトを無効化
let g:extra_whitespace_ignored_filetypes = ['markdown']


" --------------------
" other settings
" --------------------

"NERDTree settings
let g:NERDTreeDirArrowExpandable  = '🍣'
let g:NERDTreeDirArrowCollapsible = '🍣'
let g:NERDTreeShowHidden = 1

" filetype set
au BufRead,BufNewFile *.md  set filetype=markdown
au BufRead,BufNewFile *.mjs set filetype=javascript
au BufRead,BufNewFile *.slim,*.slime setfiletype slim

au FileType javascript syn match jsDecorator '@[a-zA-Z_][0-9a-zA-Z_$]*'
au FileType javascript hi link jsDecorator Function
