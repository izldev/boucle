#!/bin/bash
# 
#  Production de logs style :
#
#    1/10 [2025-02-12 13:17:05] canard orange 10285 K=1 Parfait
#    2/10 [2025-02-12 13:17:07] bouc rouge 5025 K=3 Attention
#    3/10 [2025-02-12 13:17:11] lapin jaune 5996 K=2 Formidable
#    4/10 [2025-02-12 13:17:14] corbeau beige 14943 K=3 Attention
#    5/10 [2025-02-12 13:17:18] frelon beige 29306 K=2 Formidable
#
# ou news aléatoires de la forme :

#  1/99 [2025-02-11 11:10:06]  32695 fiabilité=1/5 source:[Agence France-Presse] info:[ Le tigre  décongèle une pomme pour le diner. Curieux, non ? ]
#  2/99 [2025-02-11 11:10:08]  14110 fiabilité=4/5 source:[Le Gorafi] info: [ J'ai un scoop : la girafe espère des cornichons. C'est normal. ]

FMT=${BOUCLE_FORMAT:-SIMPLE}

echo "entree.sh ;  variable BOUCLE_FORMAT = $BOUCLE_FORMAT"
echo "   valeur 'SIMPLE' pour des logs simples "
echo "   valeur 'NIOUZE' pour des logs de type news "

if [[ "$FMT" == "SIMPLE" ]]; then
   /tmp/boucle.sh
else
   if [[ "$FMT" == "NIOUZE" ]]; then
      /tmp/niouze.sh
   else
      echo "valeur incorrecte pour BOUCLE_FORMAT"
   fi
fi

