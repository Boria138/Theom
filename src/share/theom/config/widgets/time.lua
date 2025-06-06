-- THEOM time widget

conky.config = {
    own_window = true,
    update_interval = 1,
    own_window_type = 'override',
    own_window_transparent = true,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    double_buffer = true,
    alignment = 'top_middle',
    gap_x = 0,
    gap_y = 250,
    -- minimum_width = 200,
    -- minimum_height = 50,
    use_xft = true,
    -- font = 'FiraCode Nerd Font:bold:size=50',
};

conky.text = [[
${alignc}${font FiraCode Nerd Font:bold:size=60}${time %H:%M}${font}
${alignc}${voffset 5}${font FiraCode Nerd Font:size=14}${time %a, %b %d %Y}${font}
]];

