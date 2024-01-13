---------------------------
-- Awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = "~/.config/awesome/themes/" -- gfs.get_themes_dir()

local theme = {}

-- Default variables
--# string	The default font.
theme.font = "NotoSans NFP SemCond SemiBold 9"
--# string or gears.surface	The wallpaper path.
theme.wallpaper = themes_path .. "default/background.png"

-- arcchart \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

--# color	The progressbar border background color.
theme.arcchart_border_color = nil
--# color	The progressbar foreground color.
theme.arcchart_color = nil
--# number	The progressbar border width.
theme.arcchart_border_width = nil
--# table or number	The padding between the outline and the progressbar.	
theme.arcchart_paddings = nil
--# number	The arc thickness.
theme.arcchart_thickness = nil
--# boolean	If the chart has rounded edges.
theme.arcchart_rounded_edge = nil
--# gears.color	The radial background.
theme.arcchart_bg = nil

-- ////////////////////////////////////////////////////////////////////////////

-- bg \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The default background color.
theme.bg_normal = "#303A57"
--# color	The default focused element background color.
theme.bg_focus = "#5166A5"
--# color	The default urgent element background color.
theme.bg_urgent = "#ff0000"
--# color	The default minimized element background color.
theme.bg_minimize = "#89365433"
-- ////////////////////////////////////////////////////////////////////////////

-- border \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The marked clients border color. Note that only solid colors are supported
theme.border_marked = "#91231c"
--# number	The client border width.
theme.border_width = dpi(3)
--# color	The default clients border color. Note that only solid colors are supported.
theme.border_normal = "#303A57"
--# color	The focused client border color. Note that only solid colors are supported.
theme.border_focus = "#5166A5"
-- ////////////////////////////////////////////////////////////////////////////

-- calendar \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# x	
theme.calendar_style = nil
--# string	The calendar font.
theme.calendar_font = nil
--# number	The calendar spacing.
theme.calendar_spacing = nil
--# boolean	Display the calendar week numbers.
theme.calendar_week_numbers = nil
--# boolean	Start the week on Sunday.
theme.calendar_start_sunday = nil
--# boolean	Format the weekdays with three characters instead of two.
theme.calendar_long_weekdays = nil
-- ////////////////////////////////////////////////////////////////////////////

-- checkbox \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# number	The outer (unchecked area) border width.
theme.checkbox_border_width = nil
--# color	The outer (unchecked area) background color, pattern or gradient.
theme.checkbox_bg = nil
--# color	The outer (unchecked area) border color.
theme.checkbox_border_color = nil
--# color	The checked part border color.
theme.checkbox_check_border_color = nil
--# number	The checked part border width.
theme.checkbox_check_border_width = nil
--# color	The checked part filling color.
theme.checkbox_check_color = nil
--# shape	The outer (unchecked area) shape.
theme.checkbox_shape = nil
--# shape	The checked part shape. If none is set, then the shape property will be used.
theme.checkbox_check_shape = nil
--# number	The padding between the outline and the progressbar.
theme.checkbox_paddings = nil
--# color	The checkbox color. This will be used for the unchecked part border color and the checked part filling color. Note that check_color and border_color have priority over this property.
theme.checkbox_color = nil
-- ////////////////////////////////////////////////////////////////////////////

-- column \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# integer	Set the number of columns.
theme.column_count = nil
-- ////////////////////////////////////////////////////////////////////////////

-- cursor \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# string	The resize cursor name.
theme.cursor_mouse_resize = nil
--# string	The move cursor name.
theme.cursor_mouse_move = nil
-- ////////////////////////////////////////////////////////////////////////////

-- enable \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# x	
theme.enable_spawn_cursor = nil
-- ////////////////////////////////////////////////////////////////////////////

-- fg \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The default focused element foreground (text) color.
theme.fg_normal = "#aaaaaa"
--# color	The default focused element foreground (text) color.
theme.fg_focus = "#ffffff"
--# color	The default urgent element foreground (text) color.
theme.fg_urgent = "#ffffff"
--# color	The default minimized element foreground (text) color.
theme.fg_minimize = "#ffffff"
-- ////////////////////////////////////////////////////////////////////////////

-- fullscreen \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# boolean	Hide the border on fullscreen client.
theme.fullscreen_hide_border = nil
-- ////////////////////////////////////////////////////////////////////////////

