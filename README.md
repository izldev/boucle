# boucle
A simple docker image generating random logs

## Usage
docker run boucle:v0.1

## Output

**** boucle.sh **** boucle de 1 à 10, Delai=1, logfile=baratin.log
1/10 : date=Fri Jan 31 10:14:56 AM CET 2025 : random=21667 : K=1 : Message=Parfait
2/10 : date=Fri Jan 31 10:14:59 AM CET 2025 : random=4008 : K=0 : Message=Tout va bien
3/10 : date=Fri Jan 31 10:15:00 AM CET 2025 : random=18986 : K=2 : Message=Formidable
4/10 : date=Fri Jan 31 10:15:05 AM CET 2025 : random=26744 : K=2 : Message=Formidable
5/10 : date=Fri Jan 31 10:15:10 AM CET 2025 : random=3378 : K=0 : Message=Tout va bien
6/10 : date=Fri Jan 31 10:15:11 AM CET 2025 : random=32109 : K=3 : Message=Attention
7/10 : date=Fri Jan 31 10:15:18 AM CET 2025 : random=18671 : K=5 : Message=Ouille...

## Parameters

The script can be configured with environment variables :

BOUCLE_MAX  : number of lines generated before the container exit  (default = 10)

BOUCLE_DELAI : minimal delay (in seconds) between each line emission  (default = 1)

BOUCLE_LOGFILENAME : file name where the output is written  (default = /baratin.log)


