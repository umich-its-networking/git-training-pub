---
title: Configure SSH Keys
layout: page
---

*You're on your own...* Figure out how to add an SSH key to you GitLab account. See [How to create your SSH Keys]({{ site.gitlaburl }}help/gitlab-basics/create-your-ssh-keys.md).

Once you've done that, you can test to make sure it worked with the -T flag on the SSH command.

```terminal
$ ssh -T git@gitlab.aws.vdc.it.umich.edu
Welcome to GitLab, [Your Name]!
```
