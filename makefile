BLOGCHECK = if [ ! -d blog ]; then mkdir blog; fi;
PP = lib/finc
PP-MD = markdown

assets:
	 cp -r src/assets ./
	
# process markdown, then include files
blog: src/blog/*
	mkdir src/tmp;\
	$(BLOGCHECK)\
	cd src/blog;\
	for f in *.html; do $(PP-MD) $$f > ../tmp/$$f; done;\
	cd ../tmp;\
	for f in *.html; do ../../$(PP) $$f > ../../blog/$$f; done;\
	cd ..; rm -rf tmp

pages:
	cd src; for f in *.html; do ../$(PP) $$f > ../$$f; done;

all: assets blog pages

clean:
	rm -rf blog assets; rm *.html
