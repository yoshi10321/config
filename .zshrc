autoload -U compinit && compinit
alias ls='ls -G'
alias br='git branch'
alias st='git status'

autoload -U colors
colors


autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '%{'${fg[red]}'%}[%s %b] %{'$reset_color'%}'


setopt prompt_subst
precmd () {
  LANG=en_US.UTF-8 vcs_info
  LOADAVG=$(sysctl -n vm.loadavg | perl -anpe '$_=$F[1]')
  PROMPT='${vcs_info_msg_0_}%{${fg[yellow]}%}%* ($LOADAVG) %%%{$reset_color%} '
}
RPROMPT='%{${fg[green]}%}%/%{$reset_color%}'
