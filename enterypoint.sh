#!/bin/bash

#cd /opt/bin
#for f in *; do
#  echo "File -> $f"
# mkdir "$f"_dockerfolder
# mv "$f" "$f"_dockerfolder
#done
#exit 1



cd /go/src/extmggit.manzanagroup.ru/camp/json2sql
go get ./...
CGO_ENABLED=0 go build -ldflags "-s -w" -o json2sqlbeego
cp  json2sqlbeego /opt/bin/
cd /go/src/extmggit.manzanagroup.ru/camp/connectors
go get ./...
sed -i -e 's/\r$//' lin-lin-build.sh
./lin-lin-build.sh
cp ./out/* /opt/bin
cd /go/src/extmggit.manzanagroup.ru/camp/campbke
go get ./...
cd /go/src/extmggit.manzanagroup.ru/camp/campbke/build/lin/lin
sed -i -e 's/\r$//' main.sh
apt update && apt install dos2unix  -y
dos2unix ./*.sh
./main.sh
cp ./out/* /opt/bin/

apt update && apt install rename -y
#rename 'y/A-Z/a-z/' *
#rename 's/-//' *
cd /opt/bin
for f in *; do
  echo "File -> $f"
 mkdir "$f"_dockerfolder
 mv "$f" "$f"_dockerfolder
done