-- gap \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# boolean	Enable gaps for a single client.
theme.gap_single_client = nil
-- ////////////////////////////////////////////////////////////////////////////

-- graph \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The graph background color.
theme.graph_bg = nil
--# color	The graph foreground color.
theme.graph_fg = nil
--# color	The graph border color.
theme.graph_border_color = nil
-- ////////////////////////////////////////////////////////////////////////////

-- hotkeys \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	Hotkeys widget background color.
theme.hotkeys_bg = nil
--# color	Hotkeys widget foreground color.
theme.hotkeys_fg = "#FFFFFF"
--# integer	Hotkeys widget border width.
theme.hotkeys_border_width = nil
--# color	Hotkeys widget border color.
theme.hotkeys_border_color = nil
--# shape	Hotkeys widget shape.
theme.hotkeys_shape = nil
--# color	Foreground color used for hotkey modifiers (Ctrl, Alt, Super, etc).
theme.hotkeys_modifiers_fg = "#F5A320"
--# color	Background color used for miscellaneous labels of hotkeys widget.
theme.hotkeys_label_bg = nil
--# color	Foreground color used for hotkey groups and other labels.
theme.hotkeys_label_fg = "#F9F9F9"
--# string	Main hotkeys widget font.
theme.hotkeys_font = nil
--# string	Font used for hotkeys' descriptions.
theme.hotkeys_description_font = nil
--# integer	Margin between hotkeys groups.
theme.hotkeys_group_margin = dpi(10)
--# x	
theme.hotkeys_opacity = nil
-- ////////////////////////////////////////////////////////////////////////////

-- icon \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# string	The icon theme name.
theme.icon_theme = nil
-- ////////////////////////////////////////////////////////////////////////////

-- layout \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# surface	The cornernw layout layoutbox icon.
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
--# surface	The cornerne layout layoutbox icon.
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
--# surface	The cornersw layout layoutbox icon.
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
--# surface	The cornerse layout layoutbox icon.
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"
--# surface	The fairh layout layoutbox icon.
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
--# surface	The fairv layout layoutbox icon.
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
--# surface	The floating layout layoutbox icon.
theme.layout_floating = themes_path.."default/layouts/floatingw.png"
--# surface	The magnifier layout layoutbox icon.
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
--# surface	The max layout layoutbox icon.
theme.layout_max = themes_path.."default/layouts/maxw.png"
--# surface	The fullscreen layout layoutbox icon.
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
--# surface	The spiral layout layoutbox icon.
theme.layout_spiral = themes_path.."default/layouts/spiralw.png"
--# surface	The dwindle layout layoutbox icon.
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
--# surface	The tile layout layoutbox icon.
theme.layout_tile = themes_path.."default/layouts/tilew.png"
--# surface	The tile top layout layoutbox icon.
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
--# surface	The tile bottom layout layoutbox icon.
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
--# surface	The tile left layout layoutbox icon.
theme.layout_tileleft = themes_path.."default/layouts/tileleftw.png"
-- ////////////////////////////////////////////////////////////////////////////

-- layoutlist \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The default foreground (text) color.
theme.layoutlist_fg_normal = nil
--# color	The default background color.
theme.layoutlist_bg_normal = nil
--# color	The selected layout foreground (text) color.
theme.layoutlist_fg_selected = nil
--# color	The selected layout background color.
theme.layoutlist_bg_selected = nil
--# boolean	Disable the layout icons (only show the name label).
theme.layoutlist_disable_icon = nil
--# boolean	Disable the layout name label (only show the icon).
theme.layoutlist_disable_name = nil
--# string	The layoutlist font.
theme.layoutlist_font = nil
--# string	The selected layout alignment.
theme.layoutlist_align = nil
--# string	The selected layout title font.
theme.layoutlist_font_selected = nil
--# number	The space between the layouts.
theme.layoutlist_spacing = nil
--# shape	The default layoutlist elements shape.
theme.layoutlist_shape = nil
--# number	The default layoutlist elements border width.
theme.layoutlist_shape_border_width = nil
--# color	The default layoutlist elements border color.
theme.layoutlist_shape_border_color = nil
--# shape	The selected layout shape.
theme.layoutlist_shape_selected = nil
--# number	The selected layout border width.
theme.layoutlist_shape_border_width_selected = nil
--# color	The selected layout border color.
theme.layoutlist_shape_border_color_selected = nil
-- ////////////////////////////////////////////////////////////////////////////

