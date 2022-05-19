require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
--require "user.lsp"
require "user.fuzzyfinder"
require "user.vimwiki"
require "user.vimtest"
require "user.debugger"
--require "user.treesitter"
require "user.slime"
require "user.copilot"


vim.cmd([[
let g:airline#extensions#tabline#enabled = 1

function! ParsePytestCommandToDjango(txt)
    let split_text = split(a:txt, ' ')
    let n = len(split_text) - 1
    let line = split_text[n]
    let line = substitute(line, ".py", "", "g")
    let line = substitute(line, "::", ".", "g")
    let testName = substitute(line, "/", ".", "g")
    return testName
endfunction

function! ParsePytestCommand(txt)
    let split_text = split(a:txt, ' ')
    let n = len(split_text) - 1
    let testName = split_text[n]
    return testName
endfunction

function! PHPUnitStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')
  call vimspector#LaunchWithSettings( #{ configuration: 'phpunit', TestName: testName } )
endfunction

function! PytestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')
    echo testName
  call vimspector#LaunchWithSettings( #{ configuration: 'pytest', TestName: testName } )
endfunction

function! PytestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')
    let testName = ParsePytestCommand(a:cmd)
    "echo testName
    call vimspector#LaunchWithSettings( #{ configuration: 'pytest-nearest', TestName: testName } )
endfunction

function! DjangoStrategy(cmd)
    let testName = ParsePytestCommandToDjango(a:cmd)
    call vimspector#LaunchWithSettings( #{ configuration: 'django-test-nearest', TestName: testName } )
endfunction

let g:test#custom_strategies = {'phpunit': function('PHPUnitStrategy')}
let g:test#custom_strategies = {'django_test': function('DjangoStrategy')}
let g:test#custom_strategies = {'pytest': function('PytestStrategy')}


" set termguicolors
hi Twilight ctermfg=8
" Use ESC to exit insert mode in :term
tnoremap <Esc> <C-\><C-n><CR>


]])

-- Julia Formatter
--[[
require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"julia"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            julia = {require("juliaformatter").efmConfig}
        }
    }
}
]]--

vim.cmd([[
autocmd BufWritePre *.jl lua vim.lsp.buf.formatting_sync()
]])


-- C Programming
vim.cmd([[
set softtabstop=4
nnoremap <leader>cc :set colorcolumn=80<cr>
nnoremap <leader>ncc :set colorcolumn-=80<cr>
set autoindent
set smartindent
]])

vim.cmd([[
set colorcolumn=80
]])
