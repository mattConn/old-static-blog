DISTCHECK = if [ ! -d dist ]; then mkdir dist; fi;
BLOGCHECK = if [ ! -d dist/blog ]; then mkdir dist/blog; fi;
TMPCHECK = if [ ! -d src/tmp ]; then mkdir src/tmp; fi;

ROOT_DIR = $(CURDIR)
TMP = $(ROOT_DIR)/src/tmp
DIST = $(ROOT_DIR)/dist

PP = $(ROOT_DIR)/lib/preprocessor
PP-MD = markdown

assets:
	 cp -r src/assets ./
	
# For "blog" and "pages" tasks:
# process markdown,
# remove <div>'s guarding include directives,
# then include files.
blog: src/blog/* src/includes/blog/*
	$(DISTCHECK)\
	$(TMPCHECK)\
	$(BLOGCHECK)\
	rm dist/blog/*;\
	cd src/blog;\
	for f in *.html; do $(PP-MD) $$f > $(TMP)/$$f; done;\
	cd $(TMP);\
    sed -i 's/<div>//g' *.html;\
    for f in *.html; do $(PP) $$f > ./$$f.tmp; done;\
    for f in *.tmp; do $(PP) $$f > $(DIST)/blog/$$f; done;\
    cd $(DIST)/blog; rename 's/.tmp//g' *;\
	rm -rf $(TMP)


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
