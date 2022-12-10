#!/bin/bash

if [[ $# -eq 0 ]]; then
	/bin/echo -n "Enter the name of subject: "
	read SUBJECT
else
	SUBJECT=$1
fi

case $SUBJECT in
	0)
		open https://cdn.intra.42.fr/pdf/pdf/67995/en.subject.pdf # module 0
		;;
	1)
		open https://cdn.intra.42.fr/pdf/pdf/67999/en.subject.pdf # module 1
		;;
  	2)
		open https://cdn.intra.42.fr/pdf/pdf/68002/en.subject.pdf # module 2
    	;;
  	3)
		open https://cdn.intra.42.fr/pdf/pdf/68006/en.subject.pdf # module 3
    	;;
  	4)
		open https://cdn.intra.42.fr/pdf/pdf/68008/en.subject.pdf # module 4
    	;;
  	5)
		open https://cdn.intra.42.fr/pdf/pdf/68010/en.subject.pdf # module 5
    	;;
  	6)
		open https://cdn.intra.42.fr/pdf/pdf/68012/en.subject.pdf # module 6
    	;;
  	7)
		open https://cdn.intra.42.fr/pdf/pdf/68015/en.subject.pdf # module 7
    	;;
  	8)
		open https://cdn.intra.42.fr/pdf/pdf/68019/en.subject.pdf # module 8
    	;;
    containers)
    	open https://cdn.intra.42.fr/pdf/pdf/68022/en.subject.pdf # containers
    	;;
    irc)
    	open https://cdn.intra.42.fr/pdf/pdf/68024/en.subject.pdf # irc
    	;;
    inception)
    	open https://cdn.intra.42.fr/pdf/pdf/68026/en.subject.pdf # inception
    	;;
    tsan)
		open https://cdn.intra.42.fr/pdf/pdf/68029/en.subject.pdf # tsan
		;;
esac
