SHELL=/bin/bash

if curl https://api.csswg.org/bikeshed/ -F file=@index.bs -F force=1 -F die-on=nothing > index.html
then echo "Bikeshed Processing Successful"
else echo "Bikeshed Processing Failed"
fi

