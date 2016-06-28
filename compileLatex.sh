#!/bin/bash

NAME=resume
OUTPUTDIR=build

if [ ! -d $OUTPUTDIR ]; then
  mkdir $OUTPUTDIR
fi

if [[ -z $1 ]];then
  echo "Generating the PDF file..."
  latexmk -pdf -output-directory=$OUTPUTDIR $NAME.tex
  if [ $? -eq 0 ]; then 
    echo "...PDF file generated..."
  else
    echo "FAIL" 
    exit $?; fi

  if [ -f "build/$NAME.pdf" ]; then
    echo "...moving it to the project directory"
    mv $OUTPUTDIR/$NAME.pdf .
  fi

else
  if [ "$1" == "clean" ]; then
    echo "Cleaning build directory"
    rm -rf $OUTPUTDIR/*
  else
    echo "Wrong input argument supplied"
    exit 1
  fi 
fi
