call plug#begin('~/.vim/plugged')
	" basic {{
		set number
		set cursorline
		set mouse=a
		set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
		set list
		set hidden
        if exists("g:gui_oni")
            set nocompatible
            filetype off
        endif
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
		" autocmd BufWritePost *.{cpp,h,x,prj} :Hupload
		command! W :w|Hupload
	" }}
	Plug 'eshion/vim-sync'
	" Plug 'w0rp/ale'
	"{{
		" let g:ale_sign_error = "❌"
		" let g:ale_sign_warning = "⚠️"
		" let g:ale_linters = { 'cpp': ['clangcheck'], 'python': ['flake8'] }
	"}}
	" Plug 'vim-syntastic/syntastic'
	"{{
		" let g:syntastic_always_populate_loc_list = 1
		" let g:syntastic_auto_loc_list = 0
		" let g:syntastic_check_on_open = 1
		" let g:syntastic_check_on_wq = 1
		" let g:syntastic_error_symbol = "❌"
		" let g:syntastic_warning_symbol = "⚠️"
		" highlight link SyntasticErrorSign SignColumn
		" highlight link SyntasticWarningSign SignColumn
		" highlight link SyntasticStyleErrorSign SignColumn
		" highlight link SyntasticStyleWarningSign SignColumn
	"}}
	Plug 'itchyny/lightline.vim'
	" {{
		let g:lightline = {
			\ 'colorscheme': 'nord',
			\ 'component_function': {
			\	'filetype': 'MyFiletype',
			\	'fileformat': 'MyFileformat',
			\	'readonly': 'LightlineReadonly'
			\ }
		\}
		function! MyFiletype()
			return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
		endfunction
		function! MyFileformat()
			return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
		endfunction
		function! LightlineReadonly()
			return &readonly ? '' : ''
		endfunction
	" }}
	Plug 'skywind3000/asyncrun.vim'
	Plug 'rhysd/vim-clang-format'
	"{{
		let g:clang_format#style_options = {
			\ "AlignAfterOpenBracket": "Align",
			\ "AlignEscapedNewlines": "true",
			\ "AlignOperands": "true",
			\ "AlignTrailingComments": "true",
			\ "BinPackArguments": "true",
			\ "BinPackParameters": "true",
			\ "BraceWrapping": {
			\ 	"AfterClass": "false",
			\ 	"AfterControlStatement": "true",
			\ 	"AfterEnum": "true",
			\ 	"AfterFunction": "true",
			\ 	"AfterNamespace": "true",
			\ 	"AfterStruct": "true",
			\ 	"AfterUnion": "true",
			\ 	"AfterExternBlock": "true",
			\ 	"BeforeCatch": "true",
			\ 	"BeforeElse": "true",
			\ 	"SplitEmptyFunction": "true",
			\ 	"SplitEmptyNamespace": "true"
			\ },
			\ "BreakBeforeBraces": "Custom",
			\ "Cpp11BracedListStyle": "true",
			\ "Standard": "C++11",
			\ "IncludeBlocks": "Regroup",
			\ "IndentWidth": 8,
			\ "NamespaceIndentation": "All",
			\ "PointerAlignment": "Left",
			\ "TabWidth": 8,
			\ "UseTab": "Always"
			\}
	"}}
	Plug 'Valloric/YouCompleteMe'
	" {{
		let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
		" make YCM compatible with UltiSnips (using supertab)
		let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
		let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
		let g:ycm_min_num_of_chars_for_completion = 3
		let g:ycm_autoclose_preview_window_after_insertion = 1
		"will put icons in Vim's gutter on lines that have a diagnostic set.
		"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
		"highlighting
		let g:ycm_enable_diagnostic_signs = 1
		let g:ycm_enable_diagnostic_highlighting = 1
		let g:ycm_always_populate_location_list = 1 "default 0
		let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

		" Python related variables
		let g:ycm_python_binary_path = 'python3'
	" }}
	" Plug 'tenfyzhong/CompleteParameter.vim'
	" " {{
	" 	inoremap <silent><expr> ( complete_parameter#pre_complete("()")
	" 	smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
	" 	imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
	" 	smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
	" 	imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
	" }}
	Plug 'SirVer/ultisnips'
	" {{
		" If you want :UltiSnipsEdit to split your window.
		let g:UltiSnipsEditSplit="vertical"
		" better key bindings for UltiSnipsExpandTrigger
		let g:UltiSnipsExpandTrigger = "<C-k>"
		let g:UltiSnipsJumpForwardTrigger = "<C-k>"
		let g:UltiSnipsJumpBackwardTrigger = "<C-l>"
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
	Plug 'xuqix/h2cppx'
	" {{
		command! F2cppx :call H2cppx(0)
		command! L2cppx :call H2cppxLine(0)
	" }}
	Plug 'tyru/open-browser.vim'
	Plug 'tell-k/vim-autopep8'
	" {{
		let g:autopep8_disable_show_diff=1
		let g:autopep8_on_save = 1
	" }}
	Plug 'Chiel92/vim-autoformat'
	" {{
		noremap <F3> :Autoformat<CR>
	"}}
	Plug 'scrooloose/vim-slumlord'
	Plug 'aklt/plantuml-syntax'
	Plug 'weirongxu/plantuml-previewer.vim'
	Plug 'wellle/targets.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'chrisbra/csv.vim'
	Plug 'vim-scripts/DoxygenToolkit.vim'
	" Plug 'tibabit/vim-templates'
	" " {{
	" 	let g:tmpl_search_paths = ['~/Commvault/Templates']
	" 	let g:tmpl_author_name = 'Marcelo Mansano (mmansano)'
	" 	let g:tmp_author_email = 'mmansano@commvault.com'
	" " }}
	Plug 'aperezdc/vim-template'
	" {{
		let g:username = 'Marcelo Mansano (mmansano)'
		let g:email = 'mmansano@commvault.com'
	" }}
	Plug 'majutsushi/tagbar'
	"{{
		nnoremap <silent> <leader>t :TagbarToggle<CR>
	"}}
	Plug 'dkprice/vim-easygrep'
	Plug 'heavenshell/vim-pydocstring'
	Plug 'Shougo/echodoc.vim'
	Plug 'lifepillar/vim-solarized8'
	Plug 'Shougo/denite.nvim'
	Plug 'tpope/vim-eunuch'
	Plug 'junegunn/vim-peekaboo'
	Plug 'mbbill/undotree'
	" {{{
		set undofile
		" Auto create undodir if not exists
		let undodir = expand($HOME . '/.nvim/cache/undodir')
		if !isdirectory(undodir)
		call mkdir(undodir, 'p')
		endif
		let &undodir = undodir

		nnoremap <leader>U :UndotreeToggle<CR>
	" }}}
	Plug 'kshenoy/vim-signature'
	" Keep me last!
	Plug 'ryanoasis/vim-devicons'
call plug#end()

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
"   if (has("nvim"))
"   "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
"   "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"   "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"   " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif

" set background=dark " for the dark version
" set background=light " for the light version
" colorscheme one
colorscheme nord

nnoremap <silent> <esc> :noh<return><esc>
vnoremap // y/<C-R>"<CR>

if has("gui_vimr")
	let has_vimr=1
else
	hi Normal guibg=NONE ctermbg=NONE
endif

set backupdir=~/.config/nvim/backup

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd BufRead,BufNewFile *.sp set syntax=sql
autocmd BufRead,BufNewFile *.tbl set syntax=sql
