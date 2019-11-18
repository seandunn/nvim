set nocompatible              " be iMproved, required
filetype off                  " required


" Switching to vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'dhruvasagar/vim-table-mode'

Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'kana/vim-textobj-user'
" Plug 'tommcdo/vim-exchange'
" Plug 'wesQ3/vim-windowswap'
Plug 'moll/vim-bbye'

Plug '/home/sean_dunn/.fzf'
Plug 'junegunn/fzf.vim'

Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'jgdavey/vim-blockle'
Plug 'tpope/vim-rails'
" Plug 'janko-m/vim-test'
Plug 'wincent/ferret'

Plug 'christoomey/vim-tmux-navigator'
Plug 'nelstrom/vim-visual-star-search'

Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Raimondi/delimitMate'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sjl/gundo.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tomtom/tlib_vim'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-endwise'

Plug 'rbong/vim-flog'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'zandrmartin/vim-distill'
Plug 'hkupty/timeshift.vim'

Plug 'airblade/vim-gitgutter'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'editorconfig/editorconfig-vim'

Plug 'majutsushi/tagbar'
Plug 'craigemery/vim-autotag'

Plug 'joshdick/onedark.vim'
Plug 'hartalex/onedark-ex.vim'
Plug 'doums/darcula'
Plug 'jacoborus/tender.vim'
Plug 'fxn/vim-monochrome'
Plug 'KeitaNakamura/neodark.vim'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vimwiki/vimwiki'

" Plug 'wannesm/wmgraphviz.vim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()


if has('nvim')
  set termguicolors
  set pumblend=20
  set winblend=15
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  tnoremap <Esc><Esc> <C-\><C-n>
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
  lua require 'colorizer'.setup()
else
  set t_Co=256
  if has("mouse_sgr")
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  end
endif

noremap j gj
noremap k gk
" map <C-e> :
" imap <C-e> <esc>:

set mouse=a
set selectmode=
set mousehide

" no beeping!
set vb t_vb=
set number
set ruler

syntax enable
set synmaxcol=200
set scrolloff=1
set lazyredraw

" Reload changing files
set autoread

" Whitespace stuff
set wrap
set tabstop=2
" set shiftwidth=2
set softtabstop=2
" set expandtab
set showbreak=↪
" set list listchars=tab:\ \ ,trail:·
set virtualedit=block
" set autoindent

" Editorconfig support
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Add symbols that count as part of Keywords...
" set iskeyword+=?,@
set iskeyword+=?,@,_,-

" Code folding
set nofoldenable
autocmd FileType javascript,typescript,css,scss,json setlocal foldmethod=marker
autocmd FileType javascript,typescript,css,scss,json setlocal foldmarker={,}

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc
set wildignore+=*/\.git/*,*/vendor/*,*/data/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.scssc

set wildchar=<Tab> wildmenu wildmode=full

" Status bar
set laststatus=2

" Windows and Splits

" Splits should be created in the same way as every other gui!
set enc=utf-8
" set fillchars=diff:⣿,vert:\│
" set fillchars=diff:⣿,vert:\│
set fillchars=vert:\│
set splitright
set splitbelow

" When switching to a buffer move the first open window with the buffer
" in...
set switchbuf=useopen

" " WindowSwap
" nnoremap <leader>we :call WindowSwap#EasyWindowSwap()<CR>
" let g:windowswap_map_keys=0



" Set leader to <space> as it's the only key you have two
" dedicated digits for!
let mapleader = " "

" NERDTree configuration
let NERDTreeStatusline=split(getcwd(), '/')[-1]
let NERDTreeIgnore=['\.rbc$', '\~$']
let NERDTreeMapOpenExpl="E"
map <Leader>n :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('scss', 'cyan', 'none', '#5486C0', 'none')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
call NERDTreeHighlightFile('exs', 'Red', 'none', '#ffa500', 'none')
call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')

" Netrw Config
let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_altv = 0
let g:netrw_list_hide = ".git,.sass-cache,.jpg,.png,.svg"
let g:netrw_banner=0

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

function! s:setupWrapping()
  set wm=2
  set textwidth=110
endfunction

" make and python use real tabs
au FileType make                                     set noexpandtab
au FileType python                                   set noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupWrapping()
au BufRead,BufNewFile *.{html} set ft=eruby

au BufRead,BufNewFile *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use modeline overrides
set modeline
set modelines=10

set termguicolors
set background=dark

let g:airline_powerline_fonts=1
let g:airline_detect_spell=0

