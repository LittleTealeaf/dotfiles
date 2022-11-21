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
		desc="Open Session",
		action="SearchSession"
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
    desc="Update Plugins",
    action="PackerSync"
  }
}

db.hide_statusline = false
db.hide_tabline = false
