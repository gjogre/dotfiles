#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'


export __GLVND_DISALLOW_PATCHING=1
export __NV_PRIME_RENDER_OFFLOAD=1
export __VK_LAYER_NV_optimus=NVIDIA_only

eval "$(starship init bash)"

# GJTV binary path
export PATH="$PATH:/home/nesto/.local/bin"

# GJTV binary path
export PATH="$PATH:/home/nesto/.local/bin"
