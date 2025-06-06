conky.config = {
    own_window = true,
    update_interval = 1,
    own_window_type = 'override',
    own_window_transparent = true,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    double_buffer = true,
    alignment = 'center',
    gap_x = 0,
    gap_y = -30,
    use_xft = true,
    font = 'FiraCode Nerd Font:bold:italic:size=12',
};

conky.text = [[
Uptime: ${uptime}
]]
