-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
   hl.exec_cmd("dms run")
   hl.exec_cmd("sleep 2 && discord")
   hl.exec_cmd("sleep 2 && steam -silent")
   hl.exec_cmd("input-remapper-control --command stop-all && input-remapper-control --command autoload")
 end)
