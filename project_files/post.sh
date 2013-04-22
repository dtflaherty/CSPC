#! /usr/bin/env bash

if [ "$#" -eq 0 ]; then
  echo "USAGE: ./post.sh server_ip"
else
  #TODO sed to replace 
  # s/&lt;![CDATA[/<![CDATA[/g
  # s/]]&gt;</field>/]]></field>/g

  curl http://$1:8080/solr/update?commit=true  -H "Content-Type: text/xml" --data-binary @add_doc.xml
fi


