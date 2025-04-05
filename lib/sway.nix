{
  /*
  Return an attrset that defines a keybind for executing a command

  Example:
    mkExec "Mod4+Enter" (getExe pkgs.foot)
    => { "Mod4+Enter" = "exec /nix/store/aas7inivadn62v7abxqlfahah8cz9nbd-foot-1.15.3/bin/foot"; }
  */

  mkExec = keyCombo: exec: {${keyCombo} = "exec ${exec}";};

  /*
  Return an attrset with keybinds for window navigation

  Example:
    mkDirectionKeys "Mod4" "Right" "right"
    => {
         "Mod4+Right" = "focus right";
         "Mod4+Shift+Right" = "move right";
       }
  */

  mkDirectionKeys = mod: key: direction: {
    "${mod}+${key}" = "focus ${direction}";
    "${mod}+Shift+${key}" = "move ${direction}";
  };

  /*
  Return an attrset with keybinds for workspace navigation

  Example:
    mkWorkspaceKeys "Mod4" "5:chat"
    => {
         "Mod4+5" = "workspace 5:chat";
         "Mod4+Shift+5" = "move container to workspace 5:chat";
       }
  */

  mkWorkspaceKeys = mod: workspace: let
    key = builtins.substring 0 1 workspace;
  in {
    "${mod}+${key}" = "workspace ${workspace}";
    "${mod}+Shift+${key}" = "move container to workspace ${workspace}";
  };
}