-- master \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# number[0,1]	The tag master width factor. The master width factor is one of the 5 main properties used to configure the layout. Each layout interpret (or ignore) this property differenly.
theme.master_width_factor = nil
--# string	The default fill policy. Possible values: expand: Take all the space; master_width_factor: Only take the ratio defined by the master_width_factor
theme.master_fill_policy = nil
--# number	The default number of master windows.
theme.master_count = nil
-- ////////////////////////////////////////////////////////////////////////////

-- maximized \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# boolean	Honor the screen padding when maximizing.
theme.maximized_honor_padding = nil
--# boolean	Hide the border on fullscreen clients.
theme.maximized_hide_border = nil
-- ////////////////////////////////////////////////////////////////////////////

-- menu \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# string	The icon used for sub-menus.
theme.menu_submenu_icon = themes_path.."default/submenu.png"
--# string	The menu text font.
 theme.menu_font = nil
--# number	The item height.
theme.menu_height = dpi(17)
--# number	The item width.
theme.menu_width = dpi(100)
--# color	The menu item border color.
theme.menu_border_color = nil
--# number	The menu item border width.
theme.menu_border_width = nil
--# color	The default focused item foreground (text) color.
theme.menu_fg_focus = nil
--# color	The default focused item background color.
theme.menu_bg_focus = nil
--# color	The default foreground (text) color.
theme.menu_fg_normal = nil
--# color	The default background color.
theme.menu_bg_normal = nil
--# string	The default sub-menu indicator if no menu_submenu_icon is provided.
theme.menu_submenu = nil
-- ////////////////////////////////////////////////////////////////////////////

-- awesome \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# x	The Awesome icon path.
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)
-- ////////////////////////////////////////////////////////////////////////////

-- menubar \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	Menubar normal text color.
theme.menubar_fg_normal = nil
--# color	Menubar normal background color.
theme.menubar_bg_normal = nil
--# number	Menubar border width.
theme.menubar_border_width = nil
--# color	Menubar border color.
theme.menubar_border_color = nil
--# color	Menubar selected item text color.
theme.menubar_fg_normal = nil
--# color	Menubar selected item background color.
theme.menubar_bg_normal = nil
-- ////////////////////////////////////////////////////////////////////////////

-- notification \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# string	Notifications font.
theme.notification_font = nil
--# color	Notifications background color.
theme.notification_bg = nil
--# color	Notifications foreground color.
theme.notification_fg = nil
--# int	Notifications border width.
theme.notification_border_width = nil
--# color	Notifications border color.
theme.notification_border_color = nil
--# shape	Notifications shape.
theme.notification_shape = nil
--# int	Notifications opacity.
theme.notification_opacity = nil
--# int	Notifications margin.
theme.notification_margin = nil
--# int	Notifications width.
theme.notification_width = nil
--# int	Notifications height.
theme.notification_height = nil
--# int	Notifications maximum width.
theme.notification_max_width = nil
--# int	Notifications maximum height.
theme.notification_max_height = nil
--# int	Notifications icon size.
theme.notification_icon_size = nil
-- ////////////////////////////////////////////////////////////////////////////

-- piechart \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The border color. If none is set, it will use current foreground (text) color.
theme.piechart_border_color = nil
--# number	The pie elements border width.
theme.piechart_border_width = nil
--# table of colors	The pie chart colors. If no color is set, only the border will be drawn. If less colors than required are set, colors will be re-used in order.
theme.piechart_colors = nil
-- ////////////////////////////////////////////////////////////////////////////

-- progressbar \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The progressbar background color.
theme.progressbar_bg = nil
--# color	The progressbar foreground color.
theme.progressbar_fg = nil
--# shape	The progressbar shape.
theme.progressbar_shape = nil
--# color	The progressbar border color.
theme.progressbar_border_color = nil
--# number	The progressbar outer border width.
theme.progressbar_border_width = nil
--# shape	The progressbar inner shape.
theme.progressbar_bar_shape = nil
--# number	The progressbar bar border width.
theme.progressbar_bar_border_width = nil
--# color	The progressbar bar border color.
theme.progressbar_bar_border_color = nil
--# table of numbers [top,bottom,left,right]	The progressbar margins. Note that if the clip is disabled, this allows the background to be smaller than the bar.
theme.progressbar_margins = nil
--# table of numbers [top,bottom,left,right]	The progressbar padding. Note that if the clip is disabled, this allows the bar to be taller than the background.
theme.progressbar_paddings = nil
-- ////////////////////////////////////////////////////////////////////////////

