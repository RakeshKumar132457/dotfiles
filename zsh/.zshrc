# -----------------------
# Zsh Specific Configuration
# -----------------------

# Environment Variables and User Configurations
# -----------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
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
# zstyle ':completion:*' matcher-list '' '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle :compinstall filename '/home/rakesh/.zshrc'

# -----------------------
# User Aliases and Commands
# -----------------------
alias ls='exa'
function create-ts-project(){
    if [ "$#" -lt 1 ]; then
        echo "Usage: create-ts-project <project-name> [initial-file-name]"
        return 1
    fi
    local project_name=$1
    local file_name=${2:-"index"}

    mkdir -p "$project_name" && cd "$project_name"

    npm init -y
    npm pkg set type="module"
    npm pkg set main="$file_name.ts"
    npm pkg set scripts.test="jest"

    npm i -D jest @types/jest ts-jest
    echo '
/** @type {import("ts-jest").JestConfigWithTsJest} */
export default {
  preset: "ts-jest"
};' > jest.config.js

    mkdir src
    touch "src/$file_name.ts"
    touch "src/$file_name.test.ts"

    code .
}

# Zsh Syntax Highlighting
# Check if syntax highlighting plugin exists before sourcing
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


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
# Third-Party Tools Configuration
# -----------------------
# Zoxide Initialization
eval "$(zoxide init zsh)"

# Starship Prompt Initialization
eval "$(starship init zsh)"

# -----------------------
# End of Configuration
# -----------------------



# Load Angular CLI autocompletion.
source <(ng completion script)
