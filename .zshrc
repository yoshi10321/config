fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit -u

autoload predict-on
predict-on

alias br='git branch'
alias st='git status'
alias ls='ls -G -l'

autoload -U colors
colors


autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '%{'${fg[green]}'%}[%s %b] %{'$reset_color'%}'


setopt prompt_subst
precmd () {
  LANG=en_US.UTF-8 vcs_info
  LOADAVG=$(sysctl -n vm.loadavg | perl -anpe '$_=$F[1]')
  PROMPT='${vcs_info_msg_0_}%{${fg[yellow]}%}%* ($LOADAVG) %%%{$reset_color%} '
}
RPROMPT='%{${fg[green]}%}%/%{$reset_color%}'


eval "$(rbenv init - zsh)"

export PATH="/usr/local/bin:$PATH"


[[ -s /Users/A12711/Documents/git/.nvm/nvm.sh ]] && . /Users/A12711/Documents/git/.nvm/nvm.sh
nvm use v0.10.24
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir
