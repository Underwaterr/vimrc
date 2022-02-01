" Commands to remember!
" Do `diw` to delete a whole word from the end of the word

" Syntax Highlighting
syntax enable

" Highlight matching brace
set showmatch

" Word Wrap
set wrap
set linebreak
set nolist
set breakindent

" Tabs
set autoindent
set expandtab
set shiftwidth=2
" set smartindent
set list
set listchars=tab:␉·,trail:·

" Show (relative) line numbers
" https://codeyarns.com/2015/03/24/absolute-relative-and-hybrid-line-numbers-in-vim/
set number relativenumber
highlight LineNr ctermfg=238

" Turn on & off line numbers with Ctrl+n
nnoremap <C-n> :set number! relativenumber!<CR>

" Hotkey to run file in Node
" noremap <F2> :w <CR> :!node % <CR>

" netrw
" let g:netrw_list_hide='.DS_Store,.git,.cache,dist,node_modules'
" Disable banner for Netrw
" let g:netrw_banner = 0
" Default to tree view
" let g:netrw_liststyle = 3
" Resolve issue with quitting
" https://vi.stackexchange.com/a/13012
" autocmd FileType netrw setl bufhidden=delete

" Nicer Split Bar
set fillchars-=vert:\| | set fillchars+=vert:\ 
autocmd colorscheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

" Dim 'end of buffer' tildes
highlight EndOfBuffer ctermfg=black ctermbg=black

" Cycle thru buffers w/ tab key
" nnoremap <Tab> :bnext!<CR>
" Overwritten for 'Better Window Management' section!

" Set the mouse to work better
set mouse=a

" Scrolling better with Shift-Arrow
map <S-Down> <C-E>
map <S-Up> <C-Y>
" How many lines you see above and below cursor
set scrolloff=3
" Alternatively, keep cursor centered
" nnoremap j jzz
" nnoremap k kzz

" Better Window Management
" From https://youtu.be/sSOfr2MtRU8
set splitright
nmap ss :vnew<Return> :NERDTreeToggle<Return>
" :NERDTreeVCS<CR>
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
nmap <S-Tab> :tabprev<CR>
nmap <Tab> :tabnext<CR>

" Using vim-plug (https://github.com/junegunn/vim-plug)
" Installed at `~/.vim/autoload/plug.vim`
" Remember to run :PlugInstall 😇
let g:plug_window = 'enew' " https://github.com/junegunn/vim-plug/issues/651

call plug#begin()

  " NERD Tree
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Dev Iconz for NERD Tree
  Plug 'ryanoasis/vim-devicons'

  " HTML5
  Plug 'othree/html5.vim'

  " JavaScript
  Plug 'pangloss/vim-javascript'  " This kind indents JS inside HTML correctly
  "Plug 'yuezk/vim-js'            " This one does not!
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'posva/vim-vue'
  Plug 'digitaltoad/vim-pug'
  " Plug 'prettier/prettier'
  Plug 'prettier/vim-prettier'

  " Python
  Plug 'vim-python/python-syntax'
  Plug 'nvie/vim-flake8'

  " Markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'

  " nginx
  Plug 'chr4/nginx.vim'

  " Lightline
   Plug 'itchyny/lightline.vim'

  " Night Owl color scheme
  Plug 'haishanh/night-owl.vim'

  " Dracula color scheme
  Plug 'dracula/vim', { 'as': 'dracula' }

  " Highlight the cursor
  Plug 'miyakogi/conoline.vim'

  " Vimwiki
  Plug 'vimwiki/vimwiki'

  " Black code formatter/linter for Python
  Plug 'ambv/black'

call plug#end()

  " Less uggo highlight warning 
  hi QuickFixLine ctermbg=234

" JavaScript
  let g:javascript_conceal_function = "ƒ"
  let g:javascript_conceal_null = "Ø"
  let g:javascript_conceal_undefined = "¿"
  let g:javascript_conceal_return = "↩"
  " Only if using 'vim-javascript' plugin
  let g:vim_jsx_pretty_colorful_config = 1
  " No semicolons on Prettier!
  let g:prettier#config#semi = 'false'

" Markdown
  " Disable folding
  let g:vim_markdown_folding_disabled = 1
  set conceallevel=2
  " Fix indentation?
  let g:vim_markdown_new_list_item_indent = 0
  let g:vim_markdown_auto_insert_bullets = 0
  " Enable ~~strikethrough~~
  let g:vim_markdown_strikethrough = 1


" Night Owl
  if (has("termguicolors"))
   set termguicolors
  endif
  " colorscheme night-owl
  colorscheme dracula
  " Set color of concealed characters
  highlight Conceal guifg=white guibg=black
  " Moar fixes
  hi Search guibg=Yellow
  hi Todo guibg=NONE guifg=Grey

" Lightline
" For Vim's statusline stuff: https://kadekillary.work/post/statusline-vim/
  " Disable Vim's default status bar set noshowmode
  " Use Night Owl color scheme :)
  let g:lightline = { 'colorscheme': 'nightowl' }
  let g:lightline.component = {
    \ 'hex': '0x%-02B',
    \ 'hexline': '0x%04-2O' }
  let g:lightline.active = { 
    \ 'left': [
      \ ['mode', 'paste'],
      \ ['readonly', 'filename', 'modified'] ],
    \ 'right': [ 
      \ ['lineinfo', 'syntastic'], 
      \ ['fileformat', 'fileencoding', 'hex', 'filetype'] ] }
  let g:lightline.mode_map = {
    \ 'n' : '🌙',
    \ 'i' : '🧚',
    \ 'R' : '💁',
    \ 'v' : '👓',
    \ 'V' : '🕶',
    \ "\<C-v>": '🥽',
    \ 'c' : '✨',
    \ 's' : 'SELECT',
    \ 'S' : 'S-LINE',
    \ "\<C-s>": 'S-BLOCK',
    \ 't': 'TERMINAL',
    \ }

" Conoline
  let g:conoline_auto_enable = 1

" NERDTree Config
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"

" Turn off automatic comments
autocmd FileType * setlocal formatoptions-=cro

" Preview in NERDTree
let NERDTreeMapPreview = 'p'
