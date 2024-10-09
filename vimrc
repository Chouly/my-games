" 初始化 vim-plug
call plug#begin('~/.vim/plugged')

" 在这里添加你需要的插件
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'rstacruz/sparkup'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/LeaderF'
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/taglist.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dense-analysis/ale'
" 结束插件配置
call plug#end()

filetype on
syntax on

set showmatch

set number

set tabstop=4

set cursorline                        " 启用光标行高亮
highlight CursorLine cterm=NONE ctermbg=darkgray guibg=#dfdcf0" 设置光标行背景色

set autoindent
set smartindent

set shiftwidth=4

set softtabstop=4

"set list
"set listchars=tab:>>,trail:.

autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

set history=1000

set hlsearch
set incsearch
" ==============================================================================
" color and fonts
" ==============================================================================
set t_Co=256          " 强制使用 256 色
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" Set the background to light mode
set background=light

" Set pure white background and text color settings
highlight Normal ctermbg=white guibg=white
highlight Normal ctermfg=black guifg=black

" Customize syntax colors to ensure visibility
highlight Comment ctermfg=grey guifg=grey
highlight String ctermfg=blue guifg=blue
highlight Keyword ctermfg=darkblue guifg=darkblue

" Other useful Vim settings
set number          " Show line numbers
set cursorline      " Highlight the current line
set hlsearch        " Highlight search results
set termguicolors   " Enable true color support if available
" set termguicolors     " 使用真彩色 (如果使用 24 位色彩)
" set Vim-specific sequences for RGB colors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" ==============================================================================
" vim-airline
" ==============================================================================
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
"let g:airline_theme='onedark'
let g:airline_theme='desertink'
let g:airline#extensions#default#section_truncate_width = {
   \ 'b': 79,
   \ 'x': 60,
   \ 'y': 80,
   \ 'z': 45,
   \ }
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z' ]
    \ ]

" ==============================================================================
" NERDTree
" ==============================================================================
let g:NERDTreeWinSize = 40
let g:NERDTreeWinPos = "left"
noremap <silent> <leader>nn :NERDTreeToggle<CR>
noremap <silent> <leader>nf :NERDTreeFind<CR>



set tags=./tags;,tags

let Tlist_Ctags_Cmd="/usr/bin/ctags"

let Tlist_Show_One_File=0
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Right_Window=1

" ==============================================================================
" cscope
" ==============================================================================
if has("cscope")
   set csprg=/usr/bin/cscope              "指定用来执行 cscope 的命令
   set csto=1                             "先搜索tags标签文件，再搜索cscope数据库
   set cst                                "使用|:cstag|(:cs find g)，而不是缺省的:tag
   set nocsverb                           "不显示添加数据库是否成功
   " add any database in current directory
   if filereadable("cscope.out")
	execute 'cs add ' . expand('%:p:h') . '/cscope.out'
   endif
   set csverb                             "显示添加成功与否
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


" ==============================================================================
" cpp enhanced highlight
" ==============================================================================
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

