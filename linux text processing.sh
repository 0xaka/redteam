#https://learnbyexample.gitbooks.io/command-line-text-processing/
#Cat, Less, Tail and Head
#grep
#sed
#cut
#awk
    awk 'BEGIN { FS = "," } ; { print $3 }' < $f | sed s/\"//g >> file.txt # read csv & remove quotes
#sort
#uniq
#dif
