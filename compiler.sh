#!/bin/bash
 
#la fonction show_usage qui affiche sur la sortie standard le message
show_usage()
{
    echo "compiler.sh : [-h|--help] [-T] [-t] [-n] [-N] [-d] [-m] [-s] chemin.." ;

}


forTouch() {
   
     if [ -f $* ];
    then 
      echo `basename $* .c`
      echo `ls -lrt $* | awk '{print $5 $6 $7 $8}'`
    else echo "fichier introuvable"    
    fi 
}
menuTextuell(){
    echo "usage   of compiler.sh "
    echo "--touch : prend un nom de fichier en c et retour son dernier date de modi et son nom"
    echo "--clean : supprime le nom d exucutable"
    echo "--cc: compile c file with gcc "
    echo "--debug: evoque loption - g  de  c compiler "
    echo "--warni: evoque loption -w de c compiler "
    echo "-g : activer le menu graphique"
    echo "-h : afficher detailed help menu "
    echo "-v: afficher nom auther et version code"
    echo "-m: afficher un menuin textuelle"

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

    echo `gcc -g   $*`

 }

 #Warn 
 warnCode(){
    echo `gcc -W   $*`

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
  
    if [ -f $* ];
    then 
        echo "-----> this is --> $*"+$* 
        rm -rf  echo `basename "$*" .c`
        rm -rf a.out
    else echo "fichier introuvable"    
    fi 
}
runCfichier(){
     if [ -f $* ];
    then 

        gcc -O2  $*
    else echo "fichier introuvable"    
    fi 
}

returnFileName(){
    echo "--> this is the file name $*"
}

showAuthorsAndVerion(){
    if [ -e README ]  ; then 
        echo ` cat README | cut -d'-' -f2 -s`
        echo `cat README |grep  version`
    else echo "le fichier readme doesn't exist"
    fi 
}

lancerYad(){
 action=$(yad --width 500 --file --confirm-overwrite  --entry --title "Gere fichier C" \
   --image=gnome-shutdown  --button="gtk-ok:0" --button="gtk-close:1" \
   --list \
   --text \
    "Choisi un action:" --entry-text "help" "showAuthorsAndVersion" "debugCode" "supprimerFichier" "runCFile"  "warnCode" "forTouch" "show_usage" \
   --text \
    "donner le nom de votre fichier:" 
   )
ret=$?

[[ $ret -eq 1 ]] && exit 0

if [[ $ret -eq 2 ]] ; then
   gdmflexiserver --startnew &
   exit 0
fi

case $action in
   help*) eval exec ./main.sh -h ;;
   showAuthorsAndVersion*) eval exec ./main.sh -v;;
   debugCode*) eval exec ./main.sh --debug  ;; 
   supprimerFichier*) eval exec ./main.sh --clean ;;
   runCFile*) eval exec ./main.sh -cc ;;
   warnCode*) eval exec ./main.sh --warni ;;
   forTouch*) eval exec ./main.sh --touch ;;
  
   *) exit 1 ;;
esac


}







 

