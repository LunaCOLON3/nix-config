function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color normal)
    set -q fish_color_status
    or set -g fish_color_status red

    set --global __fish_git_prompt_showdirtystate true

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l suffix '>'
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    set -l nix_shell_info (
      if test -n "$IN_NIX_SHELL"
        echo -n -s (set_color green) "nix-shell"
      else
        echo -n (prompt_login)
      end
    )

    function silly_pwd --description 'short CWD for the prompt'
      set --local git_root (command git --no-optional-locks rev-parse --show-toplevel 2>/dev/null)
      set --local git_base (string replace --all --regex -- "^.*/" "" "$git_root")
      set --local path_sep /

      test "$fish_prompt_pwd_dir_length" = 0 && set path_sep

      if set --query git_root[1] && ! contains -- $git_root $hydro_ignored_git_paths
        set --erase _hydro_skip_git_prompt
      else
        set --global _hydro_skip_git_prompt
      end

      string join / -- (
        string replace --ignore-case -- ~ \~ $PWD |
        string replace -- "/$git_base/" /:/ |
        string replace --regex --all -- "(\.?[^/]{"(
        string replace --regex --all -- '^$' 1 "$fish_prompt_pwd_dir_length"
        )"})[^/]*/" "\$1$path_sep" |
        string replace -- : "$git_base" |
        string replace --regex -- '([^/]+)$' "\x1b[1m\$1\x1b[22m" |
        string replace --regex --all -- '(?!^/$)/|^$' "/\x1b[22m"
      )
    end

    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "" "" " " "$status_color" "$statusb_color" $last_pipestatus)

    echo -n -s "$nix_shell_info " (set_color $color_cwd) (silly_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status " "$suffix " "
end

fish_prompt
