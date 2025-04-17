#!/bin/sh

parse_workspace_json() {
    workspaces="$(hyprctl workspaces -j)"
    activewindow="$(hyprctl activewindow -j)"

    echo "$(jq -c -n --argjson ws "$workspaces" --argjson aw "$activewindow" '
        {
            title: ($aw.title),
            special: (
                $ws
                | map(select(.id < 0) | .name |= sub("special:"; "")
                      | . + {active: (.id == $aw.workspace.id)}
                )
            ),
            monitors: (
                $ws
                | map(select(.id >= 0)
                      | . + {active: (.id == $aw.workspace.id)}
                )
                | sort_by(.monitorID)
                | group_by(.monitorID)
                | reverse
                | map({
                    monitorID: .[0].monitorID,
                    workspaces: (reverse)
                })
            )
        }
    ')"
}

handle() {
  case $1 in
    'workspace>>'*) parse_workspace_json;;
    'focusedmon>>'*) parse_workspace_json;;
    'activewindow>>'*) parse_workspace_json;;
  esac
}
parse_workspace_json

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
