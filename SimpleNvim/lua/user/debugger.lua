vim.cmd([[
nnoremap <leader>m :MaximizerToggle!<CR>

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GoToWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GoToWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GoToWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GoToWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GoToWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GoToWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl :call vimspector#StepInto()<CR>
nmap <leader>dj :call vimspector#StepOver()<CR>
nmap <leader>dk :call vimspector#StepOut()<CR>
nmap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc :call vimspector#RunToCursor()<CR>
nmap <leader>dbp :call vimspector#ToggleBreakpoint()<CR>
nmap <leader>dcbp :call vimspector#ToggleConditionalBreakpoint()<CR>
]])

