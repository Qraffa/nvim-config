local db = require('dashboard')

db.setup({
  theme = 'hyper',
  config = {
    week_header = {
     enable = true,
    },
  },
})



-- db.custom_header = {
--   "                                                       ",
--   "                                                       ",
--   "                                                       ",
--   " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
--   " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
--   " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
--   " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
--   " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
--   " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
--   "                                                       ",
--   "                                                       ",
--   "                                                       ",
--   "                                                       ",
-- }

-- db.custom_center = {
-- 	{
-- 		icon = '  ',
-- 		desc = 'Find Files                              ',
-- 		-- shortcut = '',
-- 		action = 'Telescope find_files',
-- 	},
-- 	{
-- 		icon = "  ",
--     desc = "Open Nvim config                        ",
--     action = "tabnew $MYVIMRC | tcd %:p:h",
-- 	},
-- 	{
-- 		icon = "  ",
--     desc = "Quit Nvim                               ",
--     action = "qa",
-- 	},
-- }
