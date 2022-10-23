# Yet Another Shell Prompt

A shell prompt for nushell, packaged for [packer.nu][]

I like starship, but wanted features like nu-overlay infos.

## Features

- [x] directory
	- [x] relative to home, git repo or root
- [x] git branch
- [x] last exit code
- [x] nu overlay name
	- [x] hide based on name

## Configuring it

Due to it being pretty minimal you configure it directly in the source code (for now).

Since changing the source-code messes up `packer.nu`'s updater you should mark the package
as frozen (`freeze: true`) beforehand and update it manually.

The code is located at `$'($env.NU_PACKER_HOME)/start/yasp'`

### The files

- `env.nu` loads it and configures the design
- `util.nu` contains utility functions
- `section.nu` contains functions, which generate the sections of your prompt

## Known Bugs

- registering a `env.PWD` hook is buggy, therefore it currently updates everything after every command.


[packer.nu]: https://github.com/jan9103/packer.nu
