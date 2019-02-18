if &compatible
  set nocompatible
endif

set number
set shiftwidth=2
set softtabstop=2
set backspace=indent,eol,start
set clipboard=unnamed

set runtimepath+=~/.cache/dein/./repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')

  " For Elixir
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('slashmili/alchemist.vim')

  " For TypeScript
  " npm i -g neovim typescript
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})

  " For JavaScript
  " npm install -g tern flow-bin
  call dein#add('carlitux/deoplete-ternjs')
  call dein#add('othree/yajs.vim')
  call dein#add('othree/es.next.syntax.vim')
  call dein#add('wokalski/autocomplete-flow')
  call dein#add('flowtype/vim-flow')

  " For Elm
  " npm install -g elm elm-test elm-oracle elm-format
  call dein#add('pbogut/deoplete-elm')
  call dein#add('ElmCast/elm-vim')

  " For HTML/CSS
  call dein#add('slim-template/vim-slim')

  " Theme
  call dein#add('mhartington/oceanic-next')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-fugitive')

  " Directory Tree
  call dein#add('scrooloose/nerdtree')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

" -----------------------------------------------------
" Theme
" -----------------------------------------------------
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme OceanicNext

let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1

" -----------------------------------------------------
" Typing UX
" -----------------------------------------------------
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"

" -----------------------------------------------------
" Directory Tree
" -----------------------------------------------------
map <C-n> :NERDTreeToggle<CR>

" -----------------------------------------------------
" Syntax
" -----------------------------------------------------
autocmd BufNewFile,BufRead *.slim,*.slime setlocal filetype=slim


if dein#check_install()
  call dein#install()
endif

