WHAT?
=====

This simple script basically substitute a text in an ODT document and generate a PDF of it. It is initially coded to prepare invitation letters. That's the reason it also prepares a customized mail text. It can be further developed to send the letters automatically.

HOW?
====

0. *This is before first use* First you have to prepare a template letter in odt format. Feel free to customize the sample. You can use any image or any formatting. There are two important things to keep in mind:

  - Script searchs for the word NAMESURNAME 
  - in a file called template.orig.odt 

  These are both customizable in the script if you want to go an extra mile.

1. Put each name as a new line into the file names.txt
2. Run generate.sh

This will create a folder /tmp/lettergenerator/ and put the customized odt, pdf and mail text files into that folder. It is safe to delete this folder when you are done with the generated files.

REMARKS
=======

- Somehow pdf conversion does not work if the libreoffice is already running.
- Fields like Automatic date is also updated.
