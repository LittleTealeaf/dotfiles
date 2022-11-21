local db = require("dashboard")

db.custom_header = {
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝'
}

db.custom_center = {
  {
    icon="ﮮ ",
    desc="Update Plugins",
    action="PackerSync"
  },
  {
    icon=" ",
    desc="Find File",
    action="Telescope find_files"
  },
  {
    icon=" ",
    desc="File Browser",
    action="Telescope file_browser"
  },
	{
		icon=" ",
		desc="Open dotfile configuration",
		action="cd $DOT_FILES"
	}
}

db.hide_statusline = false
db.hide_tabline = false
