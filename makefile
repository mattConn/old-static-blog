BLOGCHECK = if [ ! -d blog ]; then mkdir blog; fi;
PP = lib/finc

assets:
	 cp -r src/assets ./
	
blog: src/blog/*
	$(BLOGCHECK) cd src/blog; for f in *.html; do ../../$(PP) $$f > ../../blog/$$f; done

pages:
	cd src; for f in *.html; do ../$(PP) $$f > ../$$f; done;

all: assets blog pages

clean:
	rm -rf blog assets; rm *.html
