function cdg
	set -f val $(fzf_git_project "cd to git project")

	if test -n "$val"
		cd $val
	end
end
