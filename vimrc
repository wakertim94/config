vim9script
syntax on
filetype plugin on
set nocompatible
set termguicolors
set background=dark
set clipboard=unnamedplus
colorscheme habamax

g:mapleader = ' '
def g:Main()
	var l = ['Item 1', 'Item 2']
	var winID = popup_create(l, {filter: 'MenuFilter', cursorline: 1, padding: [0, 4, 4, 0]})
	popup_setoptions(winID, {	
							\ title: 'Menu', 
							\ pos: 'center', border: [1, 1, 1, 1], 
							\ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'], 
							\ zindex: 100})	

enddef
# --------------------------------------------------------------------------------------------
def OnEnter(lines: list<string>)
	execute 'edit' fnameescape(lines[0])
enddef
def OnAnother(lines: list<string>)
enddef
def g:TwFiles(option: number)
	g:fzf_layout = {'down': '10%', 'window': {'width': 0.4, 'height': 0.4}}
	if option == 1 
		OpenConfigFiles()
	endif
	if option == 2
		OpenHomeFiles()
	endif
	if option == 3
		OpenHomeCurrentDirFiles()
	endif
enddef
def OpenConfigFiles()
	g:fzf_action = {'ctrl-i': funcref(OnAnother), 'enter': funcref(OnEnter)}
	vim9cmd call fzf#run(fzf#wrap({'source': 'find $CONFIG -type f -name "*"', 'options': '--reverse'}))
enddef
def OpenHomeFiles()
	g:fzf_action = {'ctrl-i': funcref(OnAnother), 'enter': funcref(OnEnter)}
	vim9cmd call fzf#run(fzf#wrap({'source': 'find /home/waker -type f -name "*"', 'options': '--reverse'}))
enddef
def OpenHomeCurrentDirFiles()
	g:fzf_action = {'ctrl-i': funcref(OnAnother), 'enter': funcref(OnEnter)}
	vim9cmd call fzf#run(fzf#wrap({'source': 'find -type f -name "*"', 'options': '--reverse'}))
enddef
# --------------------------------------------------------------------------------------------

def g:SendToTerm()
	var nr = bufnr("TBuffer")
	if nr >= 0
		execute 'buffer ' .. nr
	else
		var job = term_start(&shell, {term_name: "TBuffer", hidden: 1, term_finish: "close"})
		echo job
	endif
enddef

inoremap <silent>kj <ESC>

nnoremap <silent><leader>fc :call TwFiles(1)<CR>
nnoremap <silent><leader>fh :call TwFiles(2)<CR>
nnoremap <silent><leader>fd :call TwFiles(3)<CR>
nnoremap <silent><leader>ev :w!<CR>:source<space>$MYVIMRC<CR>?def<CR>3wyiw:call<space><C-r>0()<CR>
nnoremap <silent><leader>xxda :%! xxd<CR>
nnoremap <silent><leader>xxdr :%! xxd -r<CR>

set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set incsearch
set nocursorline
set nohlsearch
set hidden
# Wildmenu in the comman mode and use C-n as tab
set wildmenu
set wildmode=longest:full,full
set wildoptions+=pum
set wildcharm=<TAB>
set wildchar=<TAB>
set pumheight=10
set pumwidth=30
set nonumber
set noswapfile
set nocompatible
set showcmd
set noruler
set wrap
set laststatus=0
set scrolloff=0
set tags+=~/config/tags
set path+=**,/usr/include

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap <leader>f :Files<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>d :NnnPicker<CR>
nnoremap <silent><C-c> :copen<CR>
nnoremap <silent><C-n> :cnext<CR>
nnoremap <silent><C-p> :cprev<CR>

nnoremap <silent><C-b> :tab terminal<CR>make g<CR>
nnoremap <silent><C-h> :tabprev<CR>
nnoremap <silent><C-l> :tabnext<CR>
tnoremap <silent><C-h> <C-\><C-N><C-w>h
tnoremap <silent><C-l> <C-\><C-N><C-w>l

# open Config file
#nnoremap <leader>cvvg :source ~/.vimrc<CR>
nnoremap <leader>cvg :e ~/.gdbinit<CR>
nnoremap <leader>cvvo :source ~/.vimrc<CR>
nnoremap <leader>cvo :e ~/config/vimrc<CR>
nnoremap <leader>cva :e ~/.config/alacritty/alacritty.toml<CR>
nnoremap <leader>cvvp :source ~/.vim/plugin/waker.vim<CR>
nnoremap <leader>cvp o:e ~/config/waker.vim<CR>
nnoremap <leader>cvvt :call system('tmux source-file ~/.tmux.conf')<CR>
nnoremap <leader>cvt :e ~/config/tmuxrc<CR>
nnoremap <leader>cvb :e ~/config/bashrc<CR>
nnoremap <leader>cvvb :!source ~/.bashrc<CR>
 
# somthing else
nnoremap <leader>gc yiw:vimgrep /<c-r>0/gjf **/*.c<CR>
nnoremap <leader>gh yiw:vimgrep /<c-r>0/gjf **/*.h<CR>


