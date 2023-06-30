export-env {
	use util.nu
	use section.nu

	load-env {
		PROMPT_MULTILINE_INDICATOR: ''
		PROMPT_INDICATOR: ''
		PROMPT_COMMAND_RIGHT: {|| ''}
	}

	#util update_dir
	#nuconfig hook append env_change PWD {|old,new|
	#	util update_dir
	#}

	load-env {PROMPT_COMMAND: {||
		util update_dir  # until hooks are fixed..
		[
			' '  # empty line
			([
				(section dir)
				(section git_branch)
				(section nu_overlay)
				(section pyvenv)
			] | compact | str join '')
			([
				$'(ansi ligr)nu '
				(section exit_code)
			] | compact | str join '')
		] | str join (char nl)
	}}
}
