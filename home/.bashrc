#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

PS1='\[\e[38;2;68;214;44m\] \[\e[0m\]'

# Function to print the current directory above the prompt in gjogre purple
print_current_dir() {
  local current_dir=$(pwd)
  # Replace the home directory path with ~
  local display_dir=${current_dir/#$HOME/~}
  echo -e "\e[38;2;114;114;114m$display_dir\e[0m"
}
# Set the PROMPT_COMMAND to call the function before displaying the prompt
PROMPT_COMMAND=print_current_dir

export __GLVND_DISALLOW_PATCHING=1
export __NV_PRIME_RENDER_OFFLOAD=1
export __VK_LAYER_NV_optimus=NVIDIA_only
