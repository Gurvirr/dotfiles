# Created by newuser for 5.8.1

# 1. Starship prompt (The visual bar)
eval "$(starship init zsh)"

# 2. Path Setup
# Includes your local bin and Cargo (for Rust/uv tools)
export PATH="$HOME/bin:$HOME/.cargo/bin:$PATH"

# 3. Zoxide (Smart cd)
eval "$(zoxide init zsh)"

# 4. FZF (Search)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Note: On some Ubuntu installs, these paths might differ. 
# If these error, you can comment them out.
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# --- ALIASES ---

# The "Cool" Tools replacements
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l --git"
alias tree="eza --icons --tree"
alias bat="batcat"
alias cat="batcat -p"    # Makes 'cat' use bat automatically
alias grep="rg"          # Requires ripgrep installed

# Your Custom Shortcuts
alias rm="rm -i"
alias wez="nano /mnt/c/Users/gurvi/.wezterm.lua"
alias zshrc="nano ~/.zshrc"
alias starship="nano ~/.config/starship.toml"
alias reload="source ~/.zshrc"
# Note: "Users" and username are case sensitive!
alias zed="/mnt/c/Users/gurvi/AppData/Local/Programs/Zed/Zed.exe"

# --- PLUGINS ---
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Push dotfile changes to GitHub with one command
sync() {
    cd ~/dotfiles
    git add .
    # Use a custom message if provided, otherwise use a default
    local msg="${1:-update}"
    git commit -m "$msg"
    git push
    cd - > /dev/null
}
