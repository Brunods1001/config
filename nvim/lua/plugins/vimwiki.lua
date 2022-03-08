--vimwiki sync
vim.cmd([[
let g:vimwiki_sync_branch = "main"
let g:vimwiki_sync_commit_message = 'Auto commit + push. %c'
]])

-- vimwiki
vim.cmd([[
let g:vimwiki_list = [{'path': '~/journal/wiki/', 'syntax': 'default', 'template_path': '~/journal/wiki/templates', 'template_default': 'default'}]
au FileType vimwiki setlocal shiftwidth=4 tabstop=4 noexpandtab
let g:vimwiki_listsyms = ' ○◐●✓'


command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

let g:zettel_format = "%y%m%d-%H%M-%title"

" execute backlinks on save
augroup fix_on_save
    au!
    au BufWritePre *.wiki silent call zettel#vimwiki#backlinks()
    au BufWritePre *.wiki silent call vimwiki#html#WikiAll2HTML("~/journal/wiki_html/", 0)
augroup END

augroup opening
    au BufEnter *.wiki call zettel#vimwiki#backlinks()
augroup END

" open html version of wiki

function! GetPath()
    let fpath = expand("%:p")
    return fpath
endfunction

function! ReplaceWikiDirWithWikiHtml()
    let fpath = GetPath()
    if stridx(fpath, "wiki") != -1
        echo "Replaced /wiki/ with /wiki_html/"
        let fpath = substitute(fpath, "/wiki/", "/wiki_html/", "g")
        let fpath = substitute(fpath, "wiki$", "html", "c")
    else
        echo "Could not find /wiki/ in file path. Returning file path."
    endif
    return fpath
endfunction

function! OpenAsHTML()
    let fpath = ReplaceWikiDirWithWikiHtml()
    execute "!open '".fpath."'"
endfunction
]])
