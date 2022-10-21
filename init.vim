syntax on

call plug#begin('~/.config/nvim/pack')
Plug 'GCBallesteros/jupytext.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'tpope/vim-surround'
"Plug 'lervag/vimtex'
"Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
Plug 'jiangmiao/auto-pairs' 
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'gosukiwi/vim-atom-dark'
Plug 'sonph/onehalf'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'nvim-lualine/lualine.nvim'
Plug 'dkarter/bullets.vim'
"Plug 'wellle/context.vim' "this one looks fun maybe try later!!
Plug 'heavenshell/vim-pydocstring' "vim-pydocstring is a generator for Python docstrings and is capable of automatically
Plug 'hkupty/iron.nvim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'GCBallesteros/vim-textobj-hydrogen'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "currently having issue with new goup name requirements. Add back later after it's updated
"Plug 'nvim-tree/nvim-web-devicons' "this might be a better option than vim-devicons, since it comes with color by default
call plug#end()

set relativenumber
set laststatus=2
set noshowmode
set mouse=a
set cursorline
set colorcolumn=80
set autoindent
set encoding=UTF-8
set ts=4 sw=4 sts=4
set noexpandtab 
set hlsearch
set cmdheight=1
set showmatch
set clipboard=unnamedplus " using system clipboard
set ttyfast
set list lcs=tab:\|\ 
"
" Make view and load view automatically
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"NerdTree
autocmd vimenter * NERDTree
"close the window when the left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinSize=30

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg)
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:bg .' guifg='. a:fg
endfunction

" Coc Config from Github
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
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

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

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
			\'coc-sh',
			\'coc-texlab']

" mapping command for telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark
let g:gruvbox_bold='1'
let g:gruvbox_hls_cursor='aqua'
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
let g:indent_guides_enable_on_vim_startup=0
"let g:lightline = {'colorscheme': 'jellybeans',}

luafile /Users/liyiyuian/.config/nvim/lualine.lua
"" ###########################  vim-markdown-preview ############################
"let vim_markdown_preview_github=1


"set guifont=NerdFonts/DroidSansMono\ Nerd\ Font\ 11

"" ##########################  cpp enhanced highlight  ##########################
""C++ syntax highlighting options
""Highlighting of class scope is disabled by default. To enable set

"let g:cpp_class_scope_highlight = 1
""Highlighting of member variables is disabled by default. To enable set

"let g:cpp_member_variable_highlight = 1
""Highlighting of class names in declarations is disabled by default. To enable set

"let g:cpp_class_decl_highlight = 1
""Highlighting of POSIX functions is disabled by default. To enable set

"let g:cpp_posix_standard = 1
""There are two ways to highlight template functions. Either

""let g:cpp_experimental_simple_template_highlight = 1
""which works in most cases, but can be a little slow on large files. Alternatively set

""let g:cpp_experimental_template_highlight = 1
""which is a faster implementation but has some corner cases where it doesn't work.

""Note: C++ template syntax is notoriously difficult to parse, so don't expect this feature to be perfect.

""Highlighting of library concepts is enabled by

"let g:cpp_concepts_highlight = 1
""This will highlight the keywords concept and requires as well as all named requirements (like DefaultConstructible) in the standard library.

""Highlighting of user defined functions can be disabled by

""let g:cpp_no_function_highlight = 1


"" split windows below and right
"set splitbelow
"set splitright

"" show tabs
"set list
"set listchars=tab:\¦-

"" set highlight color 
"" ref color: https://jonasjacek.github.io/colors/
"hi Search ctermbg=0
"hi Search ctermfg=15 

"" highlight background past 80 chars
"" autocmd FileType python let &colorcolumn=join(range(81,999),",")

"imap jk <Esc>
"imap kj <Esc>
"" :cd %:p:h can set the directory to the current working directory
"" % gives the name of the current file, $:p gives its full path, and
"" %:p:h gives its directory (the "head" fo the full path)

"" this command changes the window-local current directory to the same as the
"" directory of the current file.
"autocmd BufEnter * silent! lcd %:p:h

"set pumheight=20 " makes popup menu smaller

"" better tabbing
"vnoremap < <gv
"vnoremap > >gv

"" auto source when writing to init.vim TODO: Does this really work????
""au! BufWritePost $MYVIMRC source %

"" resize windows
""nnoremap <M-j> :resize -2<CR>
""nnoremap <M-k> :resize +2<CR>
""nnoremap <M-h> :vertical resize -2<CR>
""nnoremap <M-l> :vertical resize +2<CR>

"" ############################  Notes for packages  ############################
"" Press ctrl-p to get the markdown preview
"" Valloric/YouCompleteMe is an autocomplete program, but requires new ver vim
"" The multiple cursors uses ctrl+n to find next
"" c for ?, s for ?, I for insert in the begining, A for insert after
"" ctrl-o: jump back to previous location
"" ctrl-i: jump forward to the newer location
"" ctrl-\ + ctrl-n: espace from the terminal
"" CocCommand: shows commands that can be used
"" CocList service: shows the current running languages server
"" For most coc-x, do CocInstall coc-x to install, and add to the global
"" extensions. CocList extensions: shows the installed extensions
"" " and then add 1-0 and y can copy things to register. Rg can show those
"" texts, and " + {} + p will paste that text
"" "+y will copy to system clipboard
"" use ctr+w + w to switch to pop-up window, and use ctrl+w + q to exit the
"" popup

"" For a split window: You can use Ctrl-w + and Ctrl-w - to resize the height of the current window by a single row. For a vsplit window: You can use Ctrl-w > and Ctrl-w < to resize the width of the current window by a single column. Additionally, these key combinations accept a count prefix so that you can change the window size in larger steps. [e.g. Ctrl-w 10 + increases the window size by 10 lines]
"" To resize all windows to equal dimensions based on their splits, you can use Ctrl-w =.
"" To increase a window to its maximum height, use Ctrl-w _.
"" To increase a window to its maximum width, use Ctrl-w |.
""
"""Swap top/bottom or left/right split
"" Ctrl+W R

""Break out current window into a new tabview
"" Ctrl+W T

""Close every window in the current tabview but the current one
"" Ctrl+W o



"to far left :wincmd H; right :wincmd L
"first to last :wincmd R, (r) reverse

"NerdCommenter \+cs, \+cu
"NERDTREE
	""change tab is gt or gT
	""open file in the tab: t and T
	""open file in split: i(horizontal), s(vertical)

" To check the full definition, get into the normal mode, press K and use 
" ctl-W + w to jump into the floating window

" Jupytext
let g:jupytext_fmt = 'py'
let g:jupytext_style = 'hydrogen'

" Send cell to IronRepl and move to next cell.
" Depends on the text object defined in vim-textobj-hydrogen
" You first need to be connected to IronRepl
nmap ]x ctrih/^# %%<CR><CR>

luafile $HOME/.config/nvim/plugins.lua
luafile $HOME/.config/nvim/iron_split.lua
