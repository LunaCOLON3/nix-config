function fish_fetch --description 'run fastfetch if this is the only terminal window'
  set -l term_count "$(ps a | awk '{print $2}' | grep -vi "tty*" | uniq | wc -l)"

  if test $term_count -eq 1
    fastfetch
  end
end
