command -nargs=+ Replace :call MyReplace(<f-args>)

function MyReplace(before, after)
    :execute ",$s/".a:before."/".a:after."/gc|1,''-&&"
endfunction
