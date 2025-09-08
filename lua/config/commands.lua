-- Save Files With Root Priveleges
vim.cmd([[command! -nargs=0 Sw w !sudo tee % > /dev/null]])

-- fix annoying CRLF error
vim.cmd([[command! -bar NoCRLF :set ff=unix]])
