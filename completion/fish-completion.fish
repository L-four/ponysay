# Completions for ponysay
# https://github.com/erkin/ponysay/
#
# Author: Elis Axelsson <etu AT elis DOT nu>

if test $TERM = "linux"
	set -g systempath /usr/share/ponysay/ttyponies/
	set -g homepath   ~/.local/share/ponysay/ttyponies/
else
	set -g systempath /usr/share/ponysay/ponies/
	set -g homepath   ~/.local/share/ponysay/ponies/
end


if test -d $systempath
	set -g systemponies (ls --color=no $systempath | sed -e 's/\.pony//' -e 's/_.*//' | perl -pe 's/([a-z])([A-Z])/\1\\\ \2/' )
end

if test -d $homepath
	set -g homeponies   (ls --color=no $homepath   | sed -e 's/\.pony//' -e 's/_.*//' | perl -pe 's/([a-z])([A-Z])/\1\\\ \2/' )
end


complete -c ponysay -s h --description "Help of ponysay"
complete -c ponysay -s v --description "Version of ponysay"
complete -c ponysay -s l --description "List pony files"
complete -c ponysay -s f -a "$homeponies $systemponies" --description "Ponyfile"
complete -c ponysay -s W -a "Integer" --description "The screen column where the message should be wrapped"


set -e systempath
set -e homepath
set -e systemponies
set -e homeponies

