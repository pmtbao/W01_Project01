#!/bin/bash

mlr --icsv --opprint cut -f genres tmdb-movies.csv > genres.csv

IFS=$'\n'
arr_genres=( $(tail -n +2 genres.csv | cut -d ',' -f1) )

for genre in ${arr_genres[@]}
do
	IFS='|'
	tmp=( $genre )
	for i in ${tmp[@]}
	do
		genres+=($i)
	done
done


echo "genres" > genres-1.csv
for genre in ${genres[@]}:
do
	echo $genre
done >> genres-1.csv

#sed -i -e 's/"/'\''/g' genre-1.csv
#sed -i -e 's/-//g' genre-1.csv

mlr --icsv --opprint stats1 -a count -f genres -g genres genres-1.csv | less -S
unset genres
