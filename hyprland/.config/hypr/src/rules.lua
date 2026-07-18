------------------------------
----WINDOWS AND WORKSPACES----
------------------------------

hl.workspace_rule({workspace = "1", monitor = "DP-1"})
hl.workspace_rule({workspace = "2", monitor = "DP-1"})
hl.workspace_rule({workspace = "3", monitor = "DP-2"})
hl.workspace_rule({workspace = "4", monitor = "DP-2"})

hl.window_rule {
  name = "suppress-maximize-events",
  match = {class = ".*"},

  suppress_event = "maximize",
}

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})



-- Launch Discord on workspace 3
hl.window_rule {
  name = "discord-set-workspace",
  match = {class = "discord.*"},
  workspace = 3,
  no_initial_focus = true,
}

-- Launch FFXIV and XIVLauncher On Workspace 1
hl.window_rule {
  name = "ffxiv-set-workspace",
  match = {class = "ffxiv_dx11.exe"},
  workspace = 1,
  no_initial_focus = true
}

hl.window_rule {
  name = "xivlauncher-set-workspace",
  match = {class = "XIVLauncher.Core"},
  workspace = 1,
  no_initial_focus = true
}

hl.window_rule {
  name = "steam-games-set-workspace",
  match = {class = "steam.*"},
  workspace = 1,
  no_initial_focus = true,
}




