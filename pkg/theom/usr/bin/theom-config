#!/usr/bin/env python3

import sys
import os
import json

def isConfigTrue(value):
    with open(os.path.expanduser("~/.config/.theom/config.json"), "r") as theom_config_path:
        theom_config_string = theom_config_path.read()
        theom_config = json.loads(theom_config_string)
    
    if theom_config.get(str(value)) == True:
        return "True"
    else:
        return "False"

provided_args = sys.argv

if len(provided_args) < 2:
    print("ERROR: no argument found!")
else:
    match provided_args[1]:
        case "compositor":
            print(isConfigTrue("compositioning"))
        case "welcomer":
            print(isConfigTrue("welcomer"))
        case _:
            print("ERROR: invalid command")
