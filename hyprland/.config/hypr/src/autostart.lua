-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
   hl.exec_cmd("sleep 2 && dms run")
   hl.exec_cmd("sleep 2 && discord")
   hl.exec_cmd("sleep 2 && steam -silent")
   hl.exec_cmd("input-remapper-control --command stop-all && input-remapper-control --command autoload")
   hl.exec_cmd("sleep 5 && rclone mount Drive: /mnt/Drive --vfs-cache-mode writes --vfs-cache-max-size 10G --dir-cache-time 5m --allow-other --log-file /tmp/rclone.log --log-level INFO")
 end)
