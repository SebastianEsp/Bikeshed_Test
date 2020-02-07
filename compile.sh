SHELL=/bin/bash

local: index.bs
	bikeshed --die-on=nothing spec index.bs

index.bs: index.bs
	@ (HTTP_STATUS=$$(curl https://api.csswg.org/bikeshed/ \
	                       --output index.html \
	                       --write-out "%{http_code}" \
	                       --header "Accept: text/plain, text/html" \
	                       -F die-on=nothing \
	                       -F file=@index.bs) && \
	[[ "$$HTTP_STATUS" -eq "200" ]]) || ( \
		echo ""; cat index.html; echo ""; \
		rm -f index.html; \
		exit 22 \
	);

remote: index.html

ci: index.bs
	mkdir -p out
	make remote
	mv index.html out/index.html

clean:
	rm index.html
	rm -rf out
