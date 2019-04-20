grep -P '^[^/]*/[^/]*$' # only one / by line
sort daily-dn-union.txt | uniq -u > daily-dn.txt # sort and deduplicate file
awk 'BEGIN { FS = "," } ; { print $3 }' < $f | sed s/\"//g >> /cygdrive/f/domain-names/daily-dn5.txt # read csv & remove quotes 

#replace character
echo $chaine | sed -e "s/ /_/g"
