function reset_scheme_to_default
  # Color values from: https://github.com/fish-shell/fish-shell/blob/82052a6cc9fa797070d8945130d45226d5cbc1c5/share/functions/__fish_config_interactive.fish#L51
  # normal
  set -g scheme_color_normal normal
  # commands
  set -g scheme_color_command 005fd7
  # quoted blocks of text
  set -g scheme_color_quote 999900
  # IO redirections
  set -g scheme_color_redirection 00afff
  # process separators like ';' and '&'
  set -g scheme_color_end 009900
  # potential errors
  set -g scheme_color_error ff0000
  # regular command parameters
  set -g scheme_color_param 00afff
  # code comments
  set -g scheme_color_comment 990000
  # parameter expansion operators like '*' and '~'
  set -g scheme_color_operator 00a6b2
  # character escapes like '\n' and '\x70'
  set -g scheme_color_escape 00a6b2
  # current working directory in the prompt
  set -g scheme_color_cwd green
  # current working directory in the prompt when superuser
  set -g scheme_color_cwd_root red
  # autosuggestions
  set -g scheme_color_autosuggestion 555
  # current username in the prompt
  set -g scheme_color_user brgreen
  # current host system in the prompt
  set -g scheme_color_host normal
  # '^C' indicator on a canceled command
  set -g scheme_color_cancel --reverse
  # valid path name
  set -g scheme_color_valid_path --underline
  # matching parenthesis
  set -g scheme_color_match --background=brblue
  # selected text (in vi visual mode)
  set -g scheme_color_selection white --bold --background=brblack
  # history search matches and the selected pager item (must be a background)
  set -g scheme_color_search_match bryellow --background=brblack
  # Additional for completion pager:
  # prefix string, i.e. the string that is to be completed
  set -g scheme_pager_color_prefix white --bold --underline
  # completion itself
  set -g scheme_pager_color_completion normal
  # completion description
  set -g scheme_pager_color_description B3A06D
  # progress bar at the bottom left corner
  set -g scheme_pager_color_progress brwhite --background=cyan
  # background color of the every second completion
  set -g scheme_pager_color_secondary
  # Additional for some commands:
  # current position out of `cdh` / `dirh` command
  set -g scheme_color_history_current --bold
end


function __scheme_get_definition \
  -d 'Get specified color scheme definition' \
  -a scheme_name

  # If no scheme specified, print available scheme list
  if [ -z $scheme_name ]
    echo 'default'
    echo 'dracula'
    echo 'monokai'
    return
  end

  switch $scheme_name

    case 'default'
      reset_scheme_to_default

    # https://draculatheme.com
    case 'dracula'
      # Color palette
      set -l background     282a36
      set -l current_line   44475a
      set -l selection      44475a
      set -l foreground     f8f8f2
      set -l comment        6272a4
      set -l cyan           8be9fd
      set -l green          50fa7b
      set -l orange         ffb86c
      set -l pink           ff79c6
      set -l purple         bd93f9
      set -l red            ff5555
      set -l yellow         f1fa8c
      # Preferred to reset all colors
      reset_scheme_to_default
      # Color configurations
      # set -g scheme_color_normal             normal
      set -g scheme_color_command            $foreground
      set -g scheme_color_quote              $yellow
      set -g scheme_color_redirection        $cyan
      set -g scheme_color_end                $green
      set -g scheme_color_error              $red
      set -g scheme_color_param              $pink
      set -g scheme_color_comment            $comment
      set -g scheme_color_operator           $green
      set -g scheme_color_escape             $purple
      set -g scheme_color_cwd                $green
      set -g scheme_color_cwd_root           $red
      set -g scheme_color_autosuggestion     $purple
      set -g scheme_color_user               $orange
      set -g scheme_color_host               $foreground
      # set -g scheme_color_cancel             --reverse
      # set -g scheme_color_valid_path         --underline
      # set -g scheme_color_match              --background=brblue
      # set -g scheme_color_selection          white --bold --background=brblack
      # set -g scheme_color_search_match       bryellow --background=brblack
      # set -g scheme_pager_color_prefix       white --bold --underline
      # set -g scheme_pager_color_completion   normal
      # set -g scheme_pager_color_description  B3A06D
      # set -g scheme_pager_color_progress     brwhite --background=cyan
      # set -g scheme_pager_color_secondary
      # set -g scheme_color_history_current    --bold

    case 'monokai'
      # Color palette
      set -l background     272822
      set -l foreground     d6d6d6
      set -l comment        75715e
      set -l cyan           66d9ef
      set -l green          a6e22e
      set -l orange         fd971f
      set -l purple         ae81ff
      set -l red            f92672
      set -l yellow         e6db74
      # Preferred to reset all colors
      reset_scheme_to_default
      # Color configurations
      # set -g scheme_color_normal             normal
      set -g scheme_color_command            $cyan
      set -g scheme_color_quote              $yellow
      set -g scheme_color_redirection        $orange
      set -g scheme_color_end                $red
      set -g scheme_color_error              $red
      set -g scheme_color_param              $foreground
      set -g scheme_color_comment            $comment
      set -g scheme_color_operator           $foreground
      set -g scheme_color_escape             $purple
      set -g scheme_color_cwd                $green
      set -g scheme_color_cwd_root           $red
      set -g scheme_color_autosuggestion     $comment
      set -g scheme_color_user               $orange
      set -g scheme_color_host               $foreground
      # set -g scheme_color_cancel             --reverse
      # set -g scheme_color_valid_path         --underline
      # set -g scheme_color_match              --background=brblue
      # set -g scheme_color_selection          white --bold --background=brblack
      # set -g scheme_color_search_match       bryellow --background=brblack
      # set -g scheme_pager_color_prefix       white --bold --underline
      # set -g scheme_pager_color_completion   normal
      # set -g scheme_pager_color_description  B3A06D
      # set -g scheme_pager_color_progress     brwhite --background=cyan
      # set -g scheme_pager_color_secondary
      # set -g scheme_color_history_current    --bold

    case '*'
      echo (set_color normal)(set_color $fish_color_error)(set_color -o)'Error:'(set_color normal)' '(set_color $fish_color_normal)'No such scheme available:'(set_color normal)' '(set_color $fish_color_error)$scheme_name(set_color normal)
      return 1

  end

end