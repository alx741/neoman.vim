# NEOMAN

read manpages faster than superman!

##Features
- Manpage autocompletion
- Open manpages whose section is not just a number
- Much more intuitive behavior than the builtin manpage plugin
- Open in a split/vsplit/tabe
- Open from inside a neovim terminal!
- Jump to manpages in specific sections through the manpage links

##Usage

###Command
The command is as follows:

```vim
Neoman[!] [{sect}] {page}[({sect})]
```

Several ways to use it, probably easier to explain with a few examples.

```vim
Neoman printf
Neoman 3 printf
Neoman printf(3)
```

The third way allows for jumping to manpage links with `<c-]>` or if you set the following in your init.vim/vimrc you can also use `K`

```vim
set keywordprg=:Neoman
```

By default if a neoman window is already open, it switches to that, if you would not like it to switch but rather open in the current window, use the bang.
Or set `g:neoman\_current\_window` in which case the behaviors are swapped.

### Splits
Want to split/vsplit/tabe? Pretty simple.

```vim
vsplit|Neoman 3 printf
```

You can very easily make that a custom command or mapping.

### Command line integration

####Neovim
You will need [nvr](https://github.com/mhinz/neovim-remote)

Add the following functions to your `.zshrc`/`.bashrc`

```zsh
_nman() {
	if [[ "$@" == "" ]]; then
		print "What manual page do you want?"
		return
	fi
	/usr/bin/man "$@" > /dev/null 2>&1
	if [[ "$?" != "0" ]]; then
		print "No manual entry for $*"
		return
	fi
	if [ -z $NVIM_LISTEN_ADDRESS ]; then
		/usr/bin/env nvim -c $cmd
	else
		nvr --remote-send "<c-n>" -c $cmd
	fi
}
nman() {
	cmd="Neoman $*"
	_nman "$@"
}
nman!() {
	cmd="Neoman! $*"
	_nman "$@"
}
```

####Vim

```zsh
_nman() {
	if [[ "$@" == "" ]]; then
		print "What manual page do you want?"
		return
	fi
	/usr/bin/man "$@" > /dev/null 2>&1
	if [[ "$?" != "0" ]]; then
		print "No manual entry for $*"
		return
	fi
	vim -c $cmd
}
nman() {
	cmd="Neoman $*"
	_nman "$@"
}
nman!() {
	cmd="Neoman! $*"
	_nman "$@"
}
```

####Autocomplete
#####zsh
```zsh
compdef nman="man"
compdef nman!="man"
```

#####bash
```bash
complete -o default -o nospace -F _man nman
complete -o default -o nospace -F _man nman!
```

You can use `nman` to open the manpages and `nvim!` works the same way as `:Neovim!`.

I've really only tested this in zsh, if you have any problems with bash and fix them please send a PR!

### Settings
Only setting is `g:neoman\_current\_window`. This is explained above in the [command](#command) section.

TODO:
-----
- [ ] Mimic the man command with more than 1 manpage
