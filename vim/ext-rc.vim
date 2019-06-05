autocmd vimenter * NERDTree

command CargoBuild execute "!cargo build"
command CargoRun execute "!cargo run"
command RustFmt execute "silent !rustfmt %" | execute 'redraw!'

command -nargs=+ Replace :call MyReplace(<f-args>)

function MyReplace(before, after)
    :execute ",$s/".a:before."/".a:after."/gc|1,''-&&"
endfunction
