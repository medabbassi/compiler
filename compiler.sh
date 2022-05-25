#!/bin/bash
 
#la fonction show_usage qui affiche sur la sortie standard le message
show_usage()
{
    echo "compiler.sh : [-h|--help] [-T] [-t] [-n] [-N] [-d] [-m] [-s] chemin.." ;

}






#onction nommée HELP qui permet d’afficher le help à partir d’n fichier texte 
 HELP(){
    cat ./help.txt;
 }
 # function pour afficher menu textuelle 
 Menu(){
    echo "-----";
 }
 # -v afficher le nom des auteeurs et version de code 
 

 #debug 
 debugCode(){
     debugResult = `gcc -g $2`;
    echo $debugResult;

 }

 #Warn 
 warnCode(){
     warnResult =`gcc -W $2` ;
     echo $warnResult;
 }

 # 
 afficherFile(){
 FILE=$2
if [ -f "$FILE" ]; then
     basename FILE .c;
     date -r FILE;
else 
    echo "$FILE does not exist."
fi

 }


 #clean 
supprimerFicher(){
    file =  $@
    echo "-----> this is --> $file"+$file
    if [ -e $file]
    then 
    echo "---------> $file"
    echo `basename "$@" .c`
    #rm -rf $base
    echo "fichier suprrimer "
    fi 
}

showAuthorsAndVerion(){
    if [ -e README ]  ; then 
        echo ` cat README | cut -d'-' -f2 -s`
        echo `cat README |grep  version`
    else echo "le fichier readme doesn't exist"
    fi 
}








 

