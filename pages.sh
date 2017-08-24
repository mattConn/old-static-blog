cd src;
for f in *.html
do
../lib/finc $f > ../root/$f
done
