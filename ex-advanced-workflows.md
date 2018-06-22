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

Fork the Maintainer's repository with the GitLab interface. See the [How to fork a project]({{ site.gitlaburl }}help/gitlab-basics/fork-project.md) documentation.

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
