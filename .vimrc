" ------------------------------------------------------------------------------
" Package Installations
" ------------------------------------------------------------------------------

  packadd minpac
  call minpac#init() " initialize package manager

  call minpac#add('k-takata/minpac', {'type': 'opt'}) " package manager
  call minpac#add('mileszs/ack.vim') " search for code expressions
  call minpac#add('vim-airline/vim-airline') " navigation bar at bottom
  call minpac#add('vim-airline/vim-airline-themes') " theme for nav bar
  call minpac#add('w0rp/ale') " linting tool with fixer
  call minpac#add('jiangmiao/auto-pairs') " created closing bracket
  call minpac#add('editorconfig/editorconfig-vim') " ide config file
  call minpac#add('mattn/emmet-vim') " fast html/css/js code generation
  call minpac#add('Yggdroot/indentLine') " display indent level
  call minpac#add('scrooloose/nerdtree') " filebrowser
  call minpac#add('ekalinin/Dockerfile.vim') " docker syntax file
  call minpac#add('shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'})
  call minpac#add('carlitux/deoplete-ternjs') " JS autocomplete

  "call minpac#update() " update packages
  "call minpac#clean() " delete old packages in directory

" ------------------------------------------------------------------------------
" Configurations
" ------------------------------------------------------------------------------

" Filetype
" ------------------------------------------------------------------------------
  augroup FiletypeGroup
    autocmd!
    " .ts is a Typescript file
    au BufNewFile,BufRead *.ts set filetype=typescript
  augroup END

" Vim
" ------------------------------------------------------------------------------
  " Leader Key = <space>
  let mapleader=" "

  set number
  imap jk <Esc>
  " Show double quotes in JSON files
  set conceallevel=0

  " Switch Panes with ctrl + [hjkl]
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  " Fuzzy finder
  nnoremap <Leader>f :<C-u>FZF<CR>

" NerdTree
" ------------------------------------------------------------------------------
  map <C-n> :NERDTreeToggle<CR>

  " Exits vim if nerdtree is the only pane open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
  \  && b:NERDTree.isTabTree()) | q | endif

  let NERDTreeShowHidden=1

" Ack
" ------------------------------------------------------------------------------
  nnoremap <Leader>a :Ack!<Space>

" ALE
" ------------------------------------------------------------------------------
  let b:ale_linters = {'javascript': ['eslint']}
  let b:ale_fixers = {'javascript': ['prettier']}
  let g:ale_fix_on_save = 1

" Airline
" ------------------------------------------------------------------------------
  let g:airline_theme='dracula'

" Emmet
" ------------------------------------------------------------------------------
  let g:user_emmet_leader_key=','

" Deoplete - autocomplete for neovim
" ------------------------------------------------------------------------------
  let g:deoplete#enable_at_startup = 1
  " deoplete tab-complete
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  " tern
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
