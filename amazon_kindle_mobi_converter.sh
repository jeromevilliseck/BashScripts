#!/bin/bash

#Conversion de fichiers au format epub en fichiers au format mobi sur l'ensemble du dossier ou est placé le script
#entry represente chacun des fichiers du repertoire courant
#Necessite l'installation préalable de calibre : sudo apt-get install calibre
for entry in `pwd`/*
do
  if [[ $entry == *".epub"* ]]
  then
      echo -e "\nconversion of $entry in ${entry%.*}.mobi"
      ebook-convert "$entry" "${entry%.*}.mobi"
      rm "$entry"
  fi
done
#Pour l'extraction d'une partie spécifique du nom de fichier :
#https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
