## set mouse sensivity
xinput --set-prop 'pointer:''SINOWEALTH Wired Gaming Mouse' 'libinput Accel Profile Enabled' 0, 1 &
xinput --set-prop 'pointer:''SINOWEALTH Wired Gaming Mouse' 'libinput Accel Speed' -0.4 &

## rebind esc to caps and vise-versa
xmodmap -e "clear Lock"
xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"

xset s off -dpms &

exec dunst &
exec picom &
exec ./.screen.sh &
exec feh --bg-fill ~/pic/wallpapers/9.jpg &
exec slstatus &
exec dwm
