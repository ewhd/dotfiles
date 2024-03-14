

# Function to quit ranger into the current dir
# see
# https://www.reddit.com/r/ranger/comments/bngtqt/how_to_exit_and_cd_into_last_dir_you_were_on/
# and https://github.com/ranger/ranger/issues/1554
# This should probably be moved into a scripts file/dir, once I set that up
function ranger {
	local IFS=$'\t\n'
	local tempfile="$(mktemp -t tmp.XXXXXX)"
	local ranger_cmd=(
		command
		ranger
		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
	)
	
	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
	command rm -f -- "$tempfile" 2>/dev/null
}


#EOF
