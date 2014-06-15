_req()
{
	local cur prev opts args
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	subcommand="${COMP_WORDS[1]}"

	#
	# Complete the subcommands
	#
	opts="--version --help"
	# The 'help' command is ommitted below to prevent it showing up in itself
	subcommands="add init log new rm show status tag trace"

	#
	# Complete arguments for the subcommands
	#
	case "${subcommand}" in
	add)
		opts=
		COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
		;;
	help)
		COMPREPLY=( $(compgen -W "${subcommands}" -- ${cur}) )
		;;
	init)
		opts="--help"
		COMPREPLY=( $(compgen -f -d -W "${opts}" -- ${cur}) )
		;;
	log)
		opts=
		COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
		;;
	new)
		opts="--help --id"
		COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
		;;
	rm)
		local reqs="$( find -type f -name '[[:digit:]]' )"
		COMPREPLY=( $(compgen -W "${reqs}" -- ${cur}) )
		;;
	show)
		local reqs="$( find -type f -name '[[:digit:]]' )"
		COMPREPLY=( $(compgen -W "${reqs}" -- ${cur}) )
		;;
	status)
		local opts="$(compgen -C 'git status' )"
		COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
		;;
	tag)
		opts=
		COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
		;;
	trace)
		opts="--help --in --out"
		local reqs="$( find -type f -name '[[:digit:]]' )"
		COMPREPLY=( $(compgen -W "${opts} ${reqs}" -- ${cur}) )
		;;
	*)
		COMPREPLY=( $(compgen -W "${opts} ${subcommands} help" -- ${cur}) )
		;;
	esac

	return 0
}
complete -F _req req
