#!/bin/bash
END=${BOUCLE_MAX:-10}
DELAI_MINIMUM=${BOUCLE_DELAI:-1}
OUTPUT=${BOUCLE_LOGFILENAME:-baratin.log}
echo "**** boucle.sh **** boucle de 1 à $END, Delai=$DELAI_MINIMUM, logfile=$OUTPUT" | tee --append $OUTPUT
TABMSG=( "Tout va bien" "Parfait"  "Formidable" "Attention"  "Aïe!"  "Ouille..." )
for ((i=1;i<=END;i++)); do
    RND=$RANDOM
    K=$(( $RND % 6 ))
    echo "$i/$END : date=$(date) : random=$RND : K=$K : Message=${TABMSG[$K]}" | tee --append $OUTPUT
    DELAI=$(( 2 * $K + $DELAI_MINIMUM ))
    sleep $DELAI
done
echo "FIN"


