---
title: Git Basics
layout: page
---

## Create a project in GitLab
  - Use the project creation form: [{{ site.gitlaburl }}projects/new]({{ site.gitlaburl }}projects/new).
  - Call the project `basics`
  - For this exercise, create it under your own username, not any group that you may have access to (not everyone will have access to groups).
  - Set the Visibility Level to "Public".

## Clone the repo

Using the SSH connection string from your repository, create

```terminal
$ git clone git@{{ site.gitlabhost }}:[username]/basics.git
Cloning into 'basics'...
warning: You appear to have cloned an empty repository.
```

This warning is OK. Well fix that in the next step.

Change to the new directory created in the previous step. And note that the directory is empty.

```terminal
$ cd basics
$ ls
```

Since this is a clone of your remote repository, it is already configured with that remote.

```terminal
$ git remote -v
origin    git@{{ site.gitlabhost }}:[username]/basics.git (fetch)
origin    git@{{ site.gitlabhost }}:[username]/basics.git (push)
```

There are usually two URLs listed for each remote because you can configure fetch and push operations to use different URLS. It is rare that you'll need to do this, just remember that you'll see two URLs for each remote when you use this command.

## Add a README file

Add a `README.md` file to this directory with these contents:

```
# Git Basics

We're reviewing git!
```

Stage this file for commit

```terminal
$ git add README.md
```

Note that README.md is now ready to be committed

```terminal
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file﹥..." to unstage)

      new file:   README.md
```

Create a commit

```terminal
$ git commit -m "Add documentation"
[master (root-commit) 4144c9b] Add documentation
 1 file changed, 3 insertions(+)
  create mode 100644 README.md
```

Now push that commit to the remote repository.

```terminal
$ git push
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Writing objects: 100% (3/3), 251 bytes | 251.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To {{ gitlabhost }}:steinhof/basics.git
 * [new branch]      master -﹥ master
```

Now go to the web interface for your repository and note that there's a repository there now and that your `README.md` is there. Also note that GitLab displays your `README.md` file, rendered as HTML, below the file listing for the repository.

## Adding and Committing in one step

The `-m` flag that we used above lets you specify the commit message on the command line. If you omit that flag, git will drop you into your `$EDITOR` to compose the commit message.

Also, in the steps above, we had a separate call to `git add` and `git commit`. This is necessary when adding new files to the repository, but if you're dealing with files that are already being tracked, you can use the `-a` flag to add and commit in one step.

Let's modify `README.md` and add another line of text, so that its contents now look like this:

```
# Git Basics

We're reviewing git!

Here's new line!
```

Use `git status` to see that this file isn't staged from commit.

```terminal
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file﹥..." to update what will be committed)
    (use "git checkout -- <file﹥..." to discard changes in working directory)

        modified:   README.md

        no changes added to commit (use "git add" and/or "git commit -a")
```

Use `git diff` to see the specific changes.

```terminal
$ git diff
diff --git a/README.md b/README.md
index 2995f2c..ac3babd 100644
--- a/README.md
+++ b/README.md
@@ -1,3 +1,5 @@
 ﹟ Git Basics

  We're reviewing git!
  +
  +Here's new line!
```

Now add and commit the change with one step.

```terminal
$ git commit -a
```

Note that since we didn't sepecify the commit message on the command, git will drop you into your editor to compose the message. It helpfully add text to the temp document it creates that looks like this:

```

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch master
# Your branch is up to date with 'origin/master'.
#
# Changes to be committed:
#       modified:   README.md
#
```

Just add your commit message on the first line, then save file and quit your editor. Git will ignore anything in this file that starts with a `#` and use the rest for the commit message. It will then remove the temp file.

Add a commit message, like `Added a line to the documentation` to the top of the file, save and quit.

## Pushing, again

Use the `git status` command to check the current state of your working directory.

```terminal
$ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

  nothing to commit, working tree clean
```

Note that there is nothing to commit, but also note the message that says "Your branch is ahead of 'origin/master' by 1 commit." This is because you have that new commit locally, but the remote repository doesn't have it yet.

Push to the remote repository.

```terminal
$ git push
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 4 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 310 bytes | 310.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To gitlab.aws.vdc.it.umich.edu:steinhof/basics.git
   4144c9b..fee706e  master -﹥ master
```

Now do the `git status` again.

```terminal
$ git status
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```

Note that it now tells you "Your branch is up to date with 'origin/master'."

## Git tries to be helpful

Several of the git commands above produce output that suggest other commands. It's usually worth looking at the output for these suggestions.

## Explore changes in the web interface


