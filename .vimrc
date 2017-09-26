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
menu Actions.bind_ctags :UpdateTags -R<CR>
menu Actions.generate_ctags :!ctags -R <CR>
menu Actions.show_tagbar :TagbarToggle<CR>
menu Actions.show_nerd_tree :NERDTree<CR>

set wildmenu
set wcm=<Tab>
menu Indent.autoindent :set autoindent<CR>
menu Indent.no_autoinden :set noautoindent<CR>



set backspace=2
set autoindent
set smarttab
set smartcase
set hlsearch
set incsearch
map <f1> :emenu Indent.<TAB>
imap <f2> <esc>:w!<CR>li
nmap <f2> :w!<CR>
nmap <f4> vat
map <f5> <leader>s
nmap <f6> :Tlist<CR>
map <F8> :emenu Encoding.<TAB>
map <F9> :emenu Actions.<TAB>


nmap <INSERT> i
nmap Q :wqa!<CR>
nmap q :q<CR>
map <BACKSPACE> i<BACKSPACE>
nmap <BACKSPACE> i<BACKSPACE>
map <TAB> :tabnext<CR>
nmap <TAB> :tabnext<CR>
map <S-TAB> :bn<CR>
set noswapfile
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
nmap <CR> i<CR>
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
Plugin 'mileszs/ack.vim'
Plugin 'xolox/vim-easytags'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/taglist.vim'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'vim-php/tagbar-phpctags.vim'
Plugin 'scrooloose/nerdtree'


call vundle#end()

map <Leader> <Plug>(easymotion-prefix)
colorscheme gruvbox
set background=dark

filetype plugin on

autocmd FileType vue syntax sync fromstart

let g:ctrlp_show_hidden = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.jpeg
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp'
let g:ctrlp_max_files = 100000
let g:syntastic_enable_signs=1

let g:easytags_file = './tags'
let g:easytags_auto_highlight = 0
let g:easytags_events = ['BufWritePost']
let g:easytags_async = 1

