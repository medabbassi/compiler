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
      echo `ls -lrt $* | awk '{print $5,$6,$7,$8}'`
    else echo "fichier introuvable"    
    fi 
}
menuTextuell(){

while [[ $choix -ne 8 ]]
do
    echo "usage   of compiler.sh  "
    echo "Usage of [1-8] filename"
    echo "1 : prend un nom de fichier en c et retour son dernier date de modi et son nom"
    echo "2 : supprime le nom d exucutable"
    echo "3: compile c file with gcc "
    echo "4: evoque loption - g  de  c compiler "
    echo "5: evoque loption -w de c compiler "
    echo "6 : activer le menu graphique"
    echo "7 : afficher detailed help menu "
    echo "-8: afficher nom auther et version code"
read -p "Donner un choix compris entre 1 et 8  " choix

case  $case in 
    1) forTouch $2
     ;;
    2) supprimerFicher $2 
    ;;
    3) runCfichier $2 
     ;;
    4) debugCode $2
     ;;
    5)  warnCode $2 
    ;;
    6) lancerYad ;;
    7) HELP
    ;;
    8)  showAuthorsAndVerion
    ;;
    *) exit ;;
   esac
    shift
    done 
    
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
    echo "operation succés"

 }

 #Warn 
 warnCode(){
     echo `gcc -W   $*`
     echo "operation succés"


 }

 # 
 afficherFile(){
 FILE=$2
if [ -f "$FILE" ]; then
     basename FILE .c;
     date -r FILE;
    echo "operation succés"

else 
    echo "$FILE does not exist."
fi

 }


 #clean 
supprimerFicher(){
  
    if [ -f $* ];
    then   
        rm -rf  echo `basename "$*" .c`
        rm -rf a.out
        echo "operation succés"

    else echo "fichier introuvable"    
    fi 
}
runCfichier(){
     if [ -f $* ];
    then 
        gcc -O2  $*
        echo "operation succés"

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
 action=$(yad --width 500  --title "Gere fichier C" \
   --image=gnome-shutdown  --button="gtk-ok:0" --button="gtk-close:1" \

   --form --columns=2 --item-separator=","  \
    --field = "Choisi un action:":CB "help, showAuthorsAndVersion, debugCode, supprimerFichier, runCFile, warnCode, forTouch, show_usage" \
   --field ="nom de fichier":CE 
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







 

