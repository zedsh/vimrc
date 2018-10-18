highlight Comment ctermfg=LightMagenta
syntax on

set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>

set wildmenu
set wcm=<Tab>
menu Actions.psr_dir :call PhpCsFixerFixDirectory()<CR>
menu Actions.tagbarShow :TagbarToggle<CR>
menu Actions.bind_ctags :UpdateTags -R<CR>
menu Actions.gdiff :Gdiff<CR>

set wildmenu
set wcm=<Tab>
menu Indent.autoindent :set autoindent<CR>i
menu Indent.no_autoinden :set noautoindent<CR>i



set backspace=2
set autoindent
set smarttab
set smartcase
set hlsearch
set incsearch
map <f1> :emenu Indent.<TAB>
imap <f1> <esc>:emenu Indent.<TAB>
imap <f2> <esc>:wa!<CR>li
nmap <f2> :wa!<CR>
nmap <f3> :NERDTreeFind<CR> 
imap <f3> <esc>:NERDTreeFind<CR> 
nmap <f4> vat
map <f5> <leader>s
nmap <f6> :Tlist<CR>
map <F8> :emenu Encoding.<TAB>
map <F9> :emenu Actions.<TAB>
map <F12> :call PhpCsFixerFixFile()<CR>


nmap <INSERT> i
nmap Q :wqa!<CR>
nmap q :q<CR>
map <BACKSPACE> i<BACKSPACE>
nmap <BACKSPACE> i<BACKSPACE>
map <S-TAB> :bn<CR>
set noswapfile
"nmap <CR> i<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"nnoremap <C-]> :tabnew %<CR>g<C-]>

set backup
function! BackupDir()
let l:backupdir=$HOME.'/.vim/backup/'.
\substitute(expand('%:p:h'), '^'.$HOME, '~', '')
if !isdirectory(l:backupdir)
call mkdir(l:backupdir, 'p', 0700)
endif
let &backupdir=l:backupdir
let &backupext=strftime('~%Y-%m-%d-%H-%M-%S~')
endfunction
autocmd! bufwritepre * call BackupDir()
         

set tabstop=4
set shiftwidth=4
set expandtab

let g:typescript_indent_disable = 1
let g:gruvbox_contrast_dark = 'hard'

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Bundle 'leafgarland/typescript-vim'
Bundle 'tmhedberg/matchit'
Plugin 'StanAngeloff/php.vim'
Plugin 'posva/vim-vue'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'morhetz/gruvbox'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/IndexedSearch'
"Bundle 'vim-scripts/taglist.vim'
Bundle 'stephpy/vim-php-cs-fixer'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'digitaltoad/vim-pug'

call vundle#end()

map <Leader> <Plug>(easymotion-prefix)
colorscheme gruvbox
set background=dark

filetype plugin indent on

autocmd FileType vue syntax sync fromstart


let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.jpeg
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp'
let g:ctrlp_max_files = 100000
let g:syntastic_enable_signs=1

let Tlist_Compact_Format=1
let Tlist_Exit_OnlyWindow=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Highlight_Tag_On_BufEnter=1
let Tlist_Use_Right_Window=1


let g:tagbar_phpctags_memory_limit = '512M'
let NERDTreeShowHidden=1

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:bookmark_highlight_lines = 1
let g:bookmark_disable_ctrlp = 1
let g:bookmark_location_list = 1
