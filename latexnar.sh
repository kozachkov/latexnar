#!/bin/bash

VERSION=0.02
TYPE='GENERAL'

function print_help {
    echo "latexnar ($VERSION) - создание образцов для набора в Латех"
    echo
    echo "  -t {TYPE} - указать вид образца"
    echo "      TYPE: GENERAL|ARTICLE|SLIDES|PRESENTATION"
    echo "  -h  - вывести справку по использованию"
    echo "  -v  - сведение о выпуске"
    echo "  -l  - справка по Латех"
    echo
    echo "Создатель: Михаил Козачков"
}

function print_latex_help {
    echo "pdflatex -shell-escape File.tex  - для получения .pdf"
    echo
    echo "Управление pdflatex"
    echo
    echo "  x  - для выхода при неудачном запуске pdflatex"
}

while getopts "hvlt:" arg; do
  case $arg in
    t)
      TYPE=${OPTARG}
      ;;
    v)
      echo $VERSION
      ;;
    l)
      print_latex_help
      exit
      ;;
    h)
      print_help
      exit
      ;;
  esac
done

# Получим месторасположение исполняемого файла
SRC=$(readlink ${BASH_SOURCE[0]})
DIR="$(cd "$(dirname $SRC)" >/dev/null 2>&1 && pwd)"

# Скопируем необходимые файлы шаблонов в папку из которой был вызов
# в зависимости от вида

if [[ "$TYPE" == 'GENERAL' ]]; then

    cp $DIR/General.tex $PWD
    cp -r $DIR/sections $PWD
    cp -r $DIR/images $PWD

elif [[ "$TYPE" == 'ARTICLE' ]]; then

    cp $DIR/Article.tex $PWD
    cp -r $DIR/sections $PWD
    cp -r $DIR/images $PWD

elif [[ "$TYPE" == 'SLIDES' ]]; then

    cp $DIR/Slides.tex $PWD
    cp -r $DIR/sections $PWD
    cp -r $DIR/images $PWD

elif [[ "$TYPE" == 'PRESENTATION' ]]; then

    cp $DIR/Presentation.tex $PWD
    cp -r $DIR/sections $PWD
    cp -r $DIR/images $PWD
fi

echo "Готово"
exit
