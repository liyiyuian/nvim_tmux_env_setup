syntax on

call plug#begin('~/.vim/plugged')
Plug 'JamshedVesuna/vim-markdown-preview'
"Plug 'lervag/vimtex'
"Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs' 
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
"Plug 'vim-syntastic/syntastic'
Plug 'gosukiwi/vim-atom-dark'
Plug 'sonph/onehalf'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

" Valloric/YouCompleteMe is an autocomplete program, but requires new ver vim
" The multiple cursors uses ctrl+n to find next
" c for ?, s for ?, I for insert in the begining, A for insert after

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark
let g:gruvbox_bold='1'
set number
let g:gruvbox_hls_cursor='orange'
let g:gruvbox_number_column='bg1'
let g:gruvbox_sign_column='bg1'
let g:gruvbox_color_column='bg1'
let g:gruvbox_vert_split='bg1'
let g:gruvbox_italicize_comments='1'
let g:gruvbox_italicize_strings='0'
let g:gruvbox_invert_selection='1'
let g:gruvbox_invert_signs='0'
let g:gruvbox_invert_indent_guides='1'
let g:gruvbox_invert_tabline='1'
let g:python_highlight_all = 1"
let g:indent_guides_enable_on_vim_startup=0
let g:lightline = {'colorscheme': 'jellybeans',}
set laststatus=2
set noshowmode
set mouse=a
set cursorline
set colorcolumn=80
"set expandtab Expand tabs to spaces
"set tabstop=4 Vim will interpret tabl to having a width of 4
set list lcs=tab:\¦\ "set the | for code indented with tab
set autoindent
"set tw=80
"setlocal foldmethod=marker
set encoding=UTF-8
"augroup vimrc"{{{
	"au BufReadPre * setlocal foldmethod=indent
	"au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END"}}}
"

" Make view and load view automatically
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"to far left :wincmd H; right :wincmd L
"first to last :wincmd R, (r) reverse

"NerdCommenter \+cs, \+cu

"NerdTree
autocmd vimenter * NERDTree
	"change tab is gt or gT
	"open file in the tab: t and T
	"open file in split: i(horizontal), s(vertical)
"close the window when the left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
":NERDTreeToggle to open the tree, q to quit the tree
"let g:NERDTreeDirArrowExpandable = '>'
"let g:NERDTreeDirArrowCollapsible = 'v'
let g:NERDTreeWinSize=30

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg)
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:bg .' guifg='. a:fg
endfunction

call NERDTreeHighlightFile('jade', 'green', 'black')
call NERDTreeHighlightFile('html', 'green', 'black')
call NERDTreeHighlightFile('styl', 'green', 'black')
call NERDTreeHighlightFile('css', 'green', 'black')
call NERDTreeHighlightFile('coffee', 'cyan', 'black')



let s:blue = "689FB6"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['.mol'] = s:blue  "sets the color of css files to blue


"'ctrl+f: next page, +b previous page
"L:last line on the screen, H:first, M: middle

"imap `` <esc>



" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" coc_config
let g:coc_global_extensions = [
			\'coc-python',
			\'coc-pairs',
			\'coc-json',]
" ctrl-space autocompletion, gd gotodefinition


set ts=4 sw=4 sts=4
set noexpandtab 
set hlsearch
set cmdheight=1
set rnu
let vim_markdown_preview_github=1


set guifont=NerdFonts/DroidSansMono\ Nerd\ Font\ 11

"C++ syntax highlighting options
"Highlighting of class scope is disabled by default. To enable set

let g:cpp_class_scope_highlight = 1
"Highlighting of member variables is disabled by default. To enable set

let g:cpp_member_variable_highlight = 1
"Highlighting of class names in declarations is disabled by default. To enable set

let g:cpp_class_decl_highlight = 1
"Highlighting of POSIX functions is disabled by default. To enable set

let g:cpp_posix_standard = 1
"There are two ways to highlight template functions. Either

"let g:cpp_experimental_simple_template_highlight = 1
"which works in most cases, but can be a little slow on large files. Alternatively set

"let g:cpp_experimental_template_highlight = 1
"which is a faster implementation but has some corner cases where it doesn't work.

"Note: C++ template syntax is notoriously difficult to parse, so don't expect this feature to be perfect.

"Highlighting of library concepts is enabled by

let g:cpp_concepts_highlight = 1
"This will highlight the keywords concept and requires as well as all named requirements (like DefaultConstructible) in the standard library.

"Highlighting of user defined functions can be disabled by

"let g:cpp_no_function_highlight = 1
