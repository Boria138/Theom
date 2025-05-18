trayer \
    --edge top \
    --align left \
    --SetDockType true \
    --SetPartialStruct true \
    --expand true
    --width 10 \
    --height 19
    --transparent true \
    --alpha 0 \
    --tint 0x272a32 & \

# Wait for trayer to start, then move it
sleep 0.5
xdotool search --onlyvisible --class trayer windowmove %@ 10 10
