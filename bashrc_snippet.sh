export PS1="\W ✨ "


_prompt() {
	emoji="✅"
	string="$BASH_COMMAND"
	cmd=$(echo "$string" | cut -d" " -f1)
	
	case $cmd in
		cd | ls | pwd | mkdir | mv) emoji="📂" ;;
		vi | nano | vim | emacs) emoji="✏️" ;;
		clang | make) emoji="🛠️ ";;
		python | py | python3) emoji="🐍";;
		brew) emoji="🍺";;
		rm | trash) emoji="🔥";;
		git) emoji="🔶";;
		sudo) emoji="🔑";;
		awk | sed | grep | egrep) emoji="🔍";;
		ftp | sftp | ssh | ping | nc) emoji="🌐";;
		cat | more | less) emoji="📚";;
		touch) emoji="✋";;
		rustc | cargo | rustfmt) emoji="🦀";;
		lldb) emoji="🔧";;
		echo) emoji="📢";;
		bash | sh | ksh | csh | tcsh | zsh) emoji="🐚";;
		*) emoji="✅";;
	esac

	pth=$(pwd)
	sliced="${pth##*/}"
	len=${#sliced}
	if [[ $pth == $HOME ]]; then
		len=1
	fi
	printf "\e[s\e[1A\e[$(expr $len + 2)G$emoji \e[u\n"

}
trap "_prompt" DEBUG