-- prompt \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The prompt cursor foreground color.
theme.prompt_fg_cursor = nil
--# color	The prompt cursor background color.
theme.prompt_bg_cursor = nil
--# string	The prompt text font.
theme.prompt_font = nil
--# color	The prompt foreground color.
theme.prompt_fg = nil
--# color	The prompt background color.
theme.prompt_bg = nil
-- ////////////////////////////////////////////////////////////////////////////

-- radialprogressbar \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The progressbar border background color.
theme.radialprogressbar_border_color = nil
--# color	The progressbar foreground color.
theme.radialprogressbar_color = nil
--# number	The progressbar border width.
theme.radialprogressbar_border_width = nil
--# table of numbers[top,bottom,left,right]	The padding between the outline and the progressbar.
theme.radialprogressbar_paddings = nil
-- ////////////////////////////////////////////////////////////////////////////

-- separator \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# number	The separator thickness.
theme.separator_thickness = nil
--# color	The separator border color.
theme.separator_border_color = nil
--# number	The separator border width.
theme.separator_border_width = nil
--# number[0,1]	The relative percentage covered by the bar.
theme.separator_span_ratio = nil
--# color	The separator’s color.
theme.separator_color = nil
--# shape	The separator’s shape.
theme.separator_shape = nil
-- ////////////////////////////////////////////////////////////////////////////

-- slider \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# number	The bar (background) border width.
theme.slider_bar_border_width = nil
--# color	The bar (background) border color.
theme.slider_bar_border_color = nil
--# color	The handle border_color.
theme.slider_handle_border_color = nil
--# number	The handle border width.
theme.slider_handle_border_width = nil
--# number	The handle width.
theme.slider_handle_width = nil
--# x	
theme.slider_handle_color = nil
--# shape	The handle shape.
theme.slider_handle_shape = nil
--# shape	The bar (background) shape.
theme.slider_bar_shape = nil
--# number	The bar (background) height.
theme.slider_bar_height = nil
--# table of numbers [top,bottom,left,right]	The bar (background) margins.
theme.slider_bar_margins = nil
--# table of numbers [top,bottom,left,right]	The slider handle margins.
theme.slider_handle_margins = nil
--# color	The bar (background) color.
theme.slider_bar_color = nil
-- ////////////////////////////////////////////////////////////////////////////

-- snap \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The snap outline background color. A color, string, gradient or pattern.
theme.snap_bg = nil
--# integer	The snap outline width.
theme.snap_border_width = nil
--# shape	The snap outline shape.
theme.snap_shape = nil
-- ////////////////////////////////////////////////////////////////////////////

-- snapper \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# number	The gap between snapped contents.
theme.snapper_gap = nil
-- ////////////////////////////////////////////////////////////////////////////

-- systray \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# string	The systray background color.
theme.bg_systray = theme.bg_normal
--# integer	The maximum number of rows for systray icons.
theme.systray_max_rows = nil
--# integer	The systray icon spacing.
theme.systray_icon_spacing = nil
-- ////////////////////////////////////////////////////////////////////////////

