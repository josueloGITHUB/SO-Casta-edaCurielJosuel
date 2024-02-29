# Crear un archivo de texto llamado mytext y agregar la cadena "Hola Mundo"
echo "Hola Mundo" > mytext

# Desplegar el contenido del archivo mytext en la terminal
echo "Contenido del archivo mytext:"
cat mytext

# Crear un directorio llamado backup
mkdir backup

# Mover el archivo mytext al directorio backup
mv mytext backup/

# Listar el contenido del directorio backup
echo "Contenido del directorio backup:"
ls backup

# Eliminar el archivo mytext del directorio backup
rm backup/mytext

# Eliminar el directorio backup
rmdir backup
