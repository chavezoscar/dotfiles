source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

## Fish prompt adds time to prompt
function fish_prompt
    set_color magenta
    echo -n '💀 '(date "+%H:%M:%S")' '

    set_color cyan
    echo -n '📁 '(prompt_pwd)' '

    set_color normal
    echo -n '⚡ '
end

## Alias
alias ls="eza -alT --long --level=2" 
alias cat="bat"
