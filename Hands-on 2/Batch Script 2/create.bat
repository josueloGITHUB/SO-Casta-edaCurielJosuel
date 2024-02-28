@echo off

echo Creando archivo de texto mytext.txt con el contenido "Hola Mundo"...
echo Hola Mundo > mytext.txt

echo.
echo Contenido de mytext.txt:
type mytext.txt

echo.
echo Creando el subdirectorio backup...
mkdir backup

echo.
echo Copiando el archivo mytext.txt al subdirectorio backup...
copy mytext.txt backup

echo.
echo Listando el contenido del subdirectorio backup...
dir backup

echo.
echo Eliminando el archivo mytext.txt del subdirectorio backup...
del backup\mytext.txt

echo.
echo Eliminando el subdirectorio backup...
rmdir /s /q backup

echo.
echo Todas las operaciones se han completado.

pause
