local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Custom Vars
local appBgPanelColor = 'hsl(231 15% 14%)'
local appBgColor = 'hsl(231 15% 18%)'
local appFgColor = 'hsl(231 100% 100%)'
local appFontSize = 18

config.default_cwd = '/Users/grimlink/Developer'
config.default_cursor_style = 'BlinkingBar'

config.font = wezterm.font 'Menlo'
config.font_size = appFontSize

config.color_scheme = 'Snazzy (Gogh)'
config.colors = {
    tab_bar = {
        active_tab = { fg_color = appFgColor, bg_color = appBgColor }
    }
}

config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 32

config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.window_close_confirmation = 'NeverPrompt'
config.window_frame = { font_size = appFontSize }
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '1.5cell',
  bottom = '1cell',
}

config.command_palette_font_size = appFontSize
config.command_palette_bg_color = appBgPanelColor
config.command_palette_fg_color = appFgColor

config.keys = {
    {
        key = 'd',
        mods = 'SUPER',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    {
        key = 'd',
        mods = 'SUPER|SHIFT',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        key = 'LeftArrow',
        mods = 'OPT',
        action = act.SendKey { key = 'b', mods = 'ALT' },
    },
    {
        key = 'RightArrow',
        mods = 'OPT',
        action = act.SendKey { key = 'f', mods = 'ALT' }
    },
    {
        key = 'LeftArrow',
        mods = 'CMD',
        action = act.SendKey { key = "a", mods = "CTRL" }
    },
    {
        key = 'RightArrow',
        mods = 'CMD',
        action = act.SendKey { key = "e", mods = "CTRL" }
    },
    {
        key = "Backspace",
        mods = "CMD",
        action = act.SendKey { key = "u", mods = "CTRL" }
    },
    {
        key = 'p',
        mods = 'CMD|SHIFT',
        action = act.ActivateCommandPalette
    },
}

return config
