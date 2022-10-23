# update the env-var used to display the current directory
# This function uses git-repos and the homedir as base if possible
export def-env update_dir [] {
	let git_dir = (
		git rev-parse --absolute-git-dir
		| complete
	)
	let-env YASP_DIR = (
		if (
			$git_dir.exit_code == 0
			&& ($git_dir.stdout | path dirname) != $env.HOME
		) {
			$env.PWD | path relative-to (
				# foo/.git -> '..' foo -> ''     .. -> 'foo'
				$git_dir.stdout | path dirname | path dirname
			)
		} else if ($env.PWD | str starts-with $env.HOME) {
			$'~/($env.PWD | path relative-to $env.HOME)'
		} else {$env.PWD}  # `path relative-to ''` returns an abs path
		| str trim -r -c '/'
	)
}
