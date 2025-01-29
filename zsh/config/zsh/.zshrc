# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$\{XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-$\{(%):-%n}.zsh" ]]; then
  source "$\{XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-$\{(%):-%n}.zsh"
fi

typeset -U path cdpath fpath manpath

# Use emacs keymap as the default.
bindkey -e

## antidote begin :
source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh


bundlefile=${ZDOTDIR:-$HOME}/.zsh_plugins.txt
zstyle ':antidote:bundle' file $bundlefile
staticfile=/tmp/tmp_hm_zsh_plugins.zsh-681ikzjbqcxj7yqy4jslcibfhjlhhwl6
zstyle ':antidote:static' file $staticfile

antidote load $bundlefile $staticfile

## home-manager/antidote end


# Oh-My-Zsh/Prezto calls compinit during initialization,
# calling it twice causes slight start up slowdown
# as all $fpath entries will be traversed again.
autoload -U compinit && compinit


# History options should be set in .zshrc and after oh-my-zsh sourcing.
# See https://github.com/nix-community/home-manager/issues/177.
HISTSIZE="10000"
SAVEHIST="10000"

HISTFILE="$HOME/.zsh_history"
mkdir -p "$(dirname "$HISTFILE")"

setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_DUPS
unsetopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY
setopt autocd

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
setopt NO_NOMATCH #for nixpkgs#hello grammer

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

eval "$(direnv hook zsh)"


# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cat='batcat --paging=never'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias l='ls -CF '
alias la='ls -A '
alias ll='ls -alF '
alias ls='ls --color -h'
alias mj='make -j $(nproc)'
alias tp='trash put'
alias vimdiff='nvim -d'
alias fd='fdfind'

# Named Directory Hashes

export PATH=${PATH/':\/snap\/bin'/}
export PATH=${PATH/':\/usr\/local\/games'/}
export PATH=${PATH/':\/usr\/games'/}
# for self install app
export PATH=~/.local/bin:$PATH
export LD_LIBRARY=~/.local/lib:$LD_LIBRARY
export CPATH=~/.local/include:$CPATH

