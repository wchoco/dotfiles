# rust
exist rustc && {
    export PATH="$HOME/.cargo/bin:$PATH"
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

    # exa
    alias ls="exa -F"
    alias ll="exa -Fal"
    alias tree="exa -T"
}
