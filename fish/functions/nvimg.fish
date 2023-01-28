function nvimg
	set -f val $(fzf_git_project "Open git project in Neovim")

	if test -n "$val"
		set -f NVIMG_BASE_DIR $(pwd)
		cd $val
		nvim
		cd $NVIMG_BASE_DIR
	end
end
