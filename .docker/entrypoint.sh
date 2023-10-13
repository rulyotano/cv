echo "Compiling resume";
cd /var/build;
sed -i -e "s/<<email1>>/$EMAIL/g" $1;
sed -i -e "s/<<phone1>>/$PHONE/g" $1;
pdflatex $1;
echo "Done...";