highlight Comment ctermfg=LightMagenta
syntax on
set backspace=2
set autoindent
set smartcase
imap <f1> <esc>:set autoindent<CR>i
imap <f3> <esc>:set noautoindent<CR>i
imap <f2> <esc>:w!<CR>li
nmap <f2> :w!<CR>
nmap <f10> :q<CR>
nmap <INSERT> i
nmap q :wq!<CR>
map <BACKSPACE> i<CR><BACKSPACE>
nmap <BACKSPACE> i<CR><BACKSPACE>
map <TAB> :tabnext<CR>
nmap <TAB> :tabnext<CR>
set noswapfile
nmap <C-t> :tabnew<CR>:e
imap <C-t> <Esc>:tabnew<CR>:e
nmap <CR> i<CR>
nmap <f4> vat
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
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>
set tabstop=2


let g:typescript_indent_disable = 1
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Bundle 'leafgarland/typescript-vim'
Bundle 'tmhedberg/matchit'
Plugin 'StanAngeloff/php.vim'
Plugin 'posva/vim-vue'




call vundle#end()

filetype plugin on

autocmd FileType vue syntax sync fromstart

