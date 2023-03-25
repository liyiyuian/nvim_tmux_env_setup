vim.g.copilot_filetypes = { ["*"]  = true}
vim.cmd[[imap <silent><script><expr> <Space>j copilot#Accept("\<CR>")]]
vim.g.copilot_no_tab_map = true
vim.cmd[[imap <silent><script><expr> <Space>k copilot-dismiss("\<CR>")]]
vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]

