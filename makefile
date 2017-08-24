ROOTCHECK = if [ ! -d root ]; then mkdir -p root/blog; fi;

assets:
	$(ROOTCHECK) cp -r src/assets root/;
	
blog:
	$(ROOTCHECK) sh blog.sh

pages:
	$(ROOTCHECK) sh pages.sh

all: assets blog pages

clean:
	rm -rf root
