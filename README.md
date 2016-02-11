# neoman

Read manpages faster than superman!

![neoman in action](https://media.giphy.com/media/xT0BKrEeXPeKVMgb84/giphy.gif)

## Features
- Manpage autocompletion
- Open manpages whose section is not just a number
- Much more intuitive behavior than the builtin manpage plugin
- Open in a split/vsplit/tabe
- Open from inside a neovim terminal!
- Jump to manpages in specific sections through the manpage links

## Install
Any plugin manager should work fine.

```vim
Plug 'nhooyr/neoman.vim' "vim-plug
```

## Usage
### Command
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

Inside a manpage, press `<c-]>` on a manpage link to jump to the manpage. Or you can set the following in your `init.vim`/`.vimrc` and use `K` instead.

```vim
set keywordprg=:Neoman
```

By default if a neoman window is already open, it will be switched to, if you would like it to open in the current window, use the bang.  
Or set `g:neoman_current_window` in which case the behaviors are swapped.

### Splits
Want to split/vsplit/tabe? Pretty simple.

```vim
vsplit | Neoman! 3 printf
```

You can very easily make that a custom command or mapping.

### Command line integration

#### Neovim
You will need [nvr](https://github.com/mhinz/neovim-remote) for the super cool neovim terminal integration.

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
	if [[ -z $NVIM_LISTEN_ADDRESS ]]; then
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

#### Vim
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

#### Autocomplete
##### zsh
```zsh
compdef nman="man"
compdef nman!="man"
```

##### bash
```bash
complete -o default -o nospace -F _man nman
complete -o default -o nospace -F _man nman!
```

Use `nman`/`nman!` to open the manpages. `nman!` works the same way as `:Neovim!`.

I've really only tested this with zsh, if you have any problems with bash and fix them please send a PR!

### Settings
Only setting is `g:neoman_current_window`. This is explained above in the [command](#command) section.

TODO:
-----
- [ ] Vim docs
