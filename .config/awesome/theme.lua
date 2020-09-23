local os, math, string = os, math, string

local theme                                     = {}

theme.dir                                       = "/home/dubai/.config/awesome/theme"
theme.wallpaper                                 = "/home/dubai/Wallpapers/current.png"
theme.font = "Hack 10"
theme.font_smaller = "Hack 8"
theme.taglist_font                              = "Hack 10"
theme.fg_normal                                 = "#e4e4e4"
theme.fg_focus                                  = "#428bca"
theme.fg_urgent                                 = "#C83F11"
theme.bg_normal                                 = "#222222"
theme.bg_focus                                  = "#ffbf00"
theme.bg_urgent                                 = "#3F3F3F"
theme.taglist_fg_focus                          = "#232323"
theme.taglist_fg_empty                          = "#e4e4e4"
theme.taglist_bg_occupied                       = "#785A00"
theme.taglist_bg_urgent                         = "#f8173e"
theme.taglist_fg_urgent                         = "#232323"
theme.taglist_fg_occupied                       = "#232323"
theme.tasklist_bg_focus                         = "#232323"
theme.tasklist_fg_normal                        = "#888888"
theme.tasklist_fg_focus                         = "#e4e4e4"
theme.tasklist_bg_urgent                        = "#f8173e"
theme.border_width                              = 1
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#6F6F6F"
theme.border_marked                             = "#CC9393"

theme.titlebar_bg_focus                         = "#3F3F3F"
theme.titlebar_bg_normal                        = "#3F3F3F"
theme.titlebar_bg_focus                         = "#262626"
theme.titlebar_bg_normal                        = "#222222"
theme.titlebar_fg_focus                         = "#888888"

theme.menu_height                               = 16
theme.menu_width                                = 140

theme.notification_font                         = "Hack 12"
theme.notification_bg                           = "#5cb85c"
theme.notification_fg                           = "#232323"
theme.notification_border_width                 = 0
theme.notification_border_color                 = theme.bg_normal
theme.notification_opacity                      = 1
theme.notification_margin                       = 30
theme.warning                                   = theme.dir .. "/icons/status/warning.png"
--theme.notification_width                        = 300
--theme.notification_height                       = 200

theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"

--theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
-- Layout icons
theme.layout_tile                               = theme.dir .. "/icons/layouts/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/layouts/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/layouts/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/layouts/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/layouts/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/layouts/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/layouts/spiral.png"
theme.layout_centerwork                         = theme.dir .. "/icons/layouts/centerwork.png"
theme.layout_dwindle                            = theme.dir .. "/icons/layouts/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/layouts/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/layouts/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/layouts/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/layouts/floating.png"

-- Widget icons
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_medium                     = theme.dir .. "/icons/battery_medium.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_battery_no                         = theme.dir .. "/icons/battery_no.png"

theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/ssd.png"
theme.widget_clock                              = theme.dir .. "/icons/clock.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_music_pause                        = theme.dir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons/stop.png"

theme.widget_vol                                = theme.dir .. "/icons/vol.svg"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.svg"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.svg"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.svg"

theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.widget_task                               = theme.dir .. "/icons/task.png"
theme.widget_scissors                           = theme.dir .. "/icons/scissors.png"
theme.batcolor                                  = "#5cb85c"

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 7

theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"

theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.svg"

theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.svg"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.svg"

theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.svg"

theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.svg"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.svg"

theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.svg"

theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"

theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

-- Application icons
theme.chrome                                    = theme.dir .. "/icons/apps/chrome.png"
theme.webstorm                                  = theme.dir .. "/icons/apps/webstorm.png"
theme.idea                                      = theme.dir .. "/icons/apps/idea.png"
theme.pycharm                                   = theme.dir .. "/icons/apps/pycharm.png"


return theme

