#!/bin/bash
#recibe como parametro la ubicacion,verifica si el archivo existe y si no, pedira una nueva ubicación hasta que se ingrese la correcta
while true; do
    read -p "Ingrese la ubicacion del directorio: " ubicacion
    if [ -d "$ubicacion" ]; then
        echo "Ubicacion válida: $ubicacion"
        break
    else
        echo "La ubicación no es válida. Inténtelo de nuevo."
    fi
done

# Codigo para crear el archivo original.txt en el nivel superior de la ubicación
archivo_original="$ubicacion/original.txt"
echo "Creando el listado original en $archivo_original"
find "$ubicacion" -exec stat -c "%A ID: %i Nombre: %n" {} \; > "$archivo_original"

# Codigo para cambiar permisos para archivos en el directorio raíz
find "$ubicacion" -maxdepth 1 -type f -exec chmod 743 {} \;

# Codigo para cambiar permisos para archivos en subdirectorios
find "$ubicacion" -mindepth 2 -type f -exec chmod 542 {} \;

# Codigo para crear el archivo final.txt en el nivel superior de la ubicación
archivo_final="$ubicacion/final.txt"
echo "Creando el arhivo final en $archivo_final"
find "$ubicacion" -exec stat -c "%A ID: %i Nombre: %n" {} \; > "$archivo_final"

echo "El proceso esta completo. Se han generado los archivos original.txt y final.txt en $ubicacion."
