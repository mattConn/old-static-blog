cd src/blog;
for f in *.html
do
../../lib/finc $f > ../../root/blog/$f
done
