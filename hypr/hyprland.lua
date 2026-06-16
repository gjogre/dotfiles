local h = io.popen("hostname")
local hostname = h and h:read("*l") or ""
if h then h:close() end

if hostname == "wectv" then
    require("machines.tv")
else
    require("system_specific.monitors")
    require("system_specific.environment")
    require("system_specific.autostart")
    require("system_specific.input")
    require("common.style")
    require("common.animations")
    require("common.gestures")
    require("common.keybindings")
    require("common.windowrules")
    require("gjtv")
end
