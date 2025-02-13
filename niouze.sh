#!/bin/bash
# 
#  Production de news aléatoires de la forme :

#  1/99 [2025-02-11 11:10:06]  32695 fiabilité=1/5 source:[Agence France-Presse] info:[ Le tigre  décongèle une pomme pour le diner. Curieux, non ? ]
#  2/99 [2025-02-11 11:10:08]  14110 fiabilité=4/5 source:[Le Gorafi] info: [ J'ai un scoop : la girafe espère des cornichons. C'est normal. ]




# grok pattern pour logstash :
# %{NUMBER:numero:int}/%{NUMBER:maxi:int} \[%{DATA:@timestamp:timestamp}\]  %{WORD:random:int} %{WORD:klef:int} fiabilité=%{WORD:fiabilite:int}\/5 source:\[%{GREEDYDATA:source}\] info:\[ %{GREEDYDATA:niouze}\ ]

END=${BOUCLE_MAX:-10}
DELAI_MINIMUM=${BOUCLE_DELAI:-1}
OUTPUT=${BOUCLE_LOGFILENAME:-niouze.log}
echo "**** boucle2.sh **** boucle de 1 à $END, Delai=$DELAI_MINIMUM, logfile=$OUTPUT" | tee --append $OUTPUT

TABMEDIA=( "Mediapart" "Le Dauphiné Libéré" "Agence France-Presse" "EuroNiouze" "New-York Times" "La Libre Belgique" "The Daily Telegraph" "La Gazetta dello Sport" "Le Gorafi" )
NBMEDIA=${#TABMEDIA[@]}


TABINTRO=( "Depuis toujours," "Nouveauté," "Jacques a dit :" "On entend souvent que" "Vous n'ignorez pas que" "Comme vous le savez," "Alerte info :" "J'ai un scoop :" "Mesdames et Messieurs," "Ecoutez ça :" "On vient d'appendre que "  "De source sûre, " "Nouvelle polémique :")
NBINTRO=${#TABINTRO[@]}

TABSUJET=( "le renard" "la panthèse des neiges" "le loup" "le lion" "le veau" "le lézard" "l'aigle royal" "la girafe"  "le singe hurleur" "le guépard" "la grenouille" "le boa constrictor" "le tigre du Bengale" "le lapin" "le Dalaï-Lama" "le boeuf"  "le Comte de Monte-Christo" "la Baronne de la Tronche-en-Biais" )
NBSUJET=${#TABSUJET[@]}

TABVERBE=( "mange" "conseille" "déconseille" "cuisine" "stocke" "adore" "déteste" "congèle" "décongèle" "commande" "réclame" "espère" "redoute" "s'autorise" "interdit" "voudrait bien" "refuse"  "accepte" "dénigre" "apprécie" "grignote" )
NBVERBE=${#TABVERBE[@]}

TABCOD=( "du lapin" "du veau" "du boeuf" "les cuisses de grenouille à la persillade" "les tripes à la mode de Caen" "les bugnes épaisses à la moutarde" "un éclair à la vanille" "un chou à la crème" "un tiramisu vanille-potiron" "un pokeball au boeuf" "un steack végétarien" "une banane pas trop mûre" "une pomme un peu flétrie"  "une pomme golden"  "une pomme de terre" "de la moutarde" "des cornichons" "une soupe de potiron" "une pizza banane/moutarde" "une pizza vanille/lapin" "un gros gateau d'anniversaire"  "un pokeball végétarien au boeuf")
NBCOD=${#TABCOD[@]}

TABCCT=( "chaque matin" "au petit-déjeuner" "pour la collation de 10 heures" "pour midi" "pour le goûter" "pour le diner" "pour le souper" "avant de se coucher" "en cas d'insomnie" "sauf l'hiver" "surtout l'été" "en cas de canicule" "vers 20 heures" "s'il en reste" "le jour de Noël" "quand il neige" "chaque semaine" "au moins une fois par semaine" "pour son anniversaire")
NBCCT=${#TABCCT[@]}

TABREF=( "C'est très bizarre, non ?" "C'est inadmissible !" "C'est normal." "Qu'en pensez-vous ?"  "Curieux, non ?" "Très surprenant !" "ça n'étonne personne." "On s'y attendait tous." "C'était prévisible." "Une bien triste nouvelle." "Voilà qui promet..." "Pas sûr que le monde s'en porte mieux.")
NBREF=${#TABREF[@]}

for ((i=1;i<=END;i++)); do
    RND=$RANDOM
    K=$(( $RND % 6 ))
	FIAB=$(( 1 + ($RND % 5) ))
    XINTRO=$(($RANDOM % $NBINTRO))
    XSUJET=$(($RANDOM % $NBSUJET))
    XVERBE=$(($RANDOM % $NBVERBE))
    XCOD=$(($RANDOM % $NBCOD))
    XCCT=$(($RANDOM % $NBCCT))
    XREF=$(($RANDOM % $NBREF))
    XMEDIA=$(($RANDOM % $NBMEDIA))
	TEXTE="[ ${TABINTRO[$XINTRO]} ${TABSUJET[$XSUJET]} ${TABVERBE[$XVERBE]} ${TABCOD[$XCOD]} ${TABCCT[$XCCT]}. ${TABREF[$XREF]} ]"
    echo "$i/$END [$(date "+%Y-%m-%d %H:%M:%S")]  $RND $K fiabilité=${FIAB}/5 source:[${TABMEDIA[$XMEDIA]}] info:$TEXTE" | tee --append $OUTPUT
    DELAI=$(( $K + $DELAI_MINIMUM ))
    sleep $DELAI
done
echo "FIN"

