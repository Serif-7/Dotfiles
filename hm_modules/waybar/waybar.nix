{
  position = "top";
  height = 30;
  spacing = 4;
  modules-left = [
    "sway/workspaces"
    "sway/mode"
    "sway/scratchpad"
    "custom/media"
  ];
  modules-center = [
      "sway/window"
    ];
  modules-right = [
      "mpd"
      "idle_inhibitor"
      "pulseaudio"
      "network"
      "power-profiles-daemon"
      "cpu"
      "memory"
      "temperature"
      "backlight"
      "keyboard-state"
      "sway/language"
      "battery"
      "battery#bat2"
      "clock"
      "tray"
      "custom/power"
  ];
  "sway/mode" = {
      format = "<span style=\"italic\">{}</span>";
  };
  "sway/scratchpad" = {
      format = "{icon} {count}";
      show-empty = false;
      format-icons = ["" ""];
      tooltip = true;
      tooltip-format = "{app}: {title}";
  };


  clock = {
    interval = 60;
    format = "{:%H:%M}";
    max-length = 25;
  };

  network = {
    # interface = "wlp2*"; // (Optional) To force the use of this interface
    format-wifi = "{essid} ({signalStrength}%) ";
    format-ethernet = "{ipaddr}/{cidr} ";
    tooltip-format = "{ifname} via {gwaddr} ";
    format-linked = "{ifname} (No IP) ";
    format-disconnected = "Disconnected ⚠";
    format-alt = "{ifname}: {ipaddr}/{cidr}";
    };

  "custom/power" = {
    format = "⏻ ";
  	tooltip = false;
  	menu = "on-click";
    # // Menu file in resources folder
  	menu-file = "$HOME/.config/waybar/power_menu.xml";
  	menu-actions = {
  		shutdown = "shutdown";
  		reboot = "reboot";
  		suspend = "systemctl suspend";
  		hibernate = "systemctl hibernate";
	  };
  };


}
