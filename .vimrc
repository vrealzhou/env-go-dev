set nu
set tabstop=4
set shiftwidth=4
set expandtab
set t_Co=265

imap <C-I><C-I> <Esc>
map <C-P><C-T> :set paste<CR>
map <C-N><C-P> :set nopaste<CR>
nnoremap tn :tabnew<CR>
nnoremap tt :NERDTreeToggle<CR>
map <C-P> :FZF<CR>

execute pathogen#infect()
syntax on
filetype plugin indent on

" Enabling GoMetaLinter on save
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" Tagbar
nnoremap tb :TagbarToggle<CR>

" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" go_snippet
let g:go_snippet_engine = "neosnippet"
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'

  " Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" nerdcommenter
filetype plugin on

execute pathogen#infect()
syntax on
filetype plugin indent on

" rust
command CargoBuild execute "!cargo build"
command CargoRun execute "!cargo run"
command RustFmt execute "silent !fustfmt %" | execute 'redraw!'

" Replace
command -nargs=+ Replace :call MyReplace(<f-args>)

function MyReplace(before, after)
		:execute ",$s/".a:before."/".a:after."/gc|1,''-&&"
endfunction

call plug#begin('~/.vim/plugged')
"fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()


