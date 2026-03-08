# TODO
# - https://github.com/YaLTeR/niri/discussions/724

# Run `niri msg action` to get this list of default actions.

# ---------------------
# Focus
# ---------------------
#
# focus-column                             | Focus a column by index
# focus-column-first                       | Focus the first column
# focus-column-last                        | Focus the last column
# focus-column-left                        | Focus the column to the left
# focus-column-left-or-last                | Focus the next column to the left, looping if at start
# focus-column-or-monitor-left             | Focus the column or the monitor to the left
# focus-column-or-monitor-right            | Focus the column or the monitor to the right
# focus-column-right                       | Focus the column to the right
# focus-column-right-or-first              | Focus the next column to the right, looping if at end
# focus-floating                           | Switches focus to the floating layout
# focus-monitor                            | Focus a monitor by name
# focus-monitor-down                       | Focus the monitor below
# focus-monitor-left                       | Focus the monitor to the left
# focus-monitor-next                       | Focus the next monitor
# focus-monitor-previous                   | Focus the previous monitor
# focus-monitor-right                      | Focus the monitor to the right
# focus-monitor-up                         | Focus the monitor above
# focus-tiling                             | Switches focus to the tiling layout
# focus-window                             | Focus a window by id
# focus-window-bottom                      | Focus the bottommost window
# focus-window-down                        | Focus the window below
# focus-window-down-or-column-left         | Focus the window below or the column to the left
# focus-window-down-or-column-right        | Focus the window below or the column to the right
# focus-window-down-or-top                 | Focus the window below or the topmost window
# focus-window-in-column                   | Focus a window in the focused column by index
# focus-window-or-monitor-down             | Focus the window or the monitor below
# focus-window-or-monitor-up               | Focus the window or the monitor above
# focus-window-or-workspace-down           | Focus the window or the workspace below
# focus-window-or-workspace-up             | Focus the window or the workspace above
# focus-window-previous                    | Focus the previously focused window
# focus-window-top                         | Focus the topmost window
# focus-window-up                          | Focus the window above
# focus-window-up-or-bottom                | Focus the window above or the bottommost window
# focus-window-up-or-column-left           | Focus the window above or the column to the left
# focus-window-up-or-column-right          | Focus the window above or the column to the right
# focus-workspace                          | Focus a workspace by reference (index or name)
# focus-workspace-down                     | Focus the workspace below
# focus-workspace-previous                 | Focus the previous workspace
# focus-workspace-up                       | Focus the workspace above
# switch-focus-between-floating-and-tiling | Toggles the focus between the floating and the tiling layout
# center-column                            | Center the focused column on the screen
# center-window                            | Center the focused window on the screen
# center-visible-columns                   | Center all fully visible columns on the screen

# ---------------------
# Movement
# ---------------------
#
# move-column-left                         | Move the focused column to the left
# move-column-left-or-to-monitor-left      | Move the focused column to the left or to the monitor to the left
# move-column-right                        | Move the focused column to the right
# move-column-right-or-to-monitor-right    | Move the focused column to the right or to the monitor to the right
# move-column-to-first                     | Move the focused column to the start of the workspace
# move-column-to-index                     | Move the focused column to a specific index on its workspace
# move-column-to-last                      | Move the focused column to the end of the workspace
# move-column-to-monitor                   | Move the focused column to a specific monitor
# move-column-to-monitor-down              | Move the focused column to the monitor below
# move-column-to-monitor-left              | Move the focused column to the monitor to the left
# move-column-to-monitor-next              | Move the focused column to the next monitor
# move-column-to-monitor-previous          | Move the focused column to the previous monitor
# move-column-to-monitor-right             | Move the focused column to the monitor to the right
# move-column-to-monitor-up                | Move the focused column to the monitor above
# move-column-to-workspace                 | Move the focused column to a workspace by reference (index or name)
# move-column-to-workspace-down            | Move the focused column to the workspace below
# move-column-to-workspace-up              | Move the focused column to the workspace above
# move-floating-window                     | Move the floating window on screen
# move-window-down                         | Move the focused window down in a column
# move-window-down-or-to-workspace-down    | Move the focused window down in a column or to the workspace below
# move-window-to-floating                  | Move the focused window to the floating layout
# move-window-to-monitor                   | Move the focused window to a specific monitor
# move-window-to-monitor-down              | Move the focused window to the monitor below
# move-window-to-monitor-left              | Move the focused window to the monitor to the left
# move-window-to-monitor-next              | Move the focused window to the next monitor
# move-window-to-monitor-previous          | Move the focused window to the previous monitor
# move-window-to-monitor-right             | Move the focused window to the monitor to the right
# move-window-to-monitor-up                | Move the focused window to the monitor above
# move-window-to-tiling                    | Move the focused window to the tiling layout
# move-window-to-workspace                 | Move the focused window to a workspace by reference (index or name)
# move-window-to-workspace-down            | Move the focused window to the workspace below
# move-window-to-workspace-up              | Move the focused window to the workspace above
# move-window-up                           | Move the focused window up in a column
# move-window-up-or-to-workspace-up        | Move the focused window up in a column or to the workspace above
# move-workspace-down                      | Move the focused workspace down
# move-workspace-to-index                  | Move the focused workspace to a specific index on its monitor
# move-workspace-to-monitor                | Move the focused workspace to a specific monitor
# move-workspace-to-monitor-down           | Move the focused workspace to the monitor below
# move-workspace-to-monitor-left           | Move the focused workspace to the monitor to the left
# move-workspace-to-monitor-next           | Move the focused workspace to the next monitor
# move-workspace-to-monitor-previous       | Move the focused workspace to the previous monitor
# move-workspace-to-monitor-right          | Move the focused workspace to the monitor to the right
# move-workspace-to-monitor-up             | Move the focused workspace to the monitor above
# move-workspace-up                        | Move the focused workspace up
# swap-window-right                        | Swap focused window with one to the right
# swap-window-left                         | Swap focused window with one to the left

