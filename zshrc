source ~/dotfiles/misc/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found
antigen bundle colored-man-pages
antigen bundle z
antigen bundle extract

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell Antigen that you're done.
antigen apply

# Plugins
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"


# Aliases
# For a full list of active aliases, run `alias`.
alias zshconfig="nano ~/.zshrc"
alias c=clear
alias runserver="python manage.py runserver"
alias venv="source env/bin/activate"
