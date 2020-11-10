" {{{ bundle-lmgtfy.vim 
if exists('g:loaded_bundle_lmgtfy')
  finish
endif
let g:loaded_bundle_lmgtfy=1
" -------------------------------------------------------------------------- }}}
" {{{ lmgtfy | https://github.com/junegunn/dotfiles 
"
" <Leader>?/! | Google it / Feeling luckey | junegunn/dotfiles
function! LMGTFY(pat, lucky)

  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  if has("win32unix")
    call system(printf('cygstart --open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
  else
    call system(printf('xdg-open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
  endif

endfunction
" -------------------------------------------------------------------------- }}}
