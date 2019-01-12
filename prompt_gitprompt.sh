if [ -f $HOME/.git-prompt.sh ]; then
    source $HOME/.git-prompt.sh
    
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUPSTREAM=auto
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    
    export PS1='\W $(__git_ps1 "(%s) ")\$ '
fi

