#!/bin/bash
. ./compiler.sh

if [ $# -gt 0 ];then
while test $# -gt 0
do
  case $1 in

    -h | --help)
  
      HELP
      ;;
    -v | --version)
    showAuthorsAndVerion
      ;;
    --debug)
        debugCode $2
    ;; 

    --clean)
        supprimerFicher $2
       
    ;; 
    --cc)
      runCfichier $2 
    ;;
    --warni)
      warnCode $2
    ;;
    --touch)
      forTouch $2
    ;;
    -m)
    menuTextuell
    ;;
    -g) lancerYad
    ;;
  # ...

  # Special cases
    --)
      break
      ;;
    --*)
          show_usage
      ;;
    -?)
          show_usage
      ;;

  
    -*)
      split=$1
      shift
      set -- $(echo "$split" | cut -c 2- | sed 's/./-& /g') "$@"
      continue
      ;;

    *)
      break
      ;;
  esac

  
 
  shift
done
	

else show_usage
fi







