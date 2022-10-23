# the current directory
export def dir [] {$'(ansi c)($env.YASP_DIR) '}

# the current git branch
export def git_branch [] {
	let res = (^git branch --show-current | complete)
	if $res.exit_code == 0 {$'(ansi lp)($res.stdout | str trim) '}
}

# the last exit code (if it was != 0)
export def exit_code [] {
	if $env.LAST_EXIT_CODE != 0 {$'(ansi lrb)✖($env.LAST_EXIT_CODE) '}
}

# active nushell overlays
export def nu_overlay [
	hide = ['zero' 'packer_api' 'packer_packages' 'conditional_packages']  # a list of names to exclude
] {
	let list = (overlay list | where not $it in $hide | str join ',')
	if $list != '' {$'(ansi y)($list) '}
}
