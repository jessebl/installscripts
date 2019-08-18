function fish_prompt
    if set -q SSH_CLIENT || set -q SSH_CONNECTION || set -q SSH_TTY
	set color 'blue'
	set_color "$color"
        echo -n '[ '
	set_color normal
	echo -n (hostname --short)': '
    else
	set color 'red'
	set_color $color
	echo -n '[ '
    end
    set_color normal
    echo -n (prompt_pwd)
    set_color $color
    echo -n ' ]$ '
    set_color normal
end

function fish_right_prompt
    # Empty if git not in PATH
    command -v git > /dev/null || return
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
	set unstaged_changes (git diff --shortstat 2> /dev/null | tail -n1)
	if test -n "$unstaged_changes"
	    set color 'yellow'
	    set changed '\u2219'
	else
	    set color 'green'
	    set changed ''
	end
	set git_status (git status --porcelain)
	set symbolic_ref "\ue0a0 "(git symbolic-ref --short HEAD 2> /dev/null)
	if test -n "$symbolic_ref"
	    set ref $symbolic_ref
	else
	    set ref "➦ "(git rev-parse --short HEAD 2> /dev/null)
	end
	set_color $color
	printf $changed
	printf $ref
	set_color normal
    end
end
