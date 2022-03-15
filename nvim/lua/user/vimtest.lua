vim.cmd([[
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>L :TestLast<CR>
let test#python#strategy = "neovim"
let test#python#runner = "pytest"
let test#php#phpunit#executable = "./vendor/bin/phpunit"
]])

