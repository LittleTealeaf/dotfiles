function fzf_git_project
	echo ~/git/$(ls ~/git/ | fzf --preview='ls -l ~/git/{}' --header-first --header="$argv[1]" $FZF_DEFAULT_OPTS)
end
