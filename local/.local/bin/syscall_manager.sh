#!/bin/sh

dialog() {
    zenity --icon-name='lutris' --width="400" --title="League of Legends anticheat compatibility tool" "$@"
}

show_explanation_dialog() {
    dialog --info --text="League of Legends' anticheat is not compatible with regular wine and requires additional patches to work. There are two sets of patches to do this. Unfortunately, both are usually referred to with the same name, \"wine-lol\".\n\nThe first set also requires a patched version of glibc, a core system library. It is possible to use glibc-wine-lol alongside your regular system glibc (replacing your system glibc with the patched version is a bad idea). However, Lutris cannot distribute glibc-wine-lol as part of its runtime because some Linux distributions need builds specific to those distros.\n\nThe second patchset, that Lutris uses, requires disabling a Linux kernel setting called vsyscall32. It is a performance optimization for certain system calls in 32 bit applications (if you care, run \`man vdso\` in your terminal for the nitty gritty details). The actual performance impact of disabling it varies by application, depending on how many system calls it makes, but anecdotally seems to be small-to-nonexistant in *most* games. This tool provides the option to toggle whether vsyscall32 is currently enabled the setting and disable it on boot.\n\nIt is possible to use the first version with Lutris by installing from a 3rd party source, then changing the Lutris League config to use it as a custom wine version (in this case, you can also disable the syscall_check prelaunch command, under system settings). This allows you to run League with no impact on the rest of your system. However, we do not recommend this because the Lutris team does not audit those wine and glibc builds. You can also compile your own, but in that case you probably don't need our recommendation ;)"
}

show_commands_dialog() {
    dialog --no-wrap --info --text="# Disable vsyscall32 until next boot:\nsudo sh -c 'echo 0 > /proc/sys/abi/vsyscall32'\n\n# Enable vsyscall32 until next boot:\nsudo sh -c 'echo 1 > /proc/sys/abi/vsyscall32'\n\n# Disable vsyscall32 on boot:\nsudo sh -c 'echo \"abi.vsyscall32=0\" > /etc/sysctl.d/50-league-of-legends.conf'\n\n# Return to system default on boot:\nsudo rm /etc/sysctl.d/50-league-of-legends.conf'\n\n# On nixOS, disable on boot by adding this to your configuration.nix:\nboot.kernel.sysctl = { \"abi.vsyscall32\" = 0; };"
}

check_systemd() {
    if [ -d /etc/sysctl.d ]; then
        return 0
    else
        dialog --error --text="This tool uses systemd to set vsyscall32 on boot, but your system appears not to use systemd. If you need help or want to contribute support for other init systems, you can ask in the Lutris Discord server: https://discord.gg/Pnt5CuY"
        return 1
    fi
}

conf_file=/etc/sysctl.d/50-league-of-legends.conf

now_off="Disable vsyscall32 until next reboot"
now_on="Enable vsyscall32 until next reboot"
boot_off="Disable vsyscall32 on boot"
boot_default="Don't change vsyscall32 on boot (usually enabled)."
show_commands="Show me the commands; I'll handle it myself"
show_explanation="Show explanation again"
quit="Close this window"

show_explanation_dialog

until [ "$RESULT" = "$quit" ]; do

    if [ "$(cat /proc/sys/abi/vsyscall32)" -eq 0 ]; then
        now="DISABLED"
        now_toggle="$now_on"
    else
        now="ENABLED"
        now_toggle="$now_off"
    fi

    if [ ! -f "$conf_file" ]; then
        boot="SYSTEM DEFAULT"
        boot_toggle="$boot_off"
    elif grep -q '^[[:space:]]*abi.vsyscall32[[:space:]]*=[[:space:]]*0[[:space:]]*$' "$conf_file"; then
        boot="DISABLED"
        boot_toggle="$boot_default"
    elif grep -q '^[[:space:]]*abi.vsyscall32[[:space:]]*=[[:space:]]*1[[:space:]]*$' "$conf_file"; then
        boot="ENABLED"
        boot_toggle="$boot_off"
    else
        boot="SYSTEM DEFAULT?"
        boot_toggle="$boot_default"
    fi

    RESULT=$(dialog --list --radiolist --height="250" \
        --column="" --column="Currently: $now. On boot: $boot" \
        "TRUE" "$now_toggle" \
        "FALSE" "$boot_toggle" \
        "FALSE" "$show_explanation" \
        "FALSE" "$show_commands" \
        "FALSE" "$quit")

    case "$RESULT" in
        "$now_on")
            pkexec sh -c 'echo 1 > /proc/sys/abi/vsyscall32'
            ;;
        "$now_off")
            pkexec sh -c 'echo 0 > /proc/sys/abi/vsyscall32'
            ;;
        "$boot_off")
            if check_systemd; then
                pkexec sh -c 'echo "abi.vsyscall32=0" > "$1"' boot_off "$conf_file"
            fi
            ;;
        "$boot_default")
            if check_systemd; then
                pkexec sh -c 'echo "#abi.vsyscall32=0" > "$1"' boot_default "$conf_file"
            fi
            ;;
        "$show_explanation")
            show_explanation_dialog
            ;;
        "$show_commands")
            show_commands_dialog
            ;;
        "$quit"|*) # includes dialog canceled
            RESULT="$quit"
            ;;
    esac

done
