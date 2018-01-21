BLOGCHECK = if [ ! -d blog ]; then mkdir blog; fi;
TMPCHECK = if [ ! -d src/tmp ]; then mkdir src/tmp; fi;
PP = lib/finc
PP-MD = markdown

assets:
	 cp -r src/assets ./
	
# process markdown, then include files
blog: src/blog/*
	$(TMPCHECK)\
	$(BLOGCHECK)\
	cd src/blog;\
	for f in *.html; do $(PP-MD) $$f > ../tmp/$$f; done;\
	cd ../tmp;\
	for f in *.html; do ../../$(PP) $$f > ../../blog/$$f; done;\
	cd ..; rm -rf tmp

pages:
	$(TMPCHECK)\
	cd src/pages;\
	for f in *.html; do $(PP-MD) $$f > ../tmp/$$f; done;\
	cd ../tmp;\
	for f in *.html; do ../../$(PP) $$f > ../../$$f; done;\
	cd ..; rm -rf tmp

all: assets blog pages

clean:
	rm -rf blog assets; rm *.html
