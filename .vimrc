""""""""""""""""""""
" Must Have
""""""""""""""""""""
set nocompatible    " get out of horrible vi-compatible mode
set termguicolors
" GUI options
if has('win32')
    set guifont=Consolas:h11
elseif exists("$WSLENV")
    set guifont=Consolas\ 13
    set belloff=all
    :nmap p :pu<CR>
else
    set term=xterm-256color
endif
set t_Co=256
highlight ColorColumn ctermbg=101

""""""""""""""""""""
" Pathogen         #
""""""""""""""""""""
execute pathogen#infect()
"call pathogen#runtime_append_all_bundles()

""""""""""""""""""""
" Plug             #
""""""""""""""""""""
" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Colors
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'sts10/vim-pink-moon'
Plug 'rakr/vim-one'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_member_variable_highlight = 1
" Utils
Plug 'derekwyatt/vim-protodef'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'kablamo/vim-git-log'
Plug 'kevinhui/vim-docker-tools'
Plug 'Konfekt/FastFold'
Plug 'majutsushi/tagbar'
Plug 'Shougo/neocomplete.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'tpope/vim-fugitive'
Plug 'Townk/vim-autoclose'
"Plug 'vim-scripts/indentpython.vim'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'wesQ3/vim-windowswap'
Plug 'LucHermitte/lh-vim-lib'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular' "needed for vim-markdown
Plug 'plasticboy/vim-markdown'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"
"Plug 'SirVer/ultisnips'
"Plug 'Valloric/YouCompleteMe'
"Plug 'andviro/flake8-vim'
"Plug 'LucHermitte/VimFold4C'
"Plug 'WolfgangMehner/c-support'
"Plug 'vim-scripts/Conque-GDB'
call plug#end()

""""""""""""""""""""
" Solarized stuff  #
""""""""""""""""""""
let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
set background=dark
silent! colorscheme pink-moon
" Transparent background
function! s:transparent() abort
  highlight Normal ctermbg=NONE guibg=NONE
  highlight NonText ctermbg=NONE guibg=NONE
  highlight EndOfBuffer ctermbg=NONE guibg=NONE
  highlight Folded ctermbg=NONE guibg=NONE
  highlight LineNr ctermbg=NONE guibg=NONE
  highlight CursorLineNr ctermbg=NONE guibg=NONE
  highlight SpecialKey ctermbg=NONE guibg=NONE
  highlight ALEErrorSign ctermbg=NONE guibg=NONE
  highlight ALEWarningSign ctermbg=NONE guibg=NONE
  highlight GitGutterAdd ctermbg=NONE guibg=NONE
  highlight GitGutterChange ctermbg=NONE guibg=NONE
  highlight GitGutterChangeDelete ctermbg=NONE guibg=NONE
  highlight GitGutterDelete ctermbg=NONE guibg=NONE
endfunction
"call s:transparent()
set secure

""""""""""""""""""""
" General
""""""""""""""""""""
set clipboard+=unnamed " turns out I do like sharing windows clipboard
set history=1000    " How many lines of history to remember
set encoding=utf-8
set viminfo+=!      " make sure it can save viminfo
set nosol           " leave my cursor where it was
" set cf            " enable error files and error jumping
"set ffs=unix,dos,mac " support all three, in this order
" set isk+=_,$,@,%,# " none of these should be word dividers, so make them not be
" set showcmd
set regexpengine=1

""""""""""""""""""""
" Files/Backups
""""""""""""""""""""
set backup          " make backup file
set backupdir=~/.vim/backup " where to put backup files
set directory=~/.vim/temp " directory for temp files

""""""""""""""""""""
" Vim UI
""""""""""""""""""""
set wildmenu        " turn on wild menu
set wildmode=list:longest " turn on wild menu in special format (long format)
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png " ignore formats
set ruler           " Always show current positions along the bottom
set lz              " do not redraw while running macros (much faster) (LazyRedraw)
set hid             " you can change buffer without saving
set backspace=2     " make backspace work normal
set noerrorbells    " don't make noise
" set mouse=a       " use mouse everywhere
" set list          " we do what to show tabs, to ensure we get them out of my files

""""""""""""""""""""
" Visual Cues
""""""""""""""""""""
set showmatch       " show matching brackets
set mat=5           " how many tenths of a second to blink matching brackets for
set nohlsearch      " do not highlight searched for phrases
set incsearch       " BUT do highlight as you type you search phrase
set novisualbell    " don't blink
set laststatus=2    " always show the status line
" set cc=80         " set vertical line for 80 columns
" statusline ex: ~\myfile[+] [FORMAT=format] [TYPE=type] [ASCII=000] [HEX=00] [POS=0000,0000][00%] [LEN=000]
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

""""""""""""""""""""
" Indent Related
""""""""""""""""""""
set ai              " autoindent (filetype indenting instead)
set nosi            " smartindent (filetype indenting instead)
set cindent         " do c-style indenting
set expandtab       " Expand TABs to spaces
set softtabstop=2   " unify
set shiftwidth=2    " unify
set tabstop=2       " real tabs should be 4, but they will show with set list on
set copyindent      " but above all -- follow the conventions laid before us
filetype plugin on " load filetype plugins and indent settings
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""
syntax on           " syntax highlighting on
set fo=tcrq         " See Help (complex)
set shiftround      " when at 3 spaces, and I hit > ... go to 4, not 5
set expandtab       " no real tabs!
set preserveindent  " but above all -- follow the conventions laid before us
set ignorecase      " case insensitive by default
set smartcase       " if there are caps, go case-sensitive
set completeopt=menu,longest,preview " improve the way autocomplete works
" set nowrap        " do not wrap line
" set cursorcolumn  " show the current column
"set cursorline

