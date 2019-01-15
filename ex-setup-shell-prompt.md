---
title: Setup Shell Prompt (optional)
layout: page
---

Knowing the current state of your working copy makes using git much easier. One way to do this is with the `git status` command. But you can also customize your command prompt to show you this this information in a condensed form that will update everytime the command prompt is displayed, giving you an up-to-date summary of your repositories state.

There are several ways to do this. In this exercise we will use the [git-prompt.sh](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh) script from the git project itself.

## Set up git-prompt.sh

Change to your home directory:

```terminal
$ cd ~
```

Downloading the git-prompt.sh script to your home directory. This command will save the file to `~/.git-prompt.sh`:

```terminal
$ wget -O ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
```

... or ... 

```terminal
$ curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
```

Source this file to load it:

```terminal
$ source ~/.git-prompt.sh
```

Set environmental variables that git-prompt uses for its settings:

```terminal
$ export GIT_PS1_SHOWDIRTYSTATE=1
$ export GIT_PS1_SHOWUPSTREAM=auto
$ export GIT_PS1_SHOWUNTRACKEDFILES=1
```
Update the PS1 environmental variable to use the 

```terminal
$ PS1='\W $(__git_ps1 "(%s) ")\$ '
~ $
```

## Try it out

```terminal
~ $ mkdir prompt-test
~ $ cd prompt-test
prompt-test $ git init
Initialized empty Git repository in /Users/steinhof/prompt-test/.git/
prompt-test (master ⌗) $ echo 'Hello world' > README
prompt-test (master ⌗%) $ git add README
prompt-test (master +) $ git commit
Aborting commit due to empty commit message.
prompt-test (master +) $ git commit -m 'Add README'
[master (root-commit) d7c63a3] Add README
 1 file changed, 1 insertion(+)
 create mode 100644 README
prompt-test (master) $ git checkout -b develop
Switched to a new branch 'develop'
prompt-test (develop) $ echo 'Hello develop' >> README
prompt-test (develop *) $ git commit -a -m 'Update README'
[develop 5ae21ce] Update README
 1 file changed, 1 insertion(+), 1 deletion(-)
prompt-test (develop) $ git checkout master
Switched to branch 'master'
prompt-test (master) $ cd ..
~ $ rm -r prompt-test
```

## Make it permanent

Add this to your `~/.bash_profile` file to get these settings when you start a new shell:

```shell
if [ -f $HOME/.git-prompt.sh ]; then
    source $HOME/.git-prompt.sh
    
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUPSTREAM=auto
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    
    export PS1='\W $(__git_ps1 "(%s) ")\$ '
fi
```

## Get fancy

If you want a more elaborate prompt, check out [bash-it](https://github.com/Bash-it/bash-it) or [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). These frameworks provide handy mechanisms to create colorful and useful prompts and have some good built-in prompts you can use.
