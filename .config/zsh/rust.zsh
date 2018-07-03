# rust
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
function rust_run() {
    rustc $1
    local binary=$(basename $1 .rs)
    ./$binary
    rm ./$binary
}
alias rr="rust_run"
