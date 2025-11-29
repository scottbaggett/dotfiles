
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


starship init fish | source
zoxide init fish | source
# Eza
alias ls='eza --color=always --long --git --no-filesize --no-user --no-filesize --no-permissions --icons'
alias lst='ls --tree -L=2'

# pnpm
set -gx PNPM_HOME "/Users/scottbaggett/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
alias venv-activate="source venv/bin/activate.fish"

# Added by Antigravity
fish_add_path /Users/scottbaggett/.antigravity/antigravity/bin