let g:airline_section_y = ''
let g:airline_section_b = ''
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
let g:airline#extensions#hunks#enabled = 0
let g:onedark_terminal_italics = 1
colorscheme onedark

"  colorscheme darcula
" highlight Comment cterm=italic " Italic comments.
" highlight Comment gui=italic " Italic comments in gui.
" highlight Todo cterm=italic " Italic comments.
" highlight Todo gui=italic " Italic comments in gui.

" Copy to the system clipboard
map <leader>c "+y
" Paste...
" map <leader>v "+p

let g:vitality_always_assume_iterm=1

" set cursorline
" Move line highlighting with window focus
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

" Open .vimrc in a new tab
nmap <leader>,v :tabedit $MYVIMRC<CR>
nmap <leader>,g :tabedit $MYGVIMRC<CR>

"Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Alignment
map <Leader>l :Tabularize<space>

" Spelling stuff...
setlocal spell spelllang=en_gb
set spell

set thesaurus+=~/.vim/thesaurus/mthesaur.txt

" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=100 "maximum number of changes that can be undone
set undoreload=100 "maximum number lines to save for undo on a buffer reload

" Tagbar
nmap <F8> :TagbarToggle<CR>
set tags +=extjs-tags
noremap <C-w><C-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" let g:tagbar_type_markdown = {
"       \ 'ctagstype' : 'markdown',
"       \ 'kinds' : [
"       \ 'h:Heading_L1',
"       \ 'i:Heading_L2',
"       \ 'k:Heading_L3'
"       \ ]
"       \ }
" Blockle
let g:blockle_mapping = '<LocalLeader>b'

" Show (partial) command in the status line
set showcmd


" Gitgutter
" nmap [c <Plug>GitGutterPrevHunk
" nmap ]c <Plug>GitGutterNextHunk

" Pipes the output of Ex to a buffer in a new tab...
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  tabnew
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)


" Qargs populates the args list with the files in the quickfix list...
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

function! BufferDelete()
  if &modified
    echohl ErrorMsg
    echomsg "No write since last change. Not closing buffer."
    echohl NONE
  else
    let s:total_nr_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

    echohl ErrorMsg
    echomsg "No write since last change. Not closing buffer."
    echohl NONE
  else
    let s:total_nr_buffers = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))

    if s:total_nr_buffers == 1
      bdelete
      echo "Buffer deleted. Created new buffer."
    else
      bprevious
      bdelete #
      echo "Buffer deleted."
    endif
  endif
endfunction
command! -nargs=0 -complete=command BufCleaner call BufferDelete()
map <esc><BS> :silent BufCleaner<cr>

" Regexps...
" Change '<word>' to "<word>"
map <leader>' :%s/\v'([^ ]*)'/"\1"/gc<cr>

au BufNewFile,BufRead *.ldg,*.ledger setf ledger
au BufNewFile,BufRead *.ampl,*.mod,*.model,*.data set syntax=ampl

" Golang...
let g:go_version_warning = 0
au FileType go nmap <leader>d <Plug>(go-doc)
au FileType go nmap <leader>v <Plug>(go-vet)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
" au FileType go nmap <leader>ta :wa<CR> :GolangTestCurrentPackage<CR>
" au FileType go nmap <leader>tf :wa<CR> :GolangTestFocused<CR>

" format with goimports instead of gofmt
let g:go_fmt_options = '-w=false'
let g:go_fmt_command = "goimports"

au FileType go nmap <leader>I :GoImports<cr>
au FileType go nmap <leader>R :GoRename<cr>

" Java
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Graphviz
" let g:WMGraphviz_dot = '/usr/local/bin/dot'

" Vim-test
let test#strategy = "neoterm"
"
" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>

" vim-whichkey
let g:which_key_use_floating_win = 1
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Vim-Table-Mode
" make tables Markdown compatible
let g:table_mode_corner="|"

" project paths
set path+=**
set suffixesadd+=.js

" FZF
map <c-p> :GFiles --exclude-standard --others --cached<cr>
map <leader>p :FZF<cr>
map <leader>b :Buffers<cr>
map <leader>l :Lines<cr>

let $FZF_DEFAULT_OPTS='--layout=reverse'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let width = float2nr(&columns - (&columns * 2 / 7))
  " let width = float2nr(&columns - (&columns * 2 / 10))
  let height = &lines / 4
  let y = &lines - 3
  let x = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': y,
        \ 'col': x,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
