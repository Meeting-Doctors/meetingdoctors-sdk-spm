#!/bin/bash

# Define la versión que deseas actualizar
VERSION="$1"

if [ -z "$VERSION" ]; then
    echo "Debes especificar una versión como argumento."
    exit 1
fi

# Define la base de la URL para descargar los xcframeworks
BASE_URL="https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/$VERSION"

# Define los nombres de los binary targets
declare -a TARGETS=("MeetingDoctorsCore" "MeetingDoctorsSchema" "MeetingDoctorsController" "MeetingDoctorsSocket" "MeetingDoctorsStorage" "MeetingDoctorsRemote" "MeetingDoctorsSDK")

# Comienza a actualizar Package.swift
for TARGET in "${TARGETS[@]}"
do
    # Construye la URL completa
    URL="$BASE_URL/$TARGET.xcframework.zip"
    
    # Descarga el archivo para calcular el checksum
    echo "Descargando $TARGET.xcframework.zip para calcular el checksum..."
    curl -O "$URL"

    # Calcula el checksum
    CHECKSUM=$(shasum -a 256 "$TARGET.xcframework.zip" | awk '{ print $1 }')
    echo "Checksum para $TARGET: $CHECKSUM"

    # Actualiza el Package.swift con la nueva URL y checksum
    sed -i '' "s|url: \".*\/$TARGET.xcframework.zip\"|url: \"$URL\"|g" Package.swift
    # sed -i '' "/name: \"$TARGET\",/,/checksum:/s|checksum: \".*\"|checksum: \"$CHECKSUM\"|" Package.swift
    perl -i -pe '$p = 1 if /name: "'"$TARGET"'"/; if($p && /url:.*\/'"$TARGET"'\.xcframework\.zip/) { $f = 1; } if($f && /checksum:/) { s/checksum: ".*"/checksum: "'"$CHECKSUM"'"/; $p = 0; $f = 0; }' Package.swift

    # Elimina el archivo descargado
    rm "$TARGET.xcframework.zip"
done

echo "Package.swift actualizado con éxito para la versión $VERSION."