-- taglist \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
local taglist_square_size = dpi(6)
--# color	The tag list main foreground (text) color.
theme.taglist_fg_focus = nil
--# color	The tag list main background color.
theme.taglist_bg_focus = nil
--# color	The tag list urgent elements foreground (text) color.
theme.taglist_fg_urgent = nil
--# color	The tag list urgent elements background color.
theme.taglist_bg_urgent = nil
--# color	The tag list occupied elements background color.
theme.taglist_bg_occupied = nil
--# color	The tag list occupied elements foreground (text) color.
theme.taglist_fg_occupied = nil
--# color	The tag list empty elements background color.
theme.taglist_bg_empty = nil
--# color	The tag list empty elements foreground (text) color.
theme.taglist_fg_empty = nil
--# color	The tag list volatile elements background color.
theme.taglist_bg_volatile = nil
--# color	The tag list volatile elements foreground (text) color.
theme.taglist_fg_volatile = nil
--# surface	The selected elements background image.
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
--# surface	The unselected elements background image.
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)
--# surface	The selected empty elements background image.
theme.taglist_squares_sel_empty = nil
--# surface	The unselected empty elements background image.
theme.taglist_squares_unsel_empty = nil
--# boolean	If the background images can be resized.
theme.taglist_squares_resize = nil
--# booleal	Do not display the tag icons, even if they are set.
theme.taglist_disable_icon = nil
--# string	The taglist font.
theme.taglist_font = nil
--# number	The space between the taglist elements.
theme.taglist_spacing = nil
--# shape	The main shape used for the elements. This will be the fallback for state specific shapes. To get a shape for the whole taglist, use wibox.container.background.
theme.taglist_shape = nil
--# number	The shape elements border width.
theme.taglist_shape_border_width = nil
--#  color	The elements shape border color.
theme.taglist_shape_border_color = nil
--# shape	The shape used for the empty elements.
theme.taglist_shape_empty = nil
--# number	The shape used for the empty elements border width.
theme.taglist_shape_border_width_empty = nil
--# color	The empty elements shape border color.
theme.taglist_shape_border_color_empty = nil
--# shape	The shape used for the selected elements.
theme.taglist_shape_focus = nil
--# number	The shape used for the selected elements border width.
theme.taglist_shape_border_width_focus = nil
--# color	The selected elements shape border color.
theme.taglist_shape_border_color_focus = nil
--# shape	The shape used for the urgent elements.
theme.taglist_shape_urgent = nil
--# number	The shape used for the urgent elements border width.
theme.taglist_shape_border_width_urgent = nil
--# color	The urgents elements shape border color.
theme.taglist_shape_border_color_urgent = nil
--# shape	The shape used for the volatile elements.
theme.taglist_shape_volatile = nil
--# number	The shape used for the volatile elements border width.
theme.taglist_shape_border_width_volatile = nil
--# color	The volatile elements shape border color.
theme.taglist_shape_border_color_volatile = nil
-- ////////////////////////////////////////////////////////////////////////////

-- tasklist \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The default foreground (text) color.
theme.tasklist_fg_normal = nil
--# color	The default background color.
theme.tasklist_bg_normal = nil
--# color	The focused client foreground (text) color.
theme.tasklist_fg_focus = nil
--# color	The focused client background color.
theme.tasklist_bg_focus = nil
--# color	The urgent clients foreground (text) color.
theme.tasklist_fg_urgent = nil
--# color	The urgent clients background color.
theme.tasklist_bg_urgent = nil
--# color	The minimized clients foreground (text) color.
theme.tasklist_fg_minimize = nil
--# color	The minimized clients background color.
theme.tasklist_bg_minimize = nil
--# string	The elements default background image.
theme.tasklist_bg_image_normal = nil
--# string	The focused client background image.
theme.tasklist_bg_image_focus = nil
--# string	The urgent clients background image.
theme.tasklist_bg_image_urgent = nil
--# string	The minimized clients background image.
theme.tasklist_bg_image_minimize = nil
--# boolean	Disable the tasklist client icons.
theme.tasklist_disable_icon = nil
--# boolean	Disable the tasklist client titles.
theme.tasklist_disable_task_name = nil
--# string	Disable the extra tasklist client property notification icons.
theme.tasklist_plain_task_name = nil
--# string	The tasklist font.
theme.tasklist_font = nil
--# string	The focused client alignment.
theme.tasklist_align = nil
--# string	The focused client title alignment.
theme.tasklist_font_focus = nil
--# string	The minimized clients font.
theme.tasklist_font_minimized = nil
--# string	The urgent clients font.
theme.tasklist_font_urgent = nil
--# numberx	The space between the tasklist elements.
theme.tasklist_spacing = nil
--# shape	The default tasklist elements shape.
theme.tasklist_shape = nil
--# number	The default tasklist elements border width.
theme.tasklist_shape_border_width = nil
--# color	The default tasklist elements border color.
theme.tasklist_shape_border_color = nil
--# shape	The focused client shape.
theme.tasklist_shape_focus = nil
--# number	The focused client border width.
theme.tasklist_shape_border_width_focus = nil
--# color	The focused client border color.
theme.tasklist_shape_border_color_focus = nil
--# shape	The minimized clients shape.
theme.tasklist_shape_minimized = nil
--# number	The minimized clients border width.
theme.tasklist_shape_border_width_minimized = nil
--# color	The minimized clients border color.
theme.tasklist_shape_border_color_minimized = nil
--# shape	The urgent clients shape.
theme.tasklist_shape_urgent = nil
--# number	The urgent clients border width.
theme.tasklist_shape_border_width_urgent = nil
--# color	The urgent clients border color.
theme.tasklist_shape_border_color_urgent = nil
-- ////////////////////////////////////////////////////////////////////////////

