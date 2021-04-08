"" This is my vimrc. It changes *very* many things, but here is a reference to some of the best features
"" Note that I am not the author of most of those features. I do not claim to be. However, I have removed attributions for compactness.

""" This largely depends on having certain addons installed. 
""" First install pathogen. This is really easy, just find a tutorial online.
""" Then go into ~/.vim/bundle and git clone the following repositories:
"" Ale
" This lints code. I only use it for C/C++, but I think you can make it work with other languages as well.
" https://github.com/dense-analysis/ale.git
"
"" CtrlP
" This provides you with a fuzzy search menu to open new files from within vim. Bound to `Ctrl + f` because reaching for the p is too big an ordeal for me.
" https://github.com/ctrlpvim/ctrlp.vim.git
"
"" Supertab
" Binds autocomplete to `tab` and allows you to configure it.
" https://github.com/ervandew/supertab.git
"
"" Tagbar
" Gives you an overview of all C++ classes and functions in current file. Allows you to jump to them when selected in the window. Extremely useful when programming C++. It makes you install an extra program, directions will pop up in vim first time you start with it.
" https://github.com/majutsushi/tagbar
"
"" Autoclose
" Intelligently autocloses parentheses, brackets, quotes, etc.
" https://github.com/Townk/vim-autoclose.git
"
"" Commentary
" Allows you to quickly comment stuff out. I just use it for its `gc` command.
" https://github.com/tpope/vim-commentary.git
"
"" Dispatch
" Allows you to run make in a vim window. Extremely convenient.
" https://github.com/tpope/vim-dispatch.git
"
"" Fugitive
" Allows you to run Git commands in vim. Just type :Git and append with proper command line args.
" https://github.com/tpope/vim-fugitive.git
"
"" Surround
" Allows you to efficiently surround things with quotes, HTML tags, parentheses, etc. I never use it, but I guess it's nice to have if you ever get around to it.
" https://github.com/tpope/vim-surround.git
"
"" WindowSwap
" Makes it really easy to move window layout around.
" https://github.com/wesQ3/vim-windowswap.git

"" Basic controls that have been rebound for Colemak-DH friendliness
" `hjkl` now bound to `neio`
" `i` is now bound to `t`
" `o` and `O` have been rebound to `k` and `K`
" `n` and `N` have been rebound to `l` and `L`

"" Enabled settings TODO
" Syntax highlighting is on.
" Line numbers are enabled.
" `y`anking in one vim window now carries over to other windows.
" On exit, vim saves where you were in the file and comes back there when you open it again.
" Vim now scrolls down as long as you are within 7 rows of the bottom of the screen.
" Tab length is set to 4.

"" Minor tweaks
" `x` and `X` don't copy deleted characters
" `Ctrl + D` deletes whatever is highlighted in visual mode without copy
" `Ctrl + D` deletes the current line without copying in normal mode
" `Enter` clears search highlighting
" `Ctrl + left/right moves by one word
" `Leader` key is now bound to `,`
" `z` in visual mode searches for selected text.
" `:W` saves the file with sudo

"" Functionality added by plugins
" Parentheses and brackets will intelligently autoclose.
" `:Git` allows you to run any commands of Git without exiting vim.
" `:Make` or `:m` calls make without exiting vim.
" `gc` while selecting something comments out all selected lines.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nvim edits
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    " Resets normal cursor shape
    set guicursor=

    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Starts pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rebinding movement for Colemak
nnoremap n h|xnoremap n h|onoremap n h|vnoremap n h
nnoremap e j|xnoremap e j|onoremap e j|vnoremap e j
nnoremap i k|xnoremap i k|onoremap i k|vnoremap i k
nnoremap o l|xnoremap o l|onoremap o l|vnoremap o l

" Insert mode now bound to t
nnoremap t i

" s is now at j
nnoremap j s|xnoremap j s|onoremap j s|

" Next result is now bound to l
nnoremap l n|xnoremap l n|onoremap l n|
nnoremap L N|xnoremap L N|onoremap L N|

" Creating newline without insert mode
nnoremap k o<Esc>|xnoremap k o<Esc>|onoremap k o<Esc>|
nnoremap K O<Esc>|xnoremap K O<Esc>|onoremap K O<Esc>|

" Better tab management
nmap <C-Left> <Esc>:tabprev<CR>
nmap <C-Right> <Esc>:tabnext<CR>
nmap <C-Up> <Esc>:tabnew<CR>
nmap <C-Down> <Esc>:q<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Minor Additions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" x and X don't copy when deleting
nnoremap <silent> x "_x
vnoremap <silent> x "_x
nnoremap <silent> X "_X

" Ctrl-D to delete line without copying it
map <silent> <C-D> "_dd
vnoremap <silent> <C-D> "_d
 
" This removes last search highlighting by hitting return
nnoremap <CR> :noh<CR><CR>

" Ctrl + left/right = move forward by one word
nnoremap <C-n> b|xnoremap <C-n> b|onoremap <C-n> b|
nnoremap <C-o> w|xnoremap <C-o> w|onoremap <C-o> w|

" Ctrl + up/down = move to top/bottom of screen
nnoremap <C-e> L|xnoremap <C-e> L|onoremap <C-e> L|
nnoremap <C-i> H|xnoremap <C-i> H|onoremap <C-i> H|

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> z :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Abbreviate `:Make` to `:m`
cnoreabbrev m Make

" :W saves with sudo
command W w !sudo tee "%" > /dev/null

" Easy window switching TODO Make it work with Alt
nmap <silent> <leader><Up> :wincmd k<CR>
nmap <silent> <leader><Down> :wincmd j<CR>
nmap <silent> <leader><Left> :wincmd h<CR>
nmap <silent> <leader><Right> :wincmd l<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting by default
syntax enable 

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set 7 lines to the cursor - when moving vertically using j/k TODO rewrite description
set so=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Don't redraw while executing macros
set lazyredraw 

" Show matching brackets when text indicator is over them
set showmatch 

" Set line numbers
set number
set relativenumber

"...but not in text files
au bufreadpost,bufnewfile *.md,*.txt,*.tex set nonumber
au bufreadpost,bufnewfile *.md,*.txt,*.tex set norelativenumber

" Enable yanking between windows
set clipboard=unnamed
"
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Remembers last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Colorscheme
set background=dark
colorscheme torte

" Font for Windows
set gfn=IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11

" Turn on the Wild menu
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" Makes search act like search in modern browsers
set incsearch 

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

" Be smart when using tabs ;)
set smarttab

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent"
set si "Smart indent"
set wrap "Wrap lines"

set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_size = 1

let g:indent_guides_enable_on_vim_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ Win:%{WindowNumber()}\ \ \ Line:\ %l\ \ Column:\ %c

" What is this? TODO
let i = 1
while i <= 9
    execute 'nnoremap <leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile
"
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_cpp_clang_options = '-std=c++17 -Wall'
let g:ale_cpp_gcc_options = '-std=c++17 -Wall'

let g:clang_library_path='/usr/lib/llvm-9/lib/'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRL-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

" let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<cr>
map <C-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start Tagbar
cnoreabbrev TT TagbarToggle

" Allows switching windows without tagbar changing content
cnoreabbrev Z TagbarTogglePause

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hexadecimal mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " Saves to prevent no changes warning
    w
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
