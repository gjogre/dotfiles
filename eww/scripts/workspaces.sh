#!/bin/sh

parse_workspace_json() {
    echo "$1" | jq -c '
        {
            special: [.[] | select(.id < 0)],
            monitors: (
                [
                    .[] | select(.id >= 0)
                ]
                | sort_by(.monitorID)
                | group_by(.monitorID)
                | reverse #my monitors are in reverse order, so 0 is secondary and 1 is primary. delete if you got it otherway around
                | map({
                    monitorID: .[0].monitorID,
                    workspaces: .
                })
            )
        }
    '
}

handle() {
  case $1 in
    'workspace>>'*) parse_workspace_json "$(hyprctl workspaces -j)";;
    #'focusedmon>>'*) echo "focusedmon $1";;
    'activespecial>>'*) parse_workspace_json "$(hyprctl workspaces -j)";;
  esac
}
parse_workspace_json "$(hyprctl workspaces -j)"

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
