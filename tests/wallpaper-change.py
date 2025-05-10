import os
import re

config_path = os.path.expanduser('~/.config/i3/config')
new_wallpaper = '~/Pictures/Wallpapers/nord_buildings.png'

pattern = re.compile(r'^(exec_always\s+--no-startup-id\s+feh\s+--bg-scale\s+)(\S+)', re.IGNORECASE)

with open(config_path, 'r') as file:
    lines = file.readlines()

updated_lines = []
for line in lines:
    match = pattern.match(line.strip())
    if match:
        new_line = match.group(1) + new_wallpaper + '\n'
        updated_lines.append(new_line)
    else:
        updated_lines.append(line)

with open(config_path, 'w') as file:
    file.writelines(updated_lines)
