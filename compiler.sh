#!/bin/bash
 
#la fonction show_usage qui affiche sur la sortie standard le message
show_usage()
{
    echo "compiler.sh : [-h|--help] [-T] [-t] [-n] [-N] [-d] [-m] [-s] chemin.." ;

}

#tester la presenceS d'un argument ou affiche un erreur
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
 # -v afficher le nom des auteeurs et version de code 
 getUserNameAndCodeVersion(){


 }

 #debug 
 debugCode(){
     debugResult = `gcc -g $@`;
    echo $debugResult;

 }

 #Warn 
 warnCode(){
     warnResult =`gcc -W $@` ;
     echo $warnResult;
 }

 # 
 afficherFile(){
 FILE=$#
if [ -f "$FILE" ]; then
     basename FILE .c;
     date -r FILE;
else 
    echo "$FILE does not exist."
fi

 }


 #clean 
supprimerFicher(){
    file =  $1
    if [ -e "$file"]
    then 
    base=$(basename "$file" .c)
    rm -rf "$base"
    echo "fichier suprrimer "

}








 