""""""""""""""""""""
" Folding
""""""""""""""""""""
"" fastfold
nmap zuz <Plug>(FastFoldUpdate)
"set foldenable    " Turn on folding
set foldmethod=syntax " Fold on the marker
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
"let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1
" for vim-markdown
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_new_list_item_indent = 2
"" VimFold4C
"let g:fold_options = {
"   \ 'fallback_method' : { 'line_threshold' : 2000, 'method' : 'indent' },
"   \ 'fold_blank': 0,
"   \ 'fold_includes': 1,
"   \ 'max_foldline_length': 'win',
"   \ 'merge_comments' : 0,
"   \ 'show_if_and_else': 1,
"   \ 'strip_namespaces': 1,
"   \ 'strip_template_arguments': 1
"   \ }
"" default/builtin fold
" set foldenable    " Turn on folding
" set foldmarker={,} " Fold C style code
" set foldmethod=marker " Fold on the marker
" set foldlevel=100 " Don't autofold anything (but I can still fold manually)
" set foldopen-=search " don't open folds when you search into them
" set foldopen-=undo " don't open folds when you undo stuff

""""""""""""""""""""
" CTags
""""""""""""""""""""
let Tlist_Ctags_Cmd = 'ctags' " Location of ctags
let Tlist_Sort_Type = "name" " order by
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Compact_Format = 1 " show small meny
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 0 " Do not close tags for other files
let Tlist_Enable_Fold_Column = 1 " Do show folding tree
let Tlist_WinWidth = 50 " 50 cols wide, so I can (almost always) read my functions
let tlist_php_settings = 'php;c:class;d:constant;f:function' " don't show variables in php
let tlist_aspvbs_settings = 'asp;f:function;s:sub' " just functions and subs
let tlist_aspjscript_settings = 'asp;f:function;c:class' " just functions and classes
let tlist_vb_settings = 'asp;f:function;c:class' " just functions and classes

""""""""""""""""""""
" Matchit
""""""""""""""""""""
let b:match_ignorecase = 1

""""""""""""""""""""
" Perl
""""""""""""""""""""
let perl_extended_vars=1 " highlight advanced perl vars inside strings

""""""""""""""""""""
" Airline
""""""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline_theme='papercolor'

""""""""""""""""""""
" Indent Guides ; enable/disable by \ig
""""""""""""""""""""
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

""""""""""""""""""""
" Supertab
""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

""""""""""""""""""""
" Syntastic
""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++17'
let g:syntastic_go_checkers=['go', 'govet', 'golint', 'gofmt']
"let g:syntastic_py_checkers=['flake8']

""""""""""""""""""""
" Tagbar
""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""
" UltiSnips
""""""""""""""""""""
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""
" Neocomplete
""""""""""""""""""""
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_auto_select = 1
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

""""""""""""""""""""
" Custom Functions
""""""""""""""""""""
"The Leader, default is \
let mapleader=","

" Select range, then hit :SuperRetab($width) - by p0g and FallingCow
function! SuperRetab(width) range
    silent! exe a:firstline . ',' . a:lastline . 's/\v%(^ *)@<= {'. a:width .'}/\t/g'
endfunction

function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1
    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
     let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
     let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
     TagbarOpen
     wincmd J
     wincmd k
     wincmd L
    elseif tagbar_open
     NERDTree
     wincmd J
     wincmd k
     wincmd L
    else
     NERDTree
     TagbarOpen
     wincmd J
     wincmd k
     wincmd L
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
     execute window . 'wincmd w'
     if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
         break
     endif
    endfor
endfunction
nnoremap <leader>\ :call ToggleNERDTreeAndTagbar()<CR>

" Strips the trailing whitespace from a file
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <leader><Space> :call <SID>StripTrailingWhitespaces()

"replace the word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

""""""""""""""""""""
" Mappings
""""""""""""""""""""
" map <up> <ESC>:bp<RETURN> " left arrow (normal mode) switches buffers
" map <down> <ESC>:bn<RETURN> " right arrow (normal mode) switches buffers
" map <right> <ESC>:Tlist<RETURN> " show taglist
" map <left> <ESC>:NERDTreeToggle<RETURN>  " moves left fa split
" map <F2> <ESC>ggVG:call SuperRetab()<left>
" map <F12> ggVGg? " apply rot13 for people snooping over shoulder, good fun

""""""""""""""""""""
" Useful abbrevs
""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

""""""""""""""""""""
" Autocommands
""""""""""""""""""""
au BufRead,BufNewFile *.zcml set filetype=xml
au BufRead,BufNewFile *.rb,*.rhtml set tabstop=2
au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
au BufRead,BufNewFile *.otl set syntax=blockhl
au FileType python set omnifunc=pythoncomplete#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml set omnifunc=xmlcomplete#CompleteTags
au FileType c set omnifunc=ccomplete#Complete
au BufNewFile,BufRead,BufEnter *.cpp,*.cc,*.h,*.hpp set omnifunc=omni#cpp#complete#Main
"au BufRead,BufNewFile *.py,*.c,*.h,*.cpp,*.cc,*.hpp match BadWhitespace /\s\+$/
"autocmd FileType cpp,c,cxx,h,hpp,python,sh  setlocal cc=80 " set cc=80 only for these files

""""""""""""""""""""
" Change paging overlap amount from 2 to 5 (+3)
" if you swapped C-y and C-e, and set them to 2, it would
" remove any overlap between pages
""""""""""""""""""""
nnoremap <C-f> <C-f>3<C-y> "  Make overlap 3 extra on control-f
nnoremap <C-b> <C-b>3<C-e> "  Make overlap 3 extra on control-b

highlight Comment cterm=italic
" to make background transparent
"hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
set conceallevel=2 "hide links
