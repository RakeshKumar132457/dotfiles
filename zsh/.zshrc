# -----------------------
# Zsh Specific Configuration
# -----------------------
# History Configuration
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Disable beep sound
unsetopt beep

# Enable vi mode keybindings
bindkey -v
bindkey '^R' history-incremental-search-backward

# Completion System Initialization
autoload -Uz compinit
compinit

# Zsh Completion Style Configuration
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/rakesh/.zshrc'

# -----------------------
# Aliases
# -----------------------
alias ls='exa'
alias cat='bat'

# -----------------------
# Third-Party Tools Configuration
# -----------------------
# Zoxide Initialization
eval "$(zoxide init zsh)"

# Starship Prompt Initialization
eval "$(starship init zsh)"

# Zsh Syntax Highlighting
# Check if syntax highlighting plugin exists before sourcing
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# -----------------------
# Environment Variables and User Configurations
# -----------------------
export PATH="$HOME/.local/bin:$PATH"

# NVM (Node Version Manager) Configuration
export NVM_DIR="$HOME/.nvm"
# Safely load nvm if it exists
if [ -s "$NVM_DIR/nvm.sh" ]; then . "$NVM_DIR/nvm.sh"; fi
# Safely load nvm bash_completion if it exists
if [ -s "$NVM_DIR/bash_completion" ]; then . "$NVM_DIR/bash_completion"; fi

# Rust Cargo Environment
# Safely load Cargo environment if it exists
if [ -f "$HOME/.cargo/env" ]; then . "$HOME/.cargo/env"; fi

# -----------------------
# End of Configuration
# -----------------------

