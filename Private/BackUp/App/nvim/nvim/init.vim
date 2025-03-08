lua print('Neovim started...')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a                 " Enable mouse
set expandtab               " Tab setting 
set tabstop=4               " Tab setting 
set shiftwidth=4            " Tab setting
set listchars=tab:\¦\       " Tab charactor 
set list
set foldmethod=syntax         
set foldnestmax=1
set foldlevelstart=3        "  
set number                  " Show line number
set ignorecase              " Enable case-sensitive 

" Disable backup
set nobackup
set nowb
set noswapfile

if has('win32')
  set clipboard=unnamed  
else
  set clipboard=unnamedplus
endif

nmap <M-Right> :vertical resize +1<CR>    
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>


call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'junegunn/fzf', 
    \ { 'do': { -> fzf#install() } }            " Fuzzy finder 
Plug 'junegunn/fzf.vim'

Plug 'xiyaowong/transparent.nvim'

Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'voldikss/vim-floaterm'                  " Float terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/rstacruz/vim-closer' " For brackets autocompletion
Plug 'Mofiqul/dracula.nvim'

" Auto-completion  For Javascript
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

set encoding=UTF-8

call plug#end()

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme dracula

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

if (has("autocmd"))
  augroup colorextend
    autocmd ColorScheme 
      \ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
    autocmd ColorScheme 
      \ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
  augroup END
endif


inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor
