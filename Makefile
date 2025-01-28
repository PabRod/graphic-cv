PAGES_BRANCH=gh-pages
MAIN=main
SLIDES_DIR=./../Slides/

all: update-slides

create-gh-pages:
    git checkout --orphan $(PAGES_BRANCH)
    git rm -rf .
    git commit --allow-empty -m "Initial commit of gh-pages"
    git push origin $(PAGES_BRANCH)
    git checkout $(MAIN)

update-slides:
    git checkout $(PAGES_BRANCH)
    rsync -av --delete --exclude '.git/' $(SLIDES_DIR) ./
    git add .
    git commit -m "Automatic slides update"
    git push origin $(PAGES_BRANCH)
    git checkout $(MAIN)

.PHONY: all create-gh-pages update-slides