# ----------------- theme -------------------------
zinit lucid for \
    romkatv/powerlevel10k
# ----------------- completions -------------------
zinit as'completion' for \
    https://github.com/ogham/exa/blob/master/completions/completions.zsh \
    https://github.com/oniony/TMSU/blob/master/misc/zsh/_tmsu \
    https://github.com/gokcehan/lf/blob/master/etc/lf.zsh \
    https://github.com/gradle/gradle-completion/blob/master/gradle-completion.plugin.zsh
# ----------------- snippets ----------------------
zinit wait'5' lucid for \
    OMZP::colored-man-pages \
    OMZP::docker/_docker
# ----------------- packages-----------------------
zinit wait'8' lucid for \
    supercrabtree/k \
    atinit'source $ZDOTDIR/atload/forgit.zsh'  \
    atload'FORGIT_NO_ALIASES=true'  \
        wfxr/forgit
# ----------------- immidiate --------------------
zinit wait lucid for \
    atload'_zsh_autosuggest_start' \
        zsh-users/zsh-autosuggestions \
    atinit'source $ZDOTDIR/atload/zsh-history-substring-search.zsh'  \
        zsh-users/zsh-history-substring-search  \
    MichaelAquilina/zsh-you-should-use \
    zdharma/fast-syntax-highlighting \
    zsh-users/zsh-completions
