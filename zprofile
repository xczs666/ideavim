# Login shell setup. This is where macOS/iTerm session PATH is assembled.
eval "$(/opt/homebrew/bin/brew shellenv)"

typeset -U path

# User-level CLI tools.
zpath_prepend_if_dir "$HOME/.local/bin"
zpath_prepend_if_dir "$HOME/.cargo/bin"
zpath_prepend_if_dir "$HOME/bin/src/cz/node_modules/commitizen/bin"

# Development toolchains and project helpers.
zpath_prepend_if_dir /opt/homebrew/opt/openjdk/bin
zpath_prepend_if_dir /opt/homebrew/opt/mysql-client/bin
zpath_append_if_dir /opt/homebrew/opt/mysql@8.0/bin
zpath_append_if_dir /opt/homebrew/opt/zookeeper/bin
zpath_append_if_dir "$HOME/async-profiler-2.7-macos"
zpath_append_if_dir /opt/cisco/secureclient/bin
zpath_append_if_dir "$HOME/Documents/workspace/loan-core-delivery-config/scripts"

# Desktop app integrations.
zpath_append_if_dir "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
zpath_append_if_dir /Applications/Obsidian.app/Contents/MacOS

# OrbStack shell integration also adjusts PATH for its CLI tools.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

export PATH
