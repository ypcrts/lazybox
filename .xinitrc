# Source scripts in /etc/X11/xinit/xinitrc.d/
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

/usr/bin/xrdb -merge ~/.Xresources

# enable restart X
/usr/bin/setxkbmap -option terminate:ctrl_alt_bksp

# disable CapsLock & map to Escape
/usr/bin/setxkbmap -option caps:escape

# compose key
/usr/bin/setxkbmap -option compose:ralt

# numlock
/usr/bin/numlockx &

# set cursor
/usr/bin/xsetroot -cursor_name left_ptr &

# /usr/bin/unclutter -grab -noevents -idle 1  &  # THIS BREAKS slock & i3lock
#/usr/bin/unclutter -idle 0.5 -root  &  # alt


# clipboard synching
#/usr/bin/autocutsel -fork &
#/usr/bin/autocutsel -selection CLIPBOARD -fork &


# screen locker
#if [[ -z $(ps -C xautolock -opid=) ]]; then
    # /usr/bin/xautolock -secure -time 8 -locker '/home/hugg/bin/lock' -nowlocker '/home/hugg/bin/lock' &
    #/usr/bin/xautolock -time 1 -locker "/home/hugg/bin/lock" & #  [hugg // 20140828T1719Z]
    
    # [gh//20140913T1515Z]
 #   /usr/bin/xautolock -time 3 -locker "/home/hugg/bin/lock" -corners '++00' -cornerdelay 600 -secure -detectsleep &

#fi


. ~/.screenlayout/vbox.sh

# start i3
exec /usr/bin/i3


# vim: set ft=sh tw=0 ts=4 sw=4 sts=2 fdm=marker fmr={{{,}}} et:
