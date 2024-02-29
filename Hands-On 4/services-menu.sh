# Función para listar el contenido de un fichero (carpeta)
listar_contenido() {
    read -p "Introduce la ruta absoluta al fichero o carpeta: " ruta
    ls "$ruta"
}

# Función para crear un archivo de texto con una línea de texto
crear_archivo() {
    read -p "Introduce la cadena de texto a almacenar en el archivo: " texto
    echo "$texto" > nuevo_archivo.txt
    echo "Se ha creado el archivo nuevo_archivo.txt con el siguiente contenido:"
    cat nuevo_archivo.txt
}

# Función para comparar dos archivos de texto
comparar_archivos() {
    read -p "Introduce la ruta absoluta al primer archivo: " archivo1
    read -p "Introduce la ruta absoluta al segundo archivo: " archivo2
    diff "$archivo1" "$archivo2"
}

# Función para mostrar el uso del comando awk
uso_awk() {
    echo "Ejemplo de uso de awk: Mostrar las primeras 3 líneas de un archivo"
    read -p "Introduce la ruta absoluta al archivo: " archivo
    awk 'NR<=3' "$archivo"
}

# Función para mostrar el uso del comando grep
uso_grep() {
    echo "Ejemplo de uso de grep: Buscar la palabra 'hola' en un archivo"
    read -p "Introduce la palabra a buscar: " palabra
    read -p "Introduce la ruta absoluta al archivo: " archivo
    grep "$palabra" "$archivo"
}

# Menú principal
while true; do
    echo "====== MENU ======"
    echo "1. Listar contenido de un fichero"
    echo "2. Crear un archivo de texto con una línea de texto"
    echo "3. Comparar dos archivos de texto"
    echo "4. Uso de awk"
    echo "5. Uso de grep"
    echo "6. Salir"

    read -p "Elige una opción: " opcion

    case $opcion in
        1)
            listar_contenido
            ;;
        2)
            crear_archivo
            ;;
        3)
            comparar_archivos
            ;;
        4)
            uso_awk
            ;;
        5)
            uso_grep
            ;;
        6)
            echo "Saliendo del programa..."
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, elige una opción del menú."
            ;;
    esac
done
