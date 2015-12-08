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

# Network graph & traffic speed
# Requires: colour, netifaces, psutil, basiciw
# Wired connection colors only work with dynamic_color for some reason
status.register("network",
    interface="enp3s0",
    format_up="{interface}:{network_graph} {kbs}KB/s",
    format_down="{interface}: DOWN",
    dynamic_color=True,
    start_color="#c5c8c6",
    end_color="#cc6666",
    graph_style="blocks",
    graph_width=10,
    upper_limit="2500",
    on_leftclick=None,
    on_rightclick=None,
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

# GPU temp
status.register("shell",
    command="echo GPU $(nvidia-settings -q gpucoretemp -t | tail -1)°C",
    interval=15,)

# External drive disk usage
status.register("shell",
    command="/home/stove/.local/share/i3/df-nas.sh",
    interval=30,
    color="#8abeb7",)

status.register("shell",
    command="/home/stove/.local/share/i3/df-ext.sh",
    interval=30,
    color="#b5bd68",)

# Disk usage
status.register("disk",
    path="/",
    format="SSD {free}G [{percentage_used}%]",
    interval=30,
    color="#b5bd68",
    round_size=1,)

# Shows pulseaudio default sink volume
# Requires: libpulseaudio
status.register("pulseaudio",
    format="VOL {volume}%",
    color_muted="#cc6666")

status.run()
