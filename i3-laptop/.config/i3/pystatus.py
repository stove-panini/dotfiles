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
    format="BAT {remaining} {bar}",
    color="#b4b7b4",
    full_color="#b4b7b4",
    charging_color="#b4b7b4",
    critical_color="#cc6666",)
    
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
    on_leftclick=None,
    on_rightclick="cycle_interface",
    on_upscroll=None,
    on_downscroll=None,)

# CPU load avg over the last minute
status.register("load",
    format="{avg1}",
    critical_color="#cc6666",)

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="CPU {temp:.0f}°C",
    alert_color="#cc6666",)

# Network disk usage
status.register("shell",
    command="/home/stove/.local/share/i3/df-nas.sh",
    interval=60,
    color="#8abeb7",)

# Internal disk usage
status.register("disk",
    interval=60,
    path="/",
    format="SSD {free}G [{percentage_used}%]",
    color="#8abeb7",
    round_size=1,)

# Shows pulseaudio default sink volume
# Requires: libpulseaudio
status.register("pulseaudio",
    format="VOL {volume}%",
    color_muted="#cc6666")

status.run()
