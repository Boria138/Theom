conky.config = {
    own_window = true,
    update_interval = 1,
    own_window_type = 'override',
    own_window_transparent = true,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    double_buffer = true,
    alignment = 'bottom_middle',
    gap_x = 5,
    gap_y = 340,
    use_xft = true,
    font = 'FiraCode Nerd Font:bold:italic:size=12',
};

conky.text = [[
Uptime: ${uptime}
]]
