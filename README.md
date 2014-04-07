Sage One Live Services Team Starter Dotfiles
============================================

This repo contains some starter dotfiles for usage by team members in
the Sage One Live Services Team. They include some zsh and vim settings
to make life working with Git repos easier.

These make for a good starting point for adding your own customisations.

**WARNING** This will change your prompt and editor settings. If you
already have dotfiles/preferences setup then don't use this as they will
be overwritten.

Installation
------------

Make sure you have zsh installed and make it your default shell (you can
thank me later):

    $ which zsh
    /bin/zsh
    $ chsh -s /bin/zsh

Clone the repo into your home directory and run make to install. This
will clone the git submodule and symlink files into `$HOME`. You can use
`make clean` to undo/remove the symlinks.

    $ cd ~
    $ git clone https://github.com/sageoneliveserviceteam/s1_elsm_dotfiles.git
    $ cd s1_elsm_dotfiles
    $ make

You may need to logout / login for prompt changes to take effect. When
you next start vim it will ask if you'd like to install bundles, answer
yes.

**Important**: Make sure you open up the `.gitconfig` file and change
the user settings.

Usage
-----

The dotfiles add many settings and aliases to make life easier.
The files themselves are well commented so delve in there to check
everything provided. Tab completions for Bundler, Rubygems, and JQ are
also added.

These are some of the most useful day to day features:

### General

* `...` = `cd ../..`
* `_` = `sudo`
* `l` = `ls -la`

### Bundler

* `be` = `bundle exec`
* `bi` = `bundle install`
* `bl` = `bundle list`

### Git

* `g` = `git`
* `gst` = `git status`
* `gl` = `git pull`
* `gp` = `git push`
* `gc` = `git commit -v`

### Vim

Vim is setup as your default editor and will be invoked by Git when needed such
as a `git commit`.  There are a couple of Git related plugins installed as well as
a colourscheme pack so that you can choose your preferred colours.

When entering Git commit messages colour highlighting will show when you've
went passed the recommended char limit for the summary.  It will also wrap the
detailed message appropriately.

#### General

* Default `<leader>` is set to `,`.
* `<leader>i` = Toggle invisible chars.
* `<leader>N` = Toggle line numbers.
* `<leader>/` = Hide search results highlighted by search with `/searchterm`.
* `w!!`       = Sudo write.
* `<leader>W` = Strip all trailing whitespace.

#### Fugitive

[Fugitive](https://github.com/tpope/vim-fugitive) allows you to use Git
within Vim.

* `<leader>gs` = Shows Git status window.
* `CTRL-n`     = Jump to unstaged files within status window.
* `-`          = Stage file under cursor in status window.
* `C`          = Commit staged files, this will turn status window into a Git
commit message window.

There are many more [Fugitive](https://github.com/tpope/vim-fugitive) commands
see the documentation for more.

Further Improvements
--------------------

For further ideas on customising zsh and vim see:

[Ross Timson's dotfiles](https://github.com/rosstimson/dotfiles/), which
these configs were extracted from.

[Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh), a community
driven zsh project.

[spf13-vim](http://vim.spf13.com/), a much more comprehensive suite of
vim settings.
