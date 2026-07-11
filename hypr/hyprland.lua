---------------------------
-- Hyprland By Voxelfied --
---------------------------

-- Startup --

hl.on("hyprland.start", function()
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar & awww img ~/Pictures/Wallpapers/fog.jpg")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("mako")
    --GTK Theme
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Everforest-Dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme 'Everforest-Dark'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Classic 16'")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'Clear Sans 10'")
    hl.exec_cmd("gsettings set org.gnome.desktop.wm.preferences button-layout :")
    --Screensharing
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- Programs --

local terminal = "kitty -1"
local fileManager = "pcmanfm"
local menu = "wofi --show"
local logoutMenu = "wlogout"
local editor = "code"
local browser = "firefox-developer-edition"
local music = "youtube-music"

-- Visual --

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 8,
        border_size = 2,
        col = {
            active_border = "rgb(A7C080)",
            inactive_border = "rgb(3D484D)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "hy3",
    },
    decoration = {
        rounding = 8,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = true,
            size = 4,
            passes = 2,
            vibrancy = 0,
        },
    },
    animations = {
        enabled = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        animate_manual_resizes = true,
        force_default_wallpaper = 0,
        disable_splash_rendering = true,
        disable_hyprland_logo = true,
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
        enforce_permissions = false,
    },
})

--Curves & Animations
hl.curve("overshot", { type = "bezier", points = { { 0.13, 0.99 }, { 0.29, 1.1 }, }, })
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 7, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 7, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "overshot" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

--Window & Layer Rules
hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })

-- Input --

hl.config({
    input = {
        kb_layout = "us",
        kb_options = "caps:ctrl_modifier",
        repeat_delay = 300,
        repeat_rate = 50,
        follow_mouse = 1,
        accel_profile = "adaptive",
        sensitivity = 0.2,
        touchpad = {
            disable_while_typing = false,
            natural_scroll = false,
            scroll_factor = 0.2,
            middle_button_emulation = true,
            clickfinger_behavior = true,
            tap_to_click = true,
            drag_lock = false,
            tap_and_drag = false,
        },
    },
    cursor = {
        no_hardware_cursors = true,
    },
})

--Shortcuts
hl.bind("ALT + C", hl.dsp.send_shortcut({ mods = "CTRL", key = "C" }))
hl.bind("ALT + V", hl.dsp.send_shortcut({ mods = "CTRL", key = "V" }))
hl.bind("ALT + A", hl.dsp.send_shortcut({ mods = "CTRL", key = "A" }))
hl.bind("ALT + Z", hl.dsp.send_shortcut({ mods = "CTRL", key = "Z" }))
hl.bind("ALT + Backspace", hl.dsp.send_shortcut({ mods = "CTRL", key = "Backspace" }))

--Gestures
hl.config({
    gestures = {
        workspace_swipe_distance = 2000,
        workspace_swipe_min_speed_to_force = 10,
        workspace_swipe_use_r = true,
        workspace_swipe_create_new = true,
        workspace_swipe_forever = false,
        workspace_swipe_direction_lock = true,
    },
})
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})
hl.gesture({
    fingers = 4,
    direction = "pinchin",
    action = "fullscreen",
})
hl.gesture({
    fingers = 4,
    direction = "pinchout",
    action = function()
        hl.exec_cmd(terminal)
    end,
})

-- Display --

hl.config({ xwayland =  { force_zero_scaling = true } })
hl.monitor({
    output = "eDP-1",
    mode = "2560x1440@60",
    position = "auto",
    scale = 1.6,
})
hl.monitor({
    output = "DP-1",
    mode = "1920x1080@120",
    position = "auto",
    scale = 1,
})

-- Key Bindings --

local mainMod = "ALT"

--Vim Keymap
local left = "h"
local right = "l"
local up = "k"
local down = "j"

--Program Keybinds
hl.bind("CTRL + SPACE", hl.dsp.exec_cmd(terminal), { repeating = true })
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + E", hl.dsp.exec_cmd(logoutMenu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(music))
--Window & Workspace Keybinds
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
--Mouse Binds
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
--Focus Window
hl.bind(mainMod .. " + " .. left, hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. right, hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + " .. up, hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. down, hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }))
--Move Focused Window
hl.bind(mainMod .. " + SHIFT + " .. left, hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + " .. right, hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + " .. up, hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + " .. down, hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "d" }))
--Switch or Move Focused Window to Workspace
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end
--Switch or Move Focused Window to Scratchpad
hl.bind(mainMod .. " + Equal", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind(mainMod .. " + Minus", hl.dsp.window.move({ workspace = "special:scratchpad" }))

--Capture Area
hl.bind("PRINT", hl.dsp.exec_cmd([[grim - | tee ~/Pictures/Screenshots/Screenshot_$(date '+%m-%d-%Y_%H-%M-%S').jpg | wl-copy]]))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | tee ~/Pictures/Screenshots/Screenshot_$(date '+%m-%d-%Y_%H-%M-%S').jpg | wl-copy]]))
hl.bind(mainMod .. " + CTRL + BracketLeft", hl.dsp.exec_cmd([[gpu-screen-recorder -w screen -o ~/Pictures/Videos/Recording_$(date '+%m-%d-%Y_%H-%M-%S').mp4 & notify-send -u low -t 1000 "Screen Capture" "Recording started." -i /usr/share/icons/camera.png]]))
hl.bind(mainMod .. " + CTRL + BracketRight", hl.dsp.exec_cmd([[killall -SIGINT gpu-screen-recorder && notify-send -u low "Screen Capture" "Recording stopped." -i /usr/share/icons/camera-off.png]]))
hl.bind(mainMod .. " + CTRL + Backslash", hl.dsp.exec_cmd([[killall -SIGUSR2 gpu-screen-recorder]]))
--Reload Waybar
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("killall waybar || true && waybar &"))

--Media Keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("End", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("Insert", hl.dsp.exec_cmd("playerctl next"))
hl.bind("Home", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })
hl.bind("SUPER + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 1%+"), { repeating = true })
hl.bind("SUPER + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%-"), { repeating = true })

-- Environment Variables --

--NVIDIA Graphics
--hl.env("AQ_ARM_DEVICES", "/dev/dri/card0:/dev/dri/card1")
--hl.env("LIBVA_DRIVER_NAME", "nvidia")
--hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
--hl.env("NVD_BACKEND", "direct")
--hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

--Cursor
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "16")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "16")
