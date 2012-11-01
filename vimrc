" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd WinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove highlight after pressing enter after search
nnoremap <CR> :noh<CR><CR>

" Use tab to switch between current/prev buffers
nnoremap <Tab> <C-^>

" Don't show special chars
set nolist

" Alignment shortcut
noremap :A= :Tabularize /^[^=]*\zs=
noremap :A> :Tabularize /^[^=]*\zs=>
noremap :A: :Tabularize /^[^:]*:
noremap :A{ :Tabularize /^[^{]*\zs{
noremap :T :Tabularize /

nmap <F3> :w<CR>
vmap <F3> <Esc><F3>gv
imap <F3> <Esc><F3>li

command FixSpace %s/\s\+$/

" Nerd tree: single clicks open file/dir
let g:NERDTreeMouseMode = 3

" Don't manage working directory
let g:ctrlp_working_path_mode = 0

" Search by filename, not path
let g:ctrlp_by_filename = 1

" Replace the UpdateNERDTree function from Janus with one that does not
" auto-refresh on FocusGained. The autorefresh can be slow and annoying.
autocmd! AuNERDTreeCmd FocusGained *
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      if !stay
        wincmd p
      end
    endif
  endif
endfunction

" Switch windows with Ctrl+Shift+[Arrow]
map <C-S-Up> <C-w>k
imap <C-S-Up> <Esc> <C-w>k
map <C-S-Down> <C-w>j
imap <C-S-Down> <Esc> <C-w>j
map <C-S-Right> <C-w>l
imap <C-S-Right> <Esc> <C-w>l
map <C-S-Left> <C-w>h
imap <C-S-Left> <C-w>h

" Switch windows with <Leader>[hjkl]
map <Leader>h <C-w>h
imap <Leader>h <Esc> <C-w>h
map <Leader>j <C-w>j
imap <Leader>j <Esc> <C-w>j
map <Leader>k <C-w>k
imap <Leader>k <Esc> <C-w>k
map <Leader>l <C-w>l
imap <Leader>l <C-w>l

color vwilight

" Set a coloured bar at 120 chars
hi ColorColumn guibg=#222222 ctermbg=8
set colorcolumn=120

map <leader>s :split<CR>
map <leader>v :vsplit<CR>

map ; :
noremap ;; ;

set visualbell
set noerrorbells
