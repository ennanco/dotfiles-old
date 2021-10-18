let mapleader = "_"               "Define the leader character for additional functions
filetype off


call plug#begin()
Plug 'davidhalter/jedi-vim'                                     " Python auto-complete
Plug 'vim-scripts/indentpython.vim'                             " Python auto-indentation
Plug 'altercation/vim-colors-solarized'                         " Solarized theme
Plug 'arcticicestudio/nord-vim'                                 "Make nord theme available
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}              " NERDTree to explore directory
Plug 'tpope/vim-fugitive'                                       " Git integration plugin
Plug 'tpope/vim-surround'                                       " Complete the bracket
Plug 'tpope/vim-repeat'                                         " maps . to repeat last command
Plug 'tpope/vim-commentary'                                     "comment multiple lines, paragraphs or sections by using 'gc'
Plug 'tmhedberg/SimpylFold'                                     " Easy folding to hide funtions
Plug 'bronson/vim-trailing-whitespace'                          " Mark as incorrect any space
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy finder for files command :Files
Plug 'junegunn/fzf.vim'                                         "Counter part for fzf
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set nocompatible                "set compatibility with old vi to none, required fro many other options

set encoding=utf-8              "set the codification used in the files

set backspace=indent,eol,start  "allow backspacing over everything in insert mode

set history=50                  "keep 50 lines of command line history

set ruler                       "show the cursor position all the time

set encoding=utf-8              "Ensure the compatibility of the file save with non-ANSI characters

set showcmd                     "display incomplete commands

set incsearch                   "do incremental searching

set number relativenumber       "show line numbers

set mouse=a                     "Do not select the number lines with the mouse

set expandtab                   "use spaces instead of tabs

set fileformat=unix             " Sure that the file have a proper format

set tabstop=4                   "insert 4 spaces whenever the tab key is pressed

set shiftwidth=4                "set indentation to 4 spaces

set hlsearch                    "highlight search terms

set ic                          "Ignore Case during searches

set autoindent                  "start new line at the same indentation level

:syntax on                       "syntax highlighting

set cmdheight=1                 "The commandbar height

set showmatch                   "Show matching bracets when text indicator is over them

set nobackup                    " do not keep backup files, it's 70's style cluttering

set noswapfile                  " do not write annoying intermediate swap files,

set ttimeoutlen=50              "Solves: there is a pause when leaving insert mode

set splitbelow                  " Horizontal splits open below current file

set splitright                  " Vertical splits open to the right of the current file

set wildmode=longest,list,full  " Pressing <Tab> shows command suggestions similar to pressing <Tab>
                                " in bash
set nohlsearch                  "set highlight in searches off

set clipboard=unnamedplus       "share the clipboard of the XWindows

set visualbell
set t_vb=

"remove the default behavior that any change is copied in the default registry
nnoremap c "_c
"nnoremap d "_d

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Setup theme
"colorscheme solarized
"colorscheme industry
"let g:solarized_termcolors=256
if has('gui_running')
    colorscheme  nord
    set background=ligth
else
    colorscheme nord
    set background=dark
endif
call togglebg#map("<F5>")

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

"Powerline setup
let g:airline_theme='powerlineish'
let g:airline_symbols_powerline_fonts = 1
 " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''

set laststatus=2
set t_Co=256

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"NERDTree defining the shortcut
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Spell-check ]s and [s to move between mistakes z= for suggestions, zg, zug, zw, zuw:
map <leader>o :setlocal spell! spelllang=en_gb<CR>
map <F6> :setspelllang=en_us<CR>
map <F7> :set spelllang=es<CR>

" Ensure files are read as what I want:
autocmd BufRead,BufNewFile *.py set filetype=python
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Compile document, be it groff/LaTeX/markdown/etc.
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
map <leader>p :!opout <c-r>%<CR><CR>

" Navigating with guides
	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l

"""LATEX
	" Word count:
	autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
	" Code snippets
	autocmd FileType tex inoremap <leader>fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap <leader>em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap <leader>bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap <leader> <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap <leader>it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap <leader>ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap <leader>ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap <leader>li <Enter>\item<Space>
	autocmd FileType tex inoremap <leader>ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap <leader>tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap <leader>a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap <leader>sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap <leader>chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap <leader>sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap <leader>ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap <leader>sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
"	autocmd FileType tex inoremap <leader>tt \texttt{}<Space><++><Esc>T{i
"	autocmd FileType tex inoremap <leader>bt {\blindtext}
	autocmd FileType tex inoremap <leader>col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap <leader>rn (\ref{})<++><Esc>F}i
""".bib
	autocmd FileType bib inoremap <leader>a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap <leader>b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap <leader>c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

"""HTML
	autocmd FileType html inoremap <leader>b <b></b><Space><++><Esc>FbT>i
	autocmd FileType html inoremap <leader>it <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap <leader>1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap <leader>2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap <leader>3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap <leader>p <p></p><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap <leader>a <a<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap <leader>e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap <leader>ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap <leader>li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap <leader>ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap <leader>im <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html inoremap <leader>td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap <leader>tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html inoremap <leader>th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap <leader>tab <table><Enter></table><Esc>O
	autocmd FileType html inoremap <leader>dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html inoremap <leader>dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	autocmd FileType html inoremap &<space> &amp;<space>
	autocmd FileType html inoremap á &aacute;
	autocmd FileType html inoremap é &eacute;
	autocmd FileType html inoremap í &iacute;
	autocmd FileType html inoremap ó &oacute;
	autocmd FileType html inoremap ú &uacute;
	autocmd FileType html inoremap ä &auml;
	autocmd FileType html inoremap ë &euml;
	autocmd FileType html inoremap ï &iuml;
	autocmd FileType html inoremap ö &ouml;
	autocmd FileType html inoremap ü &uuml;
	autocmd FileType html inoremap ã &atilde;
	autocmd FileType html inoremap ẽ &etilde;
	autocmd FileType html inoremap ĩ &itilde;
	autocmd FileType html inoremap õ &otilde;
	autocmd FileType html inoremap ũ &utilde;
	autocmd FileType html inoremap ñ &ntilde;
	autocmd FileType html inoremap à &agrave;
	autocmd FileType html inoremap è &egrave;
	autocmd FileType html inoremap ì &igrave;
	autocmd FileType html inoremap ò &ograve;
	autocmd FileType html inoremap ù &ugrave;

"MARKDOWN
	autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown inoremap ,l --------<Enter>
