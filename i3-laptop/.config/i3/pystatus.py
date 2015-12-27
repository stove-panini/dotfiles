from i3pystatus import Status

status = Status(standalone=True)

# Screensaver inhibitor
status.register("dpms",
    format="▒▒",
    color="#ffffff",
    color_disabled="#de935f",)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM
status.register("clock",
    format=" %a %-d %b %l:%M:%S %p ",)

# Battery
status.register("battery",
    format="{status} {remaining} {bar}",
    color="#b4b7b4",
    full_color="#b4b7b4",
    charging_color="#b4b7b4",
    critical_color="#cc6666",
    status={'CHR': 'CHR', 'DIS': 'DIS', 'FULL': 'BAT', 'DPL': 'DPL'},)
    
# Network graph & traffic speed
# Requires: colour, netifaces, psutil, basiciw
status.register("network",
    interface="wlp3s0",
    format_up="{interface} @ {essid} [{quality}%]",
    format_down="{interface}: DOWN",
    dynamic_color=False,
    color_up="#b5bd68",
    color_down="#cc6666",
    interval=5,
    on_leftclick="/home/stove/.local/share/i3/scripts/window-wifimenu.sh",
    on_rightclick="cycle_interface",
    on_upscroll=None,
    on_downscroll=None,)

# CPU load avg over the last minute
status.register("load",
    format="{avg1}",
    critical_color="#cc6666",)

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="CPU {temp:.0f}°C / ",
    alert_color="#cc6666",
    hints={"separator": False, "separator_block_width": 0},)

# Network disk usage
status.register("shell",
    command="/home/stove/.local/share/i3/scripts/df-nas.sh",
    # only log CRITICAL errors (default is 30 WARNING)
    log_level=50,
    interval=60,
    color="#f0c674",
    error_color="#de935f",)

# Internal disk usage
status.register("disk",
    interval=60,
    path="/",
    format="SSD {free}G [{percentage_used}%]",
    color="#f0c674",
    critical_color="#cc6666",
    round_size=1,)

# Shows pulseaudio default sink volume
# Requires: libpulseaudio
status.register("pulseaudio",
    format="VOL {volume}%",
    color_muted="#cc6666")

status.run()
