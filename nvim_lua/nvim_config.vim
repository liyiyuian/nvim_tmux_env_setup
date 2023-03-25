" TODO: see if I can still use grubbox???? if yes, what is this nice python
" syntax highliter???
"
" ####################### Copilot settting #####################################
" let g:copilot_filetypes = {
" 			\ '*': v:false,
" 			\ 'python': v:true,
" 			\}

imap <silent><script><expr> <space>j copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

"------------------------------------------------------------------------------
" slime configuration 
"------------------------------------------------------------------------------
" always use tmux
" let g:slime_target = 'tmux'
let g:slime_target = "neovim"

" fix paste issues in ipython
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
" let g:slime_default_config = {
"             \ 'socket_name': get(split($TMUX, ','), 0),
"             \ 'target_pane': '{top-left}' }
"
" let g:slime_dont_ask_default = 1

"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
" Keyboard mappings. <Leader> is \ (backslash) by default

" map <Leader>s to start IPython
nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>

" map <Leader>r to run script
nnoremap <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
nnoremap <Leader>R :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>: :IPythonCellExecuteCellVerbose<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>c :IPythonCellExecuteCellVerboseJump<CR>

" map <Leader>l to clear IPython screen
nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>

" map <F9> and <F10> to insert a cell header tag above/below and enter insert mode
"nmap <F9> :IPythonCellInsertAbove<CR>a
"nmap <F10> :IPythonCellInsertBelow<CR>a
nmap <Leader>a :IPythonCellInsertAbove<CR>a
nmap <Leader>b :IPythonCellInsertBelow<CR>a

" also make <F9> and <F10> work in insert mode
imap <F9> <C-o>:IPythonCellInsertAbove<CR>
imap <F10> <C-o>:IPythonCellInsertBelow<CR>

nmap <Leader>m :IPythonCellToMarkdown<CR>

augroup ipython_cell_highlight
    autocmd!
    autocmd ColorScheme * highlight IPythonCell ctermbg=238 guifg=darkgrey guibg=#444d56
augroup END
let g:ipython_cell_highlight_cells = 1
"highlight default link IPythonCell Folded
"augroup highlight_python_cells
    "autocmd!
    "autocmd VimEnter,WinEnter * match IPythonCell /\s*# %%.*\|\s*#%%.*\|\s*# <codecell>.*\|\s*##.*/
"augroup END

" send header first
let g:ipython_cell_send_cell_headers = 1

" ####################### Jupytext Configuration ###############################
" let g:jupytext_fmt = 'py'
" let g:jupytext_style = 'percent'

" ####################### Iron Configuration ###################################
" Send cell to IronRepl and move to next cell.
" Depends on the text object defined in vim-textobj-hydrogen
" You first need to be connected to IronRepl
" nmap ]x ctrih/^# %%<CR><CR>

" luafile $HOME/.config/nvim/plugins.lua
" luafile $HOME/.config/nvim/iron_split.lua
"
" space + rs -> IronRepl
" space + rr -> IronRestart

" ####################### Keybindings ##########################################
" toggle NERDTree
" nmap <leader>t :NERDTreeToggle<CR>

" resize the current window
" nmap <leader>, <C-W><
" nmap <leader>. <C-W>>

" this one probably has been implemented already
" imap jk <ESC>
" imap kj <ESC>
"
" ####################### Folding for IPython cells ############################
" This is only use for folding ipython cells
function! FoldAnalysis( line )
	if a:line =~ '# %%*'
        " A level 1 fold starts here; cp :help fold-expr
        return '>1'
	elseif a:line =~ '# %%*'
        " A level 1 fold ends here
        return '<1'
    else
        " Use fold level from previous line
        return '='
    endif
endfunction
autocmd FileType python set foldmethod=expr foldexpr=FoldAnalysis(getline(v:lnum))

function MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '^# %% \|^# %%', '', 'g')
  let sub = '[ '.sub.' ('
  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
  let prefix = sub."Lines: ".foldlinecount.") ] "
  return v:folddashes .. prefix
endfunction

autocmd FileType python set foldtext=MyFoldText()
nmap <leader><space> za

" ####################### vim-multiple-cursors #################################
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" usage of tpope/vim-surround
" change surround: cs + "original symbol" + "new symbol"
" add surround: ysiw + "symbol"
" add {} and () and [] without space, use the back one ']'; with space, use '[' 
nmap <leader>" ysiw"
nmap <leader>' ysiw'
nmap <leader>9 ysiw)
" remove surround: ds + "symbol"
nmap <leader>"" ds"
nmap <leader>'' ds'
nmap <leader>99 ds(

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ####################### NERDTREE #############################################
"autocmd vimenter * NERDTree " automatically open NERDTREE while opening neovim
"close the window when the left is NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let g:NERDTreeWinSize=25

" NERDTress File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg)
"  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:bg .' guifg='. a:fg
" endfunction
"
" ####################### Telescope Configuration ##############################
" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
