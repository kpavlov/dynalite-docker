alias aws="/usr/bin/aws"

(source /initdb.sh)&

node node_modules/.bin/dynalite --createTableMs 0 --deleteTableMs 0 --updateTableMs 0 --port 8000
