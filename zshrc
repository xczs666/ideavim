# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$HOME/.zsh_custom

# zsh-vi-mode 配置https://github.com/jeffreytse/zsh-vi-mode
function zvm_config() {
  ZVM_VI_SURROUND_BINDKEY=s-prefix
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  #ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  # 其他插件的bindkey 加载
  ZVM_INIT_MODE=sourcing
}
#function zvm_after_init() {
#  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#}
# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    brew
    git
    git-flow
	# git clone https://github.com/bobthecow/git-flow-completion ~/.oh-my-zsh/custom/plugins/git-flow-completion
	# rm /opt/homebrew/share/zsh/site-functions/_git && rm "$ZSH_COMPDUMP" && exec zsh
	git-flow-completion
    zsh-syntax-highlighting
    zsh-autosuggestions
    docker
    docker-compose
    mvn
    autojump
    # ctrl-o
    copybuffer
    copypath
    # https://github.com/jeffreytse/zsh-vi-mode
    # git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
    zsh-vi-mode
    # Ctrl + Shift + Left / Right
    dircycle
    you-should-use
    autoupdate
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# externtion
# insecure directories you can set the variable ZSH_DISABLE_COMPFIX to
# ZSH_DISABLE_COMPFIX="true"

setopt autolist
# /opt/homebrew/share/zsh/site-functions

# eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_NO_AUTO_UPDATE=true

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
  source $(brew --prefix)/share/bash-completion/completions/*
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# `/usr/libexec/java_home -v 8`
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home/
export JAVA_HOME=/Users/chenzhi.xu/Library/Java/JavaVirtualMachines/corretto-1.8.0_382/Contents/Home/
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$CLASSPATH



#alias ls='ls -FG'
#alias l='ls -ltr'
alias ls="eza"
alias l="eza -lh --time-style long-iso --time modified --git -s modified"
alias tree="eza --tree"
alias du='du -h -d 0'
alias vi='nvim'
alias rm='trash-put'
alias fd='fd -I -c auto'
alias op='open .'
#alias tm='tmux'
alias tnew='tmux new -s '
alias ta='tmux at '
alias tls='tmux ls && read session && tmux attach -t ${session:-default} || tmux new -s ${session:-default}'
alias j='z'
alias proxy='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
alias unproxy='unset https_proxy http_proxy all_proxy'
#alias lg='lazygit'
alias cpn='copypath'
lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir
    lazygit "$@"
    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
        rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

# https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md
# change lazygit config directory, default use ~/Library/Application Support/lazygit/config.yml
export XDG_CONFIG_HOME="$HOME/.config"

export M2_HOME=/opt/homebrew/opt/maven
export M2=$M2_HOME/bin

## zsh-autosuggestions
# autosuggest-accept：接受当前建议。
# autosuggest-execute：接受并执行当前建议。
# autosuggest-clear：清除当前建议。
# autosuggest-fetch：获取建议（即使建议被禁用也可以工作）。
# autosuggest-disable：禁用建议。
# autosuggest-enable：重新启用建议。
# autosuggest-toggle：在启用/禁用建议之间切换。
export PATH="$HOME/.cargo/bin:/opt/homebrew/opt/mysql-client/bin:$PATH:$HOME/bin:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

## fzf
# CTRL-T- 将选定的文件和目录粘贴到命令行
#   设置FZF_CTRL_T_COMMAND为覆盖默认命令
#   设置FZF_CTRL_T_OPTS传递附加选项
# ALT-C- cd 进入选择的目录
#   设置FZF_ALT_C_COMMAND为覆盖默认命令
#   设置FZF_ALT_C_OPTS传递附加选项
export FZF_DEFAULT_COMMAND="fd -H -I --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -H -I -t d --color=always"
#export FZF_CTRL_R_OPTS="
#  --preview 'echo {}' --preview-window up:3:hidden:wrap
#  --bind 'ctrl-/:toggle-preview'
#  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#  --color header:italic
#  --header 'Press CTRL-Y to copy command into clipboard'"
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
bindkey -M viins '\C-x\C-e' edit-command-line

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor,raw-history-view       # get more colors
# viins vi插入模式下
bindkey -sM viins "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
export HSTR_TIOCSTI=y

export PATH=$PATH:$HOME/async-profiler-2.7-macos

# 1password
# eval "$(op completion zsh)"; compdef _op op

# eval "$(jira --completion-script-zsh)"

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

export PATH=$PATH:/opt/homebrew/opt/zookeeper/bin/


[ -f /Users/chenzhi.xu/.docker/init-zsh.sh ] && source /Users/chenzhi.xu/.docker/init-zsh.sh # Added by Docker Desktop

# vim中调用terminal 会带入VIM,VIMRUNTIME. 有此变量再使用nvim会报错
export VIM=
export VIMRUNTIME=


export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
export PATH="/Users/chenzhi.xu/bin/src/cz/node_modules/commitizen/bin:/opt/homebrew/opt/mysql@8.0/bin:$PATH:/opt/cisco/secureclient/bin"

eval "$(zoxide init zsh)"
eval "$(register-python-argcomplete cz)"


