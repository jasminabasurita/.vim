" Save Files With Root Priveleges
command! -nargs=0 Sw w !sudo tee % > /dev/null

" fix annoying CRLF error
command! -bar NoCRLF :set ff=unix
