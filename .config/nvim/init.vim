call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'dracula/vim'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'numToStr/Comment.nvim'
  Plug 'ziglang/zig.vim'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Plug 'junegunn/fzf.vim'
  Plug 'JuliaEditorSupport/julia-vim'
  Plug 'kdheepak/JuliaFormatter.vim'
  Plug 'jpalardy/vim-slime'
  Plug 'neovim/nvim-lspconfig'
  Plug 'neovim/nvim-lsp'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-sensible'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
call plug#end()

"Config Section
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme github_dark
set number

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" nnoremap <C-p> :FZF<CR>
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-s': 'split',
"   \ 'ctrl-v': 'vsplit'
"   \}

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

runtime macros/matchit.vim
set mouse=a
set sw=4 ts=4

"inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"


lua << EOF
	require('Comment').setup()
	require'lspconfig'.julials.setup{}
	vim.lsp.set_log_level("debug")
EOF

