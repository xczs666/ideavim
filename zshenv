# Loaded by every zsh invocation, including non-interactive non-login shells.
# Keep this file quiet and fast: foundational environment only.

typeset -U path

zpath_prepend_if_dir() {
  [[ -d "$1" ]] && path=("$1" $path)
}

zpath_append_if_dir() {
  [[ -d "$1" ]] && path=($path "$1")
}

# User command locations needed by scripts and agent shells.
zpath_prepend_if_dir "$HOME/bin"

# Homebrew and local system tools.
zpath_prepend_if_dir /opt/homebrew/bin
zpath_prepend_if_dir /usr/local/bin

export PATH

# Env-only variables that build/test commands may need.
export EDITOR='vim'
export XDG_CONFIG_HOME="$HOME/.config"

export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/corretto-1.8.0_452/Contents/Home"
export CLASSPATH=".:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:${CLASSPATH:-}"

export M2_HOME=/opt/homebrew/opt/maven
export M2="$M2_HOME/bin"

export HOMEBREW_NO_AUTO_UPDATE=true