-- titlebar \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The titlebar foreground (text) color.
theme.titlebar_fg_normal = nil
--# color	The titlebar background color.
theme.titlebar_bg_normal = nil
--# surface	The titlebar background image image.
theme.titlebar_bgimage_normal = nil
--# color	The titlebar foreground (text) color.
theme.titlebar_fg = nil
--# color	The titlebar background color.
theme.titlebar_bg = nil
--# surface	The titlebar background image image.
theme.titlebar_bgimage = nil
--# color	The focused titlebar foreground (text) color.
theme.titlebar_fg_focus = nil
--# color	The focused titlebar background color.
theme.titlebar_bg_focus = nil
--# surface	The focused titlebar background image image.
theme.titlebar_bgimage_focus = nil
--# surface	
theme.titlebar_floating_button_normal = nil
--# surface	
theme.titlebar_maximized_button_normal = nil
--# surface	
theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
--# surface	
theme.titlebar_minimize_button_normal_hover = nil
--# surface	
theme.titlebar_minimize_button_normal_press = nil
--# surface	
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
--# surface	
theme.titlebar_close_button_normal_hover = nil
--# surface	
theme.titlebar_close_button_normal_press = nil
--# surface	
theme.titlebar_ontop_button_normal = nil
--# surface	
theme.titlebar_sticky_button_normal = nil
--# surface	
theme.titlebar_floating_button_focus = nil
--# surface	
theme.titlebar_maximized_button_focus = nil
--# surface	
theme.titlebar_minimize_button_focus = themes_path.."default/titlebar/minimize_focus.png"
--# surface	
theme.titlebar_minimize_button_focus_hover = nil
--# surface	
theme.titlebar_minimize_button_focus_press = nil
--# surface	
theme.titlebar_close_button_focus = themes_path.."default/titlebar/close_focus.png"
--# surface	
theme.titlebar_close_button_focus_hover = nil
--# surface	
theme.titlebar_close_button_focus_press = nil
--# surface	
theme.titlebar_ontop_button_focus = nil
--# surface	
theme.titlebar_sticky_button_focus = nil
--# surface	
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
--# surface	
theme.titlebar_floating_button_normal_active_hover = nil
--# surface	
theme.titlebar_floating_button_normal_active_press = nil
--# surface	
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
--# surface	
theme.titlebar_maximized_button_normal_active_hover = nil
--# surface	
theme.titlebar_maximized_button_normal_active_press = nil
--# surface	
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
--# surface	
theme.titlebar_ontop_button_normal_active_hover = nil
--# surface	
theme.titlebar_ontop_button_normal_active_press = nil
--# surface	
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
--# surface	
theme.titlebar_sticky_button_normal_active_hover = nil
--# surface	
theme.titlebar_sticky_button_normal_active_press = nil
--# surface	
theme.titlebar_floating_button_focus_active = themes_path.."default/titlebar/floating_focus_active.png"
--# surface	
theme.titlebar_floating_button_focus_active_hover = nil
--# surface	
theme.titlebar_floating_button_focus_active_press = nil
--# surface	
theme.titlebar_maximized_button_focus_active = themes_path.."default/titlebar/maximized_focus_active.png"
--# surface	
theme.titlebar_maximized_button_focus_active_hover = nil
--# surface	
theme.titlebar_maximized_button_focus_active_press = nil
--# surface	
theme.titlebar_ontop_button_focus_active = themes_path.."default/titlebar/ontop_focus_active.png"
--# surface	
theme.titlebar_ontop_button_focus_active_hover = nil
--# surface	
theme.titlebar_ontop_button_focus_active_press = nil
--# surface	
theme.titlebar_sticky_button_focus_active = themes_path.."default/titlebar/sticky_focus_active.png"
--# surface	
theme.titlebar_sticky_button_focus_active_hover = nil
--# surface	
theme.titlebar_sticky_button_focus_active_press = nil
--# surface	
theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
--# surface	
theme.titlebar_floating_button_normal_inactive_hover = nil
--# surface	
theme.titlebar_floating_button_normal_inactive_press = nil
--# surface	
theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
--# surfacex	
theme.titlebar_maximized_button_normal_inactive_hover = nil
--# surface	
theme.titlebar_maximized_button_normal_inactive_press = nil
--# surface	
theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
--# surface	
theme.titlebar_ontop_button_normal_inactive_hover = nil
--# surface	
theme.titlebar_ontop_button_normal_inactive_press = nil
--# surface	
theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
--# surface	
theme.titlebar_sticky_button_normal_inactive_hover = nil
--# surface	
theme.titlebar_sticky_button_normal_inactive_press = nil
--# surface	
theme.titlebar_floating_button_focus_inactive = themes_path.."default/titlebar/floating_focus_inactive.png"
--# surface	
theme.titlebar_floating_button_focus_inactive_hover = nil
--# surface	
theme.titlebar_floating_button_focus_inactive_press = nil
--# surface	
theme.titlebar_maximized_button_focus_inactive = themes_path.."default/titlebar/maximized_focus_inactive.png"
--# surface	
theme.titlebar_maximized_button_focus_inactive_hover = nil
--# surface	
theme.titlebar_maximized_button_focus_inactive_press = nil
--# surface	
theme.titlebar_ontop_button_focus_inactive = themes_path.."default/titlebar/ontop_focus_inactive.png"
--# surface	
theme.titlebar_ontop_button_focus_inactive_hover = nil
--# surface	
theme.titlebar_ontop_button_focus_inactive_press = nil
--# surface	
theme.titlebar_sticky_button_focus_inactive = themes_path.."default/titlebar/sticky_focus_inactive.png"
--# surface	
theme.titlebar_sticky_button_focus_inactive_hover = nil
--# surface	
theme.titlebar_sticky_button_focus_inactive_press = nil
-- ////////////////////////////////////////////////////////////////////////////

