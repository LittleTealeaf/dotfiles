local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')


dashboard.section.header.val = {
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



alpha.setup(dashboard.opts)
