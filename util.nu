# update the env-var used to display the current directory
# This function uses git-repos and the homedir as base if possible
export def-env update_dir [] {
	let git_dir = (do -i { ^git rev-parse --show-toplevel | str trim })
	let-env YASP_DIR = (
		if $git_dir != '' and $git_dir != $env.HOME {
			$env.PWD | path relative-to ($git_dir | path dirname)
		} else if ($env.PWD | str starts-with $env.HOME) {
			$'~/($env.PWD | path relative-to $env.HOME)'
		} else {$env.PWD}  # `path relative-to ''` returns an abs path
		| str trim -r -c '/'
	)
}
