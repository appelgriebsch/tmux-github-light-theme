#!/bin/bash
github_light_black="#ffffff"
github_light_blue="#0969da"
github_light_yellow="#4d2d00"
github_light_red="#cf222e"
github_light_white="#6e7781"
github_light_green="#116329"
github_light_visual_grey="#cee1f8"
github_light_comment_grey="#6e7781b"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$github_light_white"
set "message-bg" "$github_light_black"

set "message-command-fg" "$github_light_white"
set "message-command-bg" "$github_light_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$github_light_black"
setw "window-status-bg" "$github_light_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$github_light_black"
setw "window-status-activity-fg" "$github_light_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$github_light_comment_grey"
set "window-active-style" "fg=$github_light_white"

set "pane-border-fg" "$github_light_white"
set "pane-border-bg" "$github_light_black"
set "pane-active-border-fg" "$github_light_blue"
set "pane-active-border-bg" "$github_light_black"

set "display-panes-active-colour" "$github_light_yellow"
set "display-panes-colour" "$github_light_blue"

set "status-bg" "$github_light_black"
set "status-fg" "$github_light_white"

set "@prefix_highlight_fg" "$github_light_black"
set "@prefix_highlight_bg" "$github_light_blue"
set "@prefix_highlight_copy_mode_attr" "fg=$github_light_black,bg=$github_light_blue"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@github_light_widgets")
time_format=$(get "@github_light_time_format" "%R")
date_format=$(get "@github_light_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$github_light_white,bg=$github_light_black,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$github_light_visual_grey,bg=$github_light_black]#[fg=$github_light_visual_grey,bg=$github_light_visual_grey]#[fg=$github_light_white, bg=$github_light_visual_grey]${status_widgets} #[fg=$github_light_blue,bg=$github_light_visual_grey,nobold,nounderscore,noitalics]#[fg=$github_light_black,bg=$github_light_blue,bold] #h #[fg=$github_light_yellow, bg=$github_light_blue]#[fg=$github_light_red,bg=$github_light_yellow]"
set "status-left" "#[fg=$github_light_black,bg=$github_light_blue,bold] #S #{prefix_highlight}#[fg=$github_light_blue,bg=$github_light_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$github_light_black,bg=$github_light_black,nobold,nounderscore,noitalics]#[fg=$github_light_white,bg=$github_light_black] #I  #W #[fg=$github_light_black,bg=$github_light_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$github_light_black,bg=$github_light_visual_grey,nobold,nounderscore,noitalics]#[fg=$github_light_white,bg=$github_light_visual_grey,nobold] #I  #W #[fg=$github_light_visual_grey,bg=$github_light_black,nobold,nounderscore,noitalics]"