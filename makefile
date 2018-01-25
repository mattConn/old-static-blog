BLOGCHECK = if [ ! -d blog ]; then mkdir blog; fi;
TMPCHECK = if [ ! -d src/tmp ]; then mkdir src/tmp; fi;
PP = lib/preprocessor
PP-MD = markdown

assets:
	 cp -r src/assets ./
	
# For "blog" and "pages" tasks:
# process markdown,
# remove <div>'s guarding include directives,
# then include files.
blog: src/blog/* src/includes/blog/*
	$(TMPCHECK)\
	$(BLOGCHECK)\
	rm blog/*;\
	cd src/blog;\
	for f in *.html; do $(PP-MD) $$f > ../tmp/$$f; done;\
	cd ../tmp;\
	sed -i 's/<div>//g' *.html;\
	for f in *.html; do ../../$(PP) $$f > ./$$f.tmp; done;\
	for f in *.tmp; do ../../$(PP) $$f > ../../blog/$$f; done;\
	cd ../../blog; rename 's/.tmp//g' *;
	cd ..; rm -rf tmp

# second for loop: processes nested directives in includes
pages: src/pages/*
	$(TMPCHECK)\
	rm *.html;\
	cd src/pages;\
	for f in *.html; do $(PP-MD) $$f > ../tmp/$$f; done;\
	cd ../tmp;\
	sed -i 's/<div>//g' *.html;\
	for f in *.html; do ../../$(PP) $$f > ./$$f.tmp; done;\
	for f in *.tmp; do ../../$(PP) $$f > ../../$$f; done;\
	cd ../..; rename 's/.tmp//g' *;
	rm -rf src/tmp

all: assets blog pages

clean:
	rm -rf blog assets; rm *.html
