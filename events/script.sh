#!/bin/bash
current='            "timestamp": '$(date +%s000)',' 
sed "s/.*timestamp.*/$current/" events/log.json > events/log_current.json
gzip -k events/log_current.json
data=$(cat events/log_current.json.gz | base64)
echo -e '{\n  "awslogs": {' > events/current_event.json
echo -e '    "data": "'$data'"' >> events/current_event.json
echo -e '  }\n}' >> events/current_event.json
rm events/log_current.json.gz