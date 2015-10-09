runserver:
	hugo --buildDrafts --verboseLog=true -v
	hugo server --watch --buildDrafts --verboseLog=true -v --baseUrl="" --theme=hyde

deploy:
	rm -rf public/*
	/usr/local/bin/hugo -s . -b 'https://friendorfoe.stage.ccnmtl.columbia.edu/' \
	&& s3cmd --acl-public --delete-removed --no-progress sync --no-mime-magic --guess-mime-type public/* s3://friendorfoe.stage.ccnmtl.columbia.edu/

s3-deploy:
	rm -rf public/
	/usr/local/bin/hugo -s . -b 'https://friendorfoe.ccnmtl.columbia.edu/'# \
	#&& mv public/json/index.html public/js/api/cases.json \
	#&& s3cmd --acl-public --delete-removed --no-progress sync --no-mime-magic --guess-mime-type public/* s3://casestudies.ccnmtl.columbia.edu/