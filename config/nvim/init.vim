" .vimrc / init.vim
" The following vim/neovim configuration works for both Vim and NeoVim

" ensure vim-plug is installed and then load it
call plug#begin('~/.config/nvim/plugged')


let mapleader = "\<Space>"

runtime options.vim
runtime plugins.vim
runtime mappings.vim
runtime nerdtree.vim
runtime lightline.vim
runtime startify.vim
runtime coc.vim

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

command! Rm call functions#Delete()
command! RM call functions#Delete() <Bar> q!

" LSP
Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
\ }

"    " signify {{{
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change = '!'
" }}}

" vim-fugitive {{{
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " hub extension for fugitive
Plug 'junegunn/gv.vim'
Plug 'sodapopcan/vim-twiggy'
Plug 'christoomey/vim-conflicted'
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>
" }}}

" ALE {{{
Plug 'w0rp/ale' " Asynchonous linting engine
let g:ale_set_highlights = 0
let g:ale_change_sign_column_color = 0
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = '✖'
let g:ale_echo_msg_warning_str = '⚠'
let g:ale_echo_msg_format = '%severity% %s% [%linter%% code%]'

let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'typescript': ['tsserver', 'tslint'],
\   'html': []
\}
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier', 'tslint']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 0
"
" Language-Specific Configuration {{{

    " JavaScript {{{
        Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
        "
    " TypeScript {{{
        Plug 'Shougo/vimproc.vim', { 'do': 'make' }

        Plug 'mhartington/nvim-typescript', { 'for': 'typescript', 'do': './install.sh' }
        let g:nvim_typescript#diagnosticsEnable = 0
        let g:nvim_typescript#max_completion_detail=100
    " }}}

    " markdown {{{
        Plug 'tpope/vim-markdown', { 'for': 'markdown' }

    " JSON {{{
        Plug 'elzr/vim-json', { 'for': 'json' }
        let g:vim_json_syntax_conceal = 0
    " }}}
    "
call plug#end()

syntax on
filetype plugin indent on

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermfg=19
highlight NonText ctermfg=19
highlight Normal ctermbg=none

" deal with colors
let base16colorspace=256
hi Normal ctermbg=NONE

colorscheme base16-gruvbox-dark-pale