# ---------------------
# Sizing
# ---------------------
#
# set-window-width                         | Change the width of the focused window
# set-window-height                        | Change the height of the focused window
# reset-window-height                      | Reset the height of the focused window back to automatic
# switch-preset-column-width               | Switch between preset column widths
# switch-preset-column-width-back          | Switch between preset column widths backwards
# switch-preset-window-width               | Switch between preset window widths
# switch-preset-window-width-back          | Switch between preset window widths backwards
# switch-preset-window-height              | Switch between preset window heights
# switch-preset-window-height-back         | Switch between preset window heights backwards
# maximize-column                          | Toggle the maximized state of the focused column
# set-column-width                         | Change the width of the focused column
# toggle-windowed-fullscreen               | Toggle windowed (fake) fullscreen on the focused window
# fullscreen-window                        | Toggle fullscreen on the focused window
# expand-column-to-available-width         | Expand the focused column to space not taken up by other fully visible columns

# ---------------------
# Layout
# ---------------------
#
# close-window                             | Close the focused window
# consume-or-expel-window-left             | Consume or expel the focused window left
# consume-or-expel-window-right            | Consume or expel the focused window right
# consume-window-into-column               | Consume the window to the right into the focused column
# expel-window-from-column                 | Expel the focused window from the column
# toggle-column-tabbed-display             | Toggle the focused column between normal and tabbed display
# set-column-display                       | Set the display mode of the focused column
# toggle-window-floating                   | Move the focused window between the floating and the tiling layout

# ---------------------
# Overview window
# ---------------------
#
# toggle-overview                          | Toggle (open/close) the Overview
# open-overview                            | Open the Overview
# close-overview                           | Close the Overview

# ---------------------
# Screenshots
# ---------------------
#
# screenshot                               | Open the screenshot UI
# screenshot-screen                        | Screenshot the focused screen
# screenshot-window                        | Screenshot the focused window

# ---------------------
# Misc
# ---------------------
#
# clear-dynamic-cast-target                | Clear the dynamic cast target, making it show nothing
# debug-toggle-damage                      | Toggle visualization of output damage
# debug-toggle-opaque-regions              | Toggle visualization of render element opaque regions
# do-screen-transition                     | Do a screen transition
# load-config-file                         | Reload the config file
# power-off-monitors                       | Power off all monitors via DPMS
# power-on-monitors                        | Power on all monitors via DPMS
# quit                                     | Exit niri
# set-dynamic-cast-monitor                 | Set the dynamic cast target to the focused monitor
# set-dynamic-cast-window                  | Set the dynamic cast target to the focused window
# set-window-urgent                        | Set urgent status of a window
# set-workspace-name                       | Set the name of the focused workspace
# show-hotkey-overlay                      | Show the hotkey overlay
# spawn                                    | Spawn a command
# spawn-sh                                 | Spawn a command through the shell
# switch-layout                            | Switch between keyboard layouts
# toggle-debug-tint                        | Toggle a debug tint on windows
# toggle-keyboard-shortcuts-inhibit        | Enable or disable the keyboard shortcuts inhibitor (if any) for the focused surface
# toggle-window-rule-opacity               | Toggle the opacity of the focused window
# toggle-window-urgent                     | Toggle urgent status of a window
# unset-window-urgent                      | Unset urgent status of a window
# unset-workspace-name                     | Unset the name of the focused workspace

{ config, ... }:

{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Return".action = spawn "foot";

    # Focus
    "Mod+l".action = focus-column-right;
    "Mod+h".action = focus-column-left;
    "Mod+j".action = focus-window-down;
    "Mod+k".action = focus-window-up;
    "Mod+Down".action = focus-workspace-down;
    "Mod+Up".action = focus-workspace-up;

    # Movement
    "Mod+Shift+l".action = move-column-right;
    "Mod+Shift+h".action = move-column-left;
    "Mod+Shift+j".action = move-window-down;
    "Mod+Shift+k".action = move-window-up;
    "Mod+Shift+Down".action = move-column-to-workspace-down;
    "Mod+Shift+Up".action = move-column-to-workspace-up;

    # Sizing
    "Mod+m".action = maximize-column;
    "Mod+Control+l".action = switch-preset-window-width;
    "Mod+Control+h".action = switch-preset-window-width-back;
    "Mod+Control+j".action = switch-preset-window-height;
    "Mod+Control+k".action = switch-preset-window-height-back;

    # Layout
    "Mod+q".action = close-window;
    "Mod+t".action = toggle-column-tabbed-display;

    # Misc
    "Mod+Ctrl+Backspace".action = quit;

    # DankMaterialShell
    "Mod+Space" = {
      action = spawn "dms" "ipc" "spotlight" "toggle";
    };
    "XF86MonBrightnessDown" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "brightness" "decrement" "5" "";
    };
    "XF86MonBrightnessUp" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "brightness" "increment" "5" "";
    };
    "XF86AudioLowerVolume" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "audio" "decrement" "3";
    };
    "XF86AudioRaiseVolume" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "audio" "increment" "3";
    };
    "XF86AudioMute" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "audio" "mute";
    };
    "XF86AudioMicMute" = {
      allow-when-locked = true;
      action = spawn "dms" "ipc" "audio" "micmute";
    };
  };
}
