#!/usr/bin/env python3

import sys
import tomllib
import tomli_w
from pathlib import Path

user_path = Path.home() / ".config/theom/config.toml"
default_path = Path("/usr/share/theom/config/theom/config.toml")

def load_toml(path):
    with open(path, "rb") as f:
        return tomllib.load(f)

def save_toml(path, data):
    with open(path, "wb") as f:
        f.write(tomli_w.dumps(data).encode("utf-8"))

def merge(user, default):
    for k, v in default.items():
        if k not in user:
            user[k] = v
        elif isinstance(v, dict) and isinstance(user[k], dict):
            merge(user[k], v)

user_cfg = load_toml(user_path)
default_cfg = load_toml(default_path)

merge(user_cfg, default_cfg)
save_toml(user_path, user_cfg)

print("Config updated with missing keys.")
