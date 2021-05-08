#!/bin/sh

# If vsyscall32 is already disabled, League will work
if [ "$(cat /proc/sys/abi/vsyscall32)" -eq 0 ]
then
    exit 0
fi

dialog() {
    zenity --icon-name='lutris' --width="400" --title="League of Legends anticheat compatibility check" "$@"
}

final_check() {
    if [ "$(cat /proc/sys/abi/vsyscall32)" -ne 0 ]
    then
        dialog --warning --text="As far as this script can detect, your system is not configured to work with League's anticheat. Please verify that you can get into the practice tool before playing a multiplayer game."
    fi
}

trap final_check EXIT

conf_file=/etc/sysctl.d/50-league-of-legends.conf
if grep -q '^[[:space:]]*abi.vsyscall32[[:space:]]*=[[:space:]]*0[[:space:]]*$' "$conf_file"
then
    if dialog --question --text="It looks like you already configured your system to work with League anticheat, and saved the setting to persist across reboots. However, for some reason the persistence part did not work. You can get help in the Lutris Discord server: https://discord.gg/Pnt5CuY\n\nFor now, would you like to enable the setting again until the next reboot?"
    then
        pkexec sh -c 'echo 0 > /proc/sys/abi/vsyscall32'
    fi
    exit 0
fi

if dialog --question --text="In order to play League of Legends, you need to change a Linux system setting. Otherwise, the game will crash after champion select.\n\nThe setting is a performance optimization for 32 bit applications. It is enabled by default, but is incompatible with League's anti-cheat. Disabling it, while necessary to play League, may reduce the performance of some 32 bit applications. For more information and options, select the 'run script' option for League in Lutris.\n\nAs far as this script can detect, the setting has not been disabled yet. Would you like to disable it until the next reboot?"
then
    pkexec sh -c 'echo 0 > /proc/sys/abi/vsyscall32'
fi
