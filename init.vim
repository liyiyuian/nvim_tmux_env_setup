" TODO:
" 1. make LaTeX works
" 2. python package import is showing problem

syntax on

call plug#begin('~/.vim/plugged')
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'tpope/vim-surround'
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
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'lambdalisue/gina.vim'
call plug#end()

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
"let g:lightline = {'colorscheme': 'jellybeans',}
set laststatus=2
set noshowmode
set mouse=a
set cursorline
set colorcolumn=80
"set expandtab Expand tabs to spaces
"set tabstop=4 Vim will interpret tabl to having a width of 4
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


" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" coc_config
let g:coc_global_extensions = [
			\'coc-pyright',
			\'coc-pairs',
			\'coc-json',
			\'coc-rust-analyzer',
			\'coc-snippets',
			\'coc-vimlsp',
			\'coc-tsserver',
			\'coc-clangd',
			\'coc-texlab']

" ctrl-space autocompletion, gd gotodefinition


set ts=4 sw=4 sts=4
set noexpandtab 
set hlsearch
set cmdheight=1
set rnu
" ###########################  vim-markdown-preview ############################
let vim_markdown_preview_github=1


set guifont=NerdFonts/DroidSansMono\ Nerd\ Font\ 11

" ##########################  cpp enhanced highlight  ##########################
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



" TODO: move this to autoload for diff languages
"autocmd FileType javascript setlocal ts=2 sw=2
"autocmd FileType typescript setlocal ts=2 sw=2
"autocmd BufNewFile,BufRead Jenkinsfile setf groovy
"autocmd BufNewFile,BufRead Dockerfile* setf Dockerfile
"autocmd Filetype tex set spell
"autocmd Filetype markdown set spell
"let g:python_highlight_all = 1
"

" split windows below and right
set splitbelow
set splitright


" show tabs
set list
set listchars=tab:>-

" highlight background past 80 chars
" autocmd FileType python let &colorcolumn=join(range(81,999),",")

imap fj <Esc>
" :cd %:p:h can set the directory to the current working directory
" % gives the name of the current file, $:p gives its full path, and
" %:p:h gives its directory (the "head" fo the full path)

" this command changes the window-local current directory to the same as the
" directory of the current file.
autocmd BufEnter * silent! lcd %:p:h


" ############################  Notes for packages  ############################
" Press ctrl-p to get the markdown preview
" Valloric/YouCompleteMe is an autocomplete program, but requires new ver vim
" The multiple cursors uses ctrl+n to find next
" c for ?, s for ?, I for insert in the begining, A for insert after
" ctrl-o: jump back to previous location
" ctrl-i: jump forward to the newer location
" ctrl-\ + ctrl-n: espace from the terminal
" CocCommand: shows commands that can be used
" CocList service: shows the current running languages server
" For most coc-x, do CocInstall coc-x to install, and add to the global
" extensions. CocList extensions: shows the installed extensions
" " and then add 1-0 and y can copy things to register. Rg can show those
" texts, and " + {} + p will paste that text
" "+y will copy to system clipboard
