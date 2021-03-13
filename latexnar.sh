#!/bin/bash

VERSION=0.01

# Получим месторасположение исполняемого файла
SRC=$(readlink ${BASH_SOURCE[0]})
DIR="$(cd "$(dirname $SRC)" >/dev/null 2>&1 && pwd)"

# Скопируем необходимые файлы шаблонов в папку из которой был вызов
cp $DIR/Main.tex $PWD
cp -r $DIR/sections $PWD
cp -r $DIR/images $PWD

echo "Готово"
