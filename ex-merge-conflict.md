---
title: Handling Merge Conflicts
layout: page
---

This exercise is set up for two people to do together. Find a partner, or proceed alone and play both roles.

The players:
  - **Maintainer**
  - **Contributor**

Each of the sections below is labeled for the player who should perform the steps in that section.

## BOTH: Configure repositories

Reuse the repositories from the [Branching and Merging exercise]({{ "ex-banching-merging" | relative_url }}) (or configure repositories on GitLab and locally as described in the first steps of that exercise).

## MAINTAINER: Add a new file

Create **two new files** called `lorem.txt` and `ipsum.txt` both with these contents:

```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.
```

Add, commit, and push the commit.

```terminal
$ git add lorem.txt ipsum.txt
$ git commit -a -m 'Add lorem ipsum text'
[master 505e0ee] Add lorem ipsum text
 1 file changed, 6 insertions(+)
 create mode 100644 lorem.txt
$ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
$ git push
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 552 bytes | 552.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To {{ site.gitlabhost }}:[maintainer]/advanced.git
   2cfabd4..505e0ee  master -﹥ master
```

## CONTRIBUTOR: Fetch and merge

Fetch and merge the maintainer's changes.

```terminal
$ git fetch upstream
remote: Counting objects: 3, done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
From {{ site.gitlabhost }}:[maintainer]/advanced
   2cfabd4..505e0ee  master     -﹥ upstream/master
$ git checkout master
Already on 'master'
Your branch is up to date with 'origin/master'.
$ git merge upstream/master
Updating 2cfabd4..505e0ee
Fast-forward
 lorem.txt | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 lorem.txt
```

## MAINTAINER: Make and commit a change at the top ot the file

Edit `lorem.txt` to add a line at the top of the file:

```
123

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.
```

Commit and push.

```terminal
$ git commit -a -m 'Add to top'
[master 553a218] Add to top
 1 file changed, 2 insertions(+)
$ git push
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 4 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 812 bytes | 812.00 KiB/s, done.
Total 6 (delta 1), reused 0 (delta 0)
To gitlab.aws.vdc.it.umich.edu:its-inf-net/advanced.git
   2cfabd4..553a218  master -﹥ master
```

## CONTRIBUTOR: Make a change to bottom of the file, then sync

BEFORE YOU SYNC...

Change `lorem.txt` to add a line at the end of the file.

```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.

456
```

Commit the change.

```terminal
$ git commit -a -m 'Add to bottom'
[master 99b1e97] Add to bottom
 1 file changed, 2 insertions(+)
```

Now sync with the maintainer's repository.

```terminal
$ git fetch upstream
remote: Counting objects: 3, done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 1), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
From {{ site.gitlabhost }}:[maintainer]/advanced
   505e0ee..31dd55c  master     -﹥ upstream/master
$ git merge upstream/master
Auto-merging lorem.txt
Merge made by the 'recursive' strategy.
 lorem.txt | 2 ++
 1 file changed, 2 insertions(+)
```

The `git merge` command will drop you into your `$EDITOR` to edit a commit message for the merge. It will populate the temp file like this:

```
Merge remote-tracking branch 'upstream/master'

# Please enter a commit message to explain why this merge is necessary,
# especially if it merges an updated upstream into a topic branch.
#
# Lines starting with '#' will be ignored, and an empty message aborts
# the commit.
```

It is usually fine to just use the default message.

Note that the merge says, "Auto-merging lorem.txt". It can't do a fast-forward merge the branches have diverged. But since the diffs didn't overlap, it was able to do an auto-merge.

## MAINTAINER: Change ipsum.txt

Make a change to the bottom of `ipsum.txt`, so that it now looks like this:

```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.

abc
```

Commit and push.

```terminal
$ git commit -a -m 'Add to bottom of ipsum'
[master 5a536b9] Add to bottom of ipsum
 1 file changed, 2 insertions(+)
$ git push
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 344 bytes | 344.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0)
To {{ site.gitlabhost }}:[maintainer]/advanced.git
   82f63e8..5a536b9  master -﹥ master
```

## CONTRIBUTOR: Make a change to the bottom of ipsum

Add a line to the bottom of `ipsum.txt` so it looks like this:

```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.

def
```

Commit the change.

```terminal
$ git commit -a -m 'Add "def" to bottom'
[master a5e3761] Add "def" to bottom
 1 file changed, 2 insertions(+)
```

Sync with maintainer's upstream.

```terminal
$ git fetch upstream
remote: Counting objects: 3, done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 1), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
From {{ site.gitlabhost }}:[maintainer]/advanced
   82f63e8..5a536b9  master     -﹥ upstream/master
$ git merge upstream/master
Auto-merging ipsum.txt
CONFLICT (content): Merge conflict in ipsum.txt
Automatic merge failed︔ fix conflicts and then commit the result.
```

Git couldn't auto-merge this time because the changes overlap in `ipsum.txt`.

Use `git status` to see what's going on.

```terminal
$ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file﹥..." to mark resolution)

	both modified:   ipsum.txt

no changes added to commit (use "git add" and/or "git commit -a")
```
Open `ipsum.txt` in your editor. The contents should look like this:

```
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
culpa qui officia deserunt mollit anim id est laborum.

<<<<<<< HEAD
def
=======
abc
>>>>>>> upstream/master
```

Git has modified the file to show changes from both branches. You'll have to clean things up and delete the lines that start with `<<<<<<<`, `=======`, and `>>>>>>>`.

Once `ipsum.txt` is correct, save it, and commit to complete the merge.

```terminal
$ git commit -a
[master 9ef5a2f] Merge remote-tracking branch 'upstream/master'
```
