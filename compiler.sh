#!/bin/bash
 
#la fonction show_usage qui affiche sur la sortie standard le message
show_usage()
{
    echo "compiler.sh : [-h|--help] [-T] [-t] [-n] [-N] [-d] [-m] [-s] chemin.." ;

}

#tester la presence d'un argument ou affiche un erreur
tester(){
if [[ $# -eq 0 ]] ;
then
    echo "pas d'argument";
else
     echo "argument exist" ;
fi
}




#onction nommée HELP qui permet d’afficher le help à partir d’n fichier texte 
 HELP(){
    cat ./help.txt;
 }
 # function pour afficher menu textuelle 
 Menu(){
    echo "-----";
 }
 # 

 

