# My Vim8 setup

This is my Vim8 setup. Why Vim8? Because since the version 8 of Vim, we can let go of all
the Pathogen and other "Plug" extensions.


The main configuration is in `vimrc`, as usual.

## The plugins

All the plugins I use are installed as git submodules. I'm not really done cleaning up
things yet, but following the Vim documentation, plugins need to be in
`~/.vim/pack/<something>/start` or `~/.vim/pack/<something>/opt`. I'm not sure about the
"opt" thing. I mostly use "start".

Anyway, `<something>` can be anything you want.


### Themes

I keep my colorschemes in `~/.vim/pack/colorschemes/start` and other plugins (for now) in
`/.vim/pack/judu/start`. I aim at making things a bit tidier, but for now that's it!

### How to setup?

Once you have cloned this repo as ~/.vim, go there and run `git submodule update --init
--recursive`.

If you want to update everything: `git submodule update --recursive --remote`.


## I'm a Frenchy, sue me

If you clone this repository, beware of the vimrc.bepo that is sourced by vimrc.
It will change all the mapping to match something more usable by a bépo user like me.


