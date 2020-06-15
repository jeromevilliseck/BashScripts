#!/bin/bash

#Compression de fichiers au format pdf avec options sur l'ensemble du dossier ou est placé le script
#entry represente chacun des fichiers du repertoire courant
#Necessite l'installation préalable de ghostscript : sudo apt install ghostscript
echo "pdf compression ? enter dpi (72/150/300)" dpiChoice
for entry in `pwd`/*
do
  if [[ $entry == *".pdf"* ]]
  then
      if [ $dpiChoice == 72 ]
      then
        echo -e "\ncompression of $entry in $dpiChoice dpi"
        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$entry" "$entry"
        rm "$entry"  
      else [ $dpiChoice == 150 ]
        echo -e "\ncompression of $entry in $dpiChoice dpi"
        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$entry" "$entry"
        rm "$entry"  
      else [ $dpiChoice == 300 ]
        echo -e "\ncompression of $entry in $dpiChoice dpi"
        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$entry" "$entry"
        rm "$entry"  
      fi
  fi
done
#Pour l'extraction d'une partie spécifique du nom de fichier :
#https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
