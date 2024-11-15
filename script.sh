#!/bin/bash
#recibe como parametro la ubicacion,verifica si el archivo existe y si no, pedira una nueva ubicación hasta que se ingrese la correcta
if[-z "$1"]; then
  echo "Debe proporcionar la ubicación de un archivo como parametro"
  exit 1
fi

#se designa el parametro como la variable ubicación
location="$1"

#pide una ubicación hasta que esta exista
until [-f "$location"]; do
  echo "El archivo no existe en la ubicación especificada. Ingrese una nueva ubicación: "
  read location
done

echo "Archivo encontrado en $location"

#asigna el directorio de la ubicación proporcionada
dir=$(dirname "$location")

#guarda el primer archivo con los detalles del directorio
ls -l --inode "$dir" > "$dir/original.txt"

echo "Archivo original.txt ha sido creado con el listado de archivos y carpetas"

#Se ejecutan los cambios en los permisos

echo "Cambiando permisos de archivos en el directorio principal"
find "$dir" -maxdepth 1 -type f -exec chmod 743 {} \;

echo "Cambiando permisos de archivos en los subidrectorios"
find "$dir" -mindepth 2 -type f -exec chmod 542 {} \;

#se guarda el nuevo archivo con los cambios y los detalles de los subdirectorios

ls -lR --inode "$dir" > "$dir/final.txt"

echo "Archivo final.txt ha sido creado con el listado de archivos y carpetas en el directorio y subdirectorios"

