#!/bin/bash

# Some arguments. You have to modify the right size and do not put any spaces anywhere.
DIR=/tmp/lettergenerator/
NAMESURNAME=NAMESURNAME
TEMPLATEFILE=template.orig.odt

# This is an internal variable.
SOURCEDIR=source

if [ ! -d "$DIR" ]; then
	mkdir $DIR
fi
if [ ! -e "$DIR/template.odt" ]; then
	cp $TEMPLATEFILE $DIR/template.odt
fi
if [ ! -d "$DIR/$SOURCEDIR" ]; then
	cd $DIR
	unzip template.odt -d $SOURCEDIR
	cd -
fi

IFS=$'\n';
for name in `cat names.txt`
do
	unzip -p template.orig.odt content.xml|sed -e "s/$NAMESURNAME/$name/">$DIR/$SOURCEDIR/content.xml
	cd $DIR/$SOURCEDIR/
	zip "$DIR/template.odt" content.xml
	cd -
	cp "$DIR/template.odt" "$DIR/icdm_2012_invitation_${name// /_}.odt"
	cat mail.txt|sed -e "s/$NAMESURNAME/$name/">$DIR/mail_${name// /_}.txt
done
cd "$DIR"
libreoffice --headless --convert-to pdf *.odt
cd -

