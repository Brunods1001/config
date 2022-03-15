require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.fuzzyfinder"
require "user.vimwiki"
require "user.vimtest"
require "user.debugger"

vim.cmd([[
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:airline#extensions#tabline#enabled = 1

function! PHPUnitStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')
  call vimspector#LaunchWithSettings( #{ configuration: 'phpunit', TestName: testName } )
endfunction

function! PytestStrategy(cmd)
  let testName = matchlist(a:cmd, '\v -t ''(.*)''')
  call vimspector#LaunchWithSettings( #{ configuration: 'pytest', TestName: testName } )
endfunction

let g:test#custom_strategies = {'phpunit': function('PHPUnitStrategy'), 'pytest': function('PytestStrategy')}
]])

--'pytest': function('PytestStrategy')
