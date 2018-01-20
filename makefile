BLOGCHECK = if [ ! -d blog ]; then mkdir blog; fi;

assets:
	 cp -r src/assets ./
	
blog: src/blog/*
	$(BLOGCHECK) cd src/blog; for f in *.html; do ../../lib/finc $$f > ../../blog/$$f; done

pages:
	 sh pages.sh

all: assets blog pages

clean:
	rm -rf blog assets; rm *.html
