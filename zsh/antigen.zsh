source $ZSH/lib/antigen/antigen.zsh

antigen bundle git
antigen bundle rails
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

zmodload zsh/terminfo
# bindkey "$terminfo[kcuu1]" history-substring-search-up
# bindkey "$terminfo[kcud1]" history-substring-search-down

# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

