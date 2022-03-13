vim.cmd([[
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>L :TestLast<CR>
let test#python#strategy = "neovim"
let test#python#runner = "pytest"
function! test#python#pytest#build_args(args, verbose_print) abort
    let args = a:args
    let args = ['-s', '-v'] + args
    return args
endfunction

let g:dispatch_compilers['./vendor/bin/'] = ''

]])
