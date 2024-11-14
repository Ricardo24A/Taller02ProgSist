#!/bin/bash
#recibe como parametro la ubicacion,verifica si el archivo existe y si no, pedira una nueva ubicación hasta que se ingrese la correcta
if[-z "$1"]; then
  echo "Debe proporcionar la ubicación de un archivo como parametro"
  exit 1
fi

location="$1"

until [-f "$location"]; do
  echo "El archivo no existe en la ubicación especificada. Ingrese una nueva ubicación: "
  read location
done

echo "Archivo encontrado en $location"

dir=$(dirname "$location")

ls -l --inode "$directory" > "$directory" > "$directory/original.txt"
