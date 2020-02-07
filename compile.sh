SHELL=/bin/bash

curl https://api.csswg.org/bikeshed/ \
		       --output index.html \
		       --write-out "%{http_code}" \
		       --header "Accept: text/plain, text/html" \
		       -F die-on=nothing \
		       -F file=@index.bs) && \
[[ "$$HTTP_STATUS" -eq "200" ]]) || ( \
	echo ""; cat index.html; echo ""; \
	rm -f index.html; \
	exit 22 \

