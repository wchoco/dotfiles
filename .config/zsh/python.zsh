# python
## pyenv (git clone https://github.com/pyenv/pyenv.git ~/.pyenv)
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:$PATH"
hash pyenv 2> /dev/null && eval "$(pyenv init -)"
