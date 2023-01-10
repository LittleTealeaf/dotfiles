local db = require("dashboard")
db.custom_header = {
    '',
    '  _   _        __      ___           ',
    ' | \\ | |       \\ \\    / (_)          ',
    ' |  \\| | ___  __\\ \\  / / _ _ __ ___  ',
    ' | . ` |/ _ \\/ _ \\ \\/ / | | \'_ ` _ \\ ',
    ' | |\\  |  __/ (_) \\  /  | | | | | | |',
    ' |_| \\_|\\___|\\___/ \\/   |_|_| |_| |_|',
    '                                     ',
    '',
}
db.custom_center = {
	{
		icon=" ",
		desc="Open Session",
		action="SearchSession"
	},
	{
		icon=" ",
		desc="Find file",
		action="Telescope find_files"
	},
	{
		icon="ﮮ ",
		desc="Update Plugins",
		action="PackerSync"
	}
}
