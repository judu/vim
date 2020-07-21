set nocompatible

" Set the indentation right
set sw=3 ts=3 sts=0 expandtab
" set the right margin to 80 characters
set tw=90

let g:rust_recommended_style = 1

let g:local_vimrc = {'names':['.lvimrc'],'hash_fun':'LVRHashOfFile'}

set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone

syntax on
filetype plugin indent on
set hidden
set lazyredraw
set showmode
set nobackup
set nowritebackup
set noswapfile
set incsearch
set autoread
set hlsearch
"set ignorecase

" Fix truecolor on tmux
set termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
" ^ See `:h xterm-true-color` for more info.
" 👇 is for italics in tmux
set t_ZH=[3m
set t_ZR=[23m
" ☝  see :h t_ZH

" Command-T plugin ignore files.
set wildignore+=*.class,target,node_modules,bower_components

"let g:molokai_original = 1
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

let g:ctrlp_cmd = 'CtrlPMixed'

source ~/.vim/vimrc.bepo

nmap <silent> ,r<space> :%s/\s\+$//g<CR>
nmap <silent> ,db :set background=dark<CR>
nmap <silent> ,lb :set background=light<CR>

nmap <silent> ,tc :set invignorecase<CR>:set ignorecase?<CR>

nmap <silent> ,sr :call setline('.', join(sort(split(getline('.'), ' ')), " "))<cr>

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>

" Toggle line number display
nmap <silent> ,sn :set invnumber<CR>:set number?<CR>

" Switch to # buffer
nmap <silent> ,b :b#<CR>

" Save the current buffer
nmap <silent> ,ss :w<CR>

" Toggle paste mode
nmap  ,p :set invpaste<CR>:set paste?<CR>

" Turn off that stupid highlight search
nmap  ,n :set invhls<CR>:set hls?<CR>

" Set text wrapping toggles
nmap  ,w :set invwrap<CR>:set wrap?<CR>

" Set up retabbing on a source file
nmap  ,rr :1,$retab<CR>

" cd to the directory containing the file in the buffer
nmap  ,cd :lcd %:h<CR>

" Make the directory that contains the file in the current buffer.
" This is useful when you edit a file in a directory that doesn't
" (yet) exist
nmap  ,md :!mkdir -p %:p:h<CR>

"Command-T mappings
noremap <leader>f :CommandTFlush<cr>\|:CommandT<cr>
noremap <leader>h :CommandTFlush<cr>\|:CommandTBuffer<cr>

" Move the cursor to the window left of the current one
nmap <silent> ,c :wincmd h<cr>

" Move the cursor to the window below the current one
nmap <silent> ,t :wincmd j<cr>

" Move the cursor to the window above the current one
nmap <silent> ,s :wincmd k<cr>

" Move the cursor to the window right of the current one
nmap <silent> ,r :wincmd l<cr>

" Close the window below this one
nmap <silent> ,ct :wincmd j<cr>:close<cr>

" Close the window above this one
nmap <silent> ,cs :wincmd k<cr>:close<cr>

" Close the window to the left of this one
nmap <silent> ,cc :wincmd h<cr>:close<cr>

" Close the window to the right of this one
nmap <silent> ,cr :wincmd l<cr>:close<cr>

" Close the current window
nmap <silent> ,cC :close<cr>

" Move the current window to the right of the main Vim window
nmap <silent> ,mr <C-W>L

" Move the current window to the top of the main Vim window
nmap <silent> ,ms <C-W>K

" Move the current window to the left of the main Vim window
nmap <silent> ,mc <C-W>H

" Move the current window to the bottom of the main Vim window
nmap <silent> ,mt <C-W>J

nmap <silent> Q G

" Get the current file's directory faster.
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>e :edit %%

function! NumberToggle()
  set invrelativenumber
endfunc

nnoremap ,rn :set invrelativenumber<cr>

set laststatus=2

" command line size N
set ch=1

set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" Hide the mouse pointer while typing
set mousehide


" The GUI (i.e. the 'g' in 'gvim') is fantastic, but let's not be
" silly about it :)  The GUI is fantastic, but it's fantastic for
" its fonts and its colours, not for its toolbar and its menus -
" those just steal screen real estate
set guioptions=ac

" This is the timeout used while waiting for user input on a
" multi-keyed macro or while just sitting and waiting for another
" key to be pressed measured in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait
"      period between the "," key and the "d" key.  If the
"      "d" key isn't pressed before the timeout expires,
"      one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
"
" The idea here is that if you have two commands, say ",dv" and
" ",d" that it will take 'timeoutlen' milliseconds to recognize
" that you're going for ",d" instead of ",dv"
"
" In general you should endeavour to avoid that type of
" situation because waiting 'timeoutlen' milliseconds is
" like an eternity.
set timeoutlen=500

" These commands open folds
set foldopen=block,jump,mark,percent,quickfix,search,tag,undo

set foldmethod=indent
set foldlevelstart=2
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048
" Keep some stuff in the history
set history=100

" Next is for Latex
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='evince'
let g:Tex_CompileRule_pdf='pdflatex --interaction=nonstopmode $*'
let g:tex_flavor='latex'
let g:Tex_MultipleCompileFormats='pdf,dvi'
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
" set iskeyword+=:

"augroup vimrcEx
"	autocmd!
"	autocmd BufReadPost *
"		\ if line("'\"") > 0 && line("'\"") <= line("$") |
"		\ exe "normal g`\"" |
"		\ endif
"augroup END

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" colorschemes configuration
let g:badwolf_darkgutter = 1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_italic=1
let g:one_allow_italics = 1
let g:solarized_contrast='high'
let g:solarized_termtrans=0
let g:solarized_visibility='high'
let g:tender_termtrans=1
colorscheme solarized8_high
"colorscheme gruvbox
"colorscheme one
"colorscheme tender
"colorscheme atom-dark
"colorscheme badwolf
let g:airline_theme='solarized_flood'

" Vim markdown stuff
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 2

" airline recommended default config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" airline symbols
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.branch = ''

" Disable syntastic for java.
let g:syntastic_java_checkers = []
let g:syntastic_haskell_checkers = []
let g:syntastic_rust_checkers = ['rustc']

autocmd FileType play2-routes setlocal tw=0

autocmd Syntax play2-html let g:syntastic_html_checkers = []

" vim-go stuff
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
" END vim-go stuff

" scalafmt stuff
noremap <F5> :Autoformat<CR>
let g:formatdef_scalafmt = "'scalafmt'"
let g:formatters_scala = ['scalafmt']

"limelight
let g:limelight_conceal_ctermfg = 'gray'

autocmd FileType rust setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=99 expandtab

" Use Hdevtools with haskell files.
" autocmd FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
" autocmd FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

" special stuff for markdown.
autocmd FileType mkd setlocal expandtab setlocal tabstop=3 setlocal sw=3 setlocal tw=90

highlight NonsecableSpaces ctermbg=172 guibg=orange
highlight RedundantSpaces ctermbg=18 guibg=darkblue

call matchadd('NonsecableSpaces', '[  ]')
call matchadd('RedundantSpaces', '\s\+$')


" vim-lsp
"au User lsp_setup call lsp#register_server({ 'name': 'rls', 'cmd': {server_info->['rls']}, 'blacklist': ['rust'] })

" asyncomplete
let g:asyncomplete_remove_duplicates = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" highlight LeadingSpaces ctermbg=234 guibg=red
" match LeadingSpaces /^\s\+/

autocmd FileType fish compiler fish

if &shell =~# 'fish$'
   set shell=bash
endif
