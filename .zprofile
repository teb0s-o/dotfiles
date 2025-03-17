if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  echo "Select an option\n1. DWM\n2. xfce\n3. TTY"
  read option
    if [ "$option" = 1 ]; then
      startx
    elif [ "$option" = 2 ]; then
      startxfce4
    else
      echo "You are now in tty"
    fi
fi
