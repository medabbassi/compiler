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
    
      ;;
  # ...

  # Special cases
    --)
      break
      ;;
    --*)
      # error unknown (long) option $1
      ;;
    -?)
      # error unknown (short) option $1
      ;;

  # FUN STUFF HERE:
  # Split apart combined short options
    -*)
      split=$1
      shift
      set -- $(echo "$split" | cut -c 2- | sed 's/./-& /g') "$@"
      continue
      ;;

  # Done with options
    *)
      break
      ;;
  esac

  # for testing purposes:
  echo "$1"

  shift
done
	

else show_usage
fi







