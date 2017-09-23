alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

alias sublime='subl'


export PATH="./bin:/usr/local/bin:/usr/local/sbin:$DOTZSH/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/git/man:$MANPATH"

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

export EDITOR='subl -w'

