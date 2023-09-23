alias gdb='gdb-multiarch -q'
alias checksec='gdb -ex "checksec" -ex "quit"'
alias angr='docker run --rm -it -v $PWD:/work -w /work angr/angr'
