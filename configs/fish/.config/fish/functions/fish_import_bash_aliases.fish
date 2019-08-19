function fish_import_bash_aliases
	for a in (grep "^alias" $HOME/.bash_aliases)
set aname (echo $a | sed 's/alias \(.*\)=\(\'\|\"\).*/\1/')
set command (echo $a | sed 's/alias \(.*\)=\(\'\|\"\)\(.*\)\2/\3/'); alias $aname $command
end
end
