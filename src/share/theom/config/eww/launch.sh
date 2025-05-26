#!/bin/bash

eww kill

eww daemon &
sleep 0.5
eww open bar

echo "EWW bar launched."
