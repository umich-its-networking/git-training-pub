---
title: Advanced Git Workflows
layout: page
---

This exercise is set up for two people to do together. Find a partner, or proceed alone and play both roles.

The players:
  - **Maintainer**
  - **Contributor**

Each of the sections below is labeled for the player who should perform the steps in that section.


## MAINTAINER: Create a repository

Create a project in GitLab
  - Use the project creation form: [{{ site.gitlaburl }}projects/new]({{ site.gitlaburl }}projects/new).
  - Call the project `advanced`
  - For this exercise, create it under your own username, not any group that you may have access to (not everyone will have access to groups).
  - Set the Visibility Level to "Public".

Add a `README.md` file to the repository. You can do this with the GitLab interface (there's an `Add Readme` button) or by following the steps in the [Git Basics]({{ "ex-git-basics" | relative_url }}) exercise.


## CONTRIBUTOR: Fork the repository

Fork the Maintainer's repository with the GitLab interface. See the [How to fork a project]({{ site.gitlaburl }}help/gitlab-basics/fork-project.md) documentation. After doing this you should have you own copy of the reposity at {{ site.gitlaburl }}[username]/advanced.git

## BOTH: Clone your respective repository

The Maintainer should clone his/her repsoitory, and the Contributor should clone the respitory from his/her fork.

```terminal
$ git clone git@{{ site.gitlabhost }}:[username]/advanced.git
Cloning into 'advanced'...
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0)
Receiving objects: 100% (3/3), done.
```

Each player should have a clone of the repository now, both should contain the `README.md` file created by the Maintainer in the step above.

## CONTRIBUTOR: Add a remote for the Maintainer's repository

Add a remote to your local working copy that points to the maintainer's GitLab repository.

```terminal
$ git remote add upstream git@{{ site.gitlabhost }}:[maintainer]/advanced.git
```

You now have to remotes configured.

```terminal
$ git remote -v
origin    git@{{ site.gitlabhost }}:[maintainer]/advanced.git (fetch)
origin    git@{{ site.gitlabhost }}:[maintainer]/advanced.git (push)
upstream    git@{{ site.gitlabhost }}:[contributor]/advanced.git (fetch)
upstream    git@{{ site.gitlabhost }}:[contributor]/advanced.git (push)
```

Use `git fetch` to update your local repository's history of the new remote.

```terminal
$ git fetch upstream
From gitlab.aws.vdc.it.umich.edu:steinhof/advanced
 * [new branch]      master     -﹥ upstream/master
```

## MAINTAINER: Make a change to your repository

Make a small change to your README.md file, commit the change and push it to your remote.

```terminal
$ echo hello world >> README.md
$ git st
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add <file﹥..." to update what will be committed)
  (use "git checkout -- <file﹥..." to discard changes in working directory)

	modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
$ git commit -a -m 'Added to README'
[master 50dad14] Added to README
 1 file changed, 1 insertion(+), 1 deletion(-)
$ git push
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Writing objects: 100% (3/3), 269 bytes | 269.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To gitlab.aws.vdc.it.umich.edu:steinhof/advanced.git
   3e99c8c..50dad14  master -﹥ master
```

## CONTRIBUTOR: Sync your repository to get maintainer's changes

In order to get the maintainer's changes into your repository, you need to fetch them from their remote and merge them into your `master` branch.

```terminal
$ git fetch upstream
remote: Counting objects: 3, done.
remote: Total 3 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
From gitlab.aws.vdc.it.umich.edu:steinhof/advanced
   3e99c8c..50dad14  master     -﹥ upstream/master
$ git merge upstream/master
Updating 3e99c8c..50dad14
Fast-forward
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
$ tail -1 README.md
hello world
```

It is a good practice to stay in sync with upstream remotes.


