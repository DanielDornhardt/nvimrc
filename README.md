My NeoVim Dotfile Dir
===

I want to keep my (n)vim packages organized and update-able.

For that using git submodules seems to be the best option. I am afraid of git submodules. But hey! How bad could they be? :)

I'll write myself a small tutorial here.

Git Submodules quick help
---

Check this:

http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

or this: http://usevim.com/2012/03/01/using-pathogen-with-git-submodules/

### Prepare repo for submodules:

    git submodule init

### Add a plugin

    git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
    git add .
    git commit -m "Install Fugitive.vim bundle as a submodule."

### Upgrading a plugin bundle

At some point in the future, the fugitive plugin might be updated. To fetch the latest changes, go into the fugitive repository, and pull the latest version:cd ~/.vim/bundle/fugitive

    git pull origin master

### Upgrading all bundled plugins

You can use the foreach command to execute any shell script in from the root of all submodule directories. To update to the latest version of each plugin bundle, run the following:

    git submodule foreach git pull origin master