-- tooltip \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# color	The tooltip border color.
theme.tooltip_border_color = nil
--# color	The tooltip background color.
theme.tooltip_bg = nil
--# x	
theme.tooltip_bg_color = nil
--# color	The tooltip foregound (text) color.
theme.tooltip_fg = nil
--# x	
theme.tooltip_fg_color = nil
--# string	The tooltip font.
theme.tooltip_font = nil
--# number	The tooltip border width.
theme.tooltip_border_width = nil
--# number	The tooltip opacity.
theme.tooltip_opacity = nil
--# shape	The default tooltip shape. The default shape for all tooltips is a rectangle. However, by setting this variable they can default to rounded rectangle or stretched octogons.
theme.tooltip_shape = nil
--# string	The default tooltip alignment.
theme.tooltip_align = nil
-- ////////////////////////////////////////////////////////////////////////////

-- useless \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# number	The default gap.
theme.useless_gap = dpi(4)
-- ////////////////////////////////////////////////////////////////////////////

-- wibar \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--# boolean	If the wibar needs to be stretched to fill the screen.
theme.wibar_stretch = nil
--# integer	The wibar border width.
theme.wibar_border_width = nil
--# color	The wibar border color.
theme.wibar_border_color = nil
--# boolean	If the wibar is to be on top of other windows.
theme.wibar_ontop = nil
--# cursor	The wibar’s mouse cursor.
theme.wibar_cursor = nil
--# number	The wibar opacity, between 0 and 1.
theme.wibar_opacity = nil
--# string	The window type (desktop, normal, dock, …).
theme.wibar_type = nil
--# integer	The wibar’s width.
theme.wibar_width = nil
--# integer	The wibar’s height.
theme.wibar_height = nil
--# color	The wibar’s background color.
theme.wibar_bg = nil
--# surface	The wibar’s background image.
theme.wibar_bgimage = nil
--# color	The wibar’s foreground (text) color.
theme.wibar_fg = nil
--# shape	The wibar’s shape.
theme.wibar_shape = nil
-- ////////////////////////////////////////////////////////////////////////////

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
