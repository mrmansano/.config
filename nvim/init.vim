call plug#begin('~/.vim/plugged')
	" basic {{
		set number
		set cursorline
		set mouse=a
		set list
	" }}
	Plug 'junegunn/vim-easy-align'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	" {{
		" Default fzf layout
		" - down / up / left / right
		let g:fzf_layout = { 'down': '~40%' }

		" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
		let g:fzf_layout = { 'window': 'enew' }
		let g:fzf_layout = { 'window': '-tabnew' }
		let g:fzf_layout = { 'window': '10split enew' }

		" Customize fzf colors to match your color scheme
		let g:fzf_colors =
		\ { 'fg':      ['fg', 'Normal'],
		  \ 'bg':      ['bg', 'Normal'],
		  \ 'hl':      ['fg', 'Comment'],
		  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
		  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
		  \ 'hl+':     ['fg', 'Statement'],
		  \ 'info':    ['fg', 'PreProc'],
		  \ 'border':  ['fg', 'Ignore'],
		  \ 'prompt':  ['fg', 'Conditional'],
		  \ 'pointer': ['fg', 'Exception'],
		  \ 'marker':  ['fg', 'Keyword'],
		  \ 'spinner': ['fg', 'Label'],
		  \ 'header':  ['fg', 'Comment'] }

		" Enable per-command history.
		" CTRL-N and CTRL-P will be automatically bound to next-history and
		" previous-history instead of down and up. If you don't like the change,
		" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
		let g:fzf_history_dir = '~/.local/share/fzf-history'
		nnoremap <silent> <leader><space> :Files<CR>
		nnoremap <silent> <leader>a :Buffers<CR>
		nnoremap <silent> <leader>A :Windows<CR>
		nnoremap <silent> <leader>; :BLines<CR>
		nnoremap <silent> <leader>o :BTags<CR>
		nnoremap <silent> <leader>O :Tags<CR>
		nnoremap <silent> <leader>? :History<CR>
		nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
		nnoremap <silent> <leader>. :AgIn 
	" }}
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
	" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	" Plug 'vim-airline/vim-airline'
	" Plug 'vim-airline/vim-airline-themes'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'rakr/vim-one'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'ludovicchabant/vim-gutentags'
	" {{
		let g:gutentags_ctags_exclude = ['.build', 'compile_command.json', 'CMakeLists.txt', 'sftp-config.json', '.hsftp', '.clang*', '.git']
	" }}
	" Plug 'zchee/deoplete-clang'
	" Plug 'Shougo/neosnippet.vim'
	" Plug 'Shougo/neosnippet-snippets'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'tpope/vim-surround'
	Plug 'tomtom/tcomment_vim'
	Plug 'Raimondi/delimitMate'
	" {{
		let delimitMate_expand_cr = 2
		let delimitMate_expand_space = 1 " {|} => { | }
	" }}
	Plug 'tpope/vim-endwise'
	Plug 'Valloric/MatchTagAlways'
	Plug 'Shougo/junkfile.vim'
	Plug 'vim-scripts/a.vim'
	Plug 'hesselbom/vim-hsftp'
	" {{
		autocmd BufWritePost *.{cpp,h,x,prj} :Hupload
	" }}
	Plug 'eshion/vim-sync'
	" Plug 'vim-syntastic/syntastic'
	Plug 'itchyny/lightline.vim'
	" {{
		let g:lightline = {
			\ 'colorscheme': 'nord',
			\}
	" }}
	Plug 'skywind3000/asyncrun.vim'
	Plug 'rhysd/vim-clang-format'
	Plug 'Valloric/YouCompleteMe'
	" {{
		let g:ycm_server_python_interpreter = '/usr/bin/python'
		" make YCM compatible with UltiSnips (using supertab)
		let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
		let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
		let g:ycm_min_num_of_chars_for_completion = 3
		let g:ycm_autoclose_preview_window_after_completion = 1
		let g:ycm_autoclose_preview_window_after_insertion = 1
			" }}
	Plug 'tenfyzhong/CompleteParameter.vim'
	" {{
		inoremap <silent><expr> ( complete_parameter#pre_complete("()")
		smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
		imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
		smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
		imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
	" }}
	Plug 'SirVer/ultisnips'
	" {{
		" If you want :UltiSnipsEdit to split your window.
		let g:UltiSnipsEditSplit="vertical"
		" better key bindings for UltiSnipsExpandTrigger
		let g:UltiSnipsExpandTrigger = "<tab>"
		let g:UltiSnipsJumpForwardTrigger = "<tab>"
		let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
	" }}
	Plug 'honza/vim-snippets'
	Plug 'ervandew/supertab'
	" {{
		let g:SuperTabDefaultCompletionType = '<C-n>'
	" }}
	Plug 'gabrielelana/vim-markdown'
	Plug 'arcticicestudio/nord-vim'
	" {{
		let g:nord_italic_comments = 1
		let g:nord_comment_brightness = 12
	" }}
call plug#end()

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" set background=dark " for the dark version
" set background=light " for the light version
" colorscheme one
colorscheme nord

nnoremap <silent> <esc> :noh<return><esc>
vnoremap // y/<C-R>"<CR>

hi Normal guibg=NONE ctermbg=NONE
