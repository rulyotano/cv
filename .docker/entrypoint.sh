#!/usr/bin/env bash

echo "Compiling resume";
cd /var/build;

echo "Printing Secrets";

for secret in $(echo $SECRETS | tr ";" "\n")
do
  key=$(echo $secret | cut -d '=' -f1);
  value=$(echo $secret | cut -d '=' -f2);
  sed -i -e "s/<<$key>>/$value/g" $1;
done;

pdflatex $1;
echo "Done...";