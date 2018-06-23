---
title: Configure Git
layout: page
---

Make sure that your git configuration includes your name and email address. These are used in the metadata that's included with each commit.

```terminal
$ git config --global user.name "[Your Name]"
$ git config --global user.email "[you@example.com]"
```

See [Add your Git username and set your email]({{ site.gitlaburl }}help/gitlab-basics/start-using-git.md#add-your-git-username-and-set-your-email) for details.

Note that these commands will modify the `.gitconfig` file in your home directory. Try opening that file to see the configuration you just added.

*You're on your own for this part...* Figure out how to add an SSH key to you GitLab account. See [How to create your SSH Keys]({{ site.gitlaburl }}help/gitlab-basics/create-your-ssh-keys.md).

Once you've done that, you can test to make sure it worked with the -T flag on the SSH command.

```terminal
$ ssh -T git@gitlab.aws.vdc.it.umich.edu
Welcome to GitLab, [Your Name]!
```
