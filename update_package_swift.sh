#!/bin/bash

set -e
set -o pipefail

# Define la versión que deseas actualizar
VERSION="$1"

if [ -z "$VERSION" ]; then
    echo "Debes especificar una versión como argumento."
    exit 1
fi

PACKAGE_FILE="Package.swift"

if [ ! -f "$PACKAGE_FILE" ]; then
    echo "ERROR: no se encontró $PACKAGE_FILE en el directorio actual ($(pwd))."
    exit 1
fi

# Define la base de la URL para descargar los xcframeworks
BASE_URL="https://sdk-download.meetingdoctors.com/iOS/MeetingDoctorsSDK/$VERSION"

# Define los nombres de los binary targets
declare -a PACKAGE_TARGET_NAMES=("MeetingDoctorsSDK" "MeetingDoctorsSDK_Dynamic" "MeetingDoctorsSDK_NoAnalytics")
declare -a ZIP_BASENAMES=("MeetingDoctorsSDK" "MeetingDoctorsSDK_Dynamic" "MeetingDoctorsSDK_NoAnalytics")

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

cp "$PACKAGE_FILE" "$WORKDIR/Package.swift.orig"
trap 'echo "ERROR: fallo detectado, restaurando Package.swift original"; cp "$WORKDIR/Package.swift.orig" "$PACKAGE_FILE"; rm -rf "$WORKDIR"' ERR

# Comienza a actualizar Package.swift
for i in "${!PACKAGE_TARGET_NAMES[@]}"
do
    PACKAGE_TARGET_NAME="${PACKAGE_TARGET_NAMES[$i]}"
    ZIP_BASENAME="${ZIP_BASENAMES[$i]}"
    ZIP_FILE="${ZIP_BASENAME}.xcframework.zip"
    LOCAL_ZIP="${WORKDIR}/${ZIP_FILE}"

    URL="$BASE_URL/$ZIP_FILE"

    echo "Descargando $ZIP_FILE para calcular el checksum..."
    curl -f -o "$LOCAL_ZIP" "$URL"

    CHECKSUM=$(shasum -a 256 "$LOCAL_ZIP" | awk '{ print $1 }')
    echo "Checksum para $PACKAGE_TARGET_NAME ($ZIP_FILE): $CHECKSUM"

    sed -i '' "s|url: \".*/${ZIP_FILE}\"|url: \"${URL}\"|g" "$PACKAGE_FILE"
    sed -i '' "/name: \"${PACKAGE_TARGET_NAME}\",/,/checksum:/s|checksum: \".*\"|checksum: \"${CHECKSUM}\"|" "$PACKAGE_FILE"

    if ! grep -qF "$URL" "$PACKAGE_FILE"; then
        echo "ERROR: no se encontró/actualizó la URL para ${PACKAGE_TARGET_NAME} en ${PACKAGE_FILE}."
        echo "Verifica que el nombre del target y el formato del manifest coincidan con lo esperado."
        exit 1
    fi
    if ! grep -qF "$CHECKSUM" "$PACKAGE_FILE"; then
        echo "ERROR: no se encontró/actualizó el checksum para ${PACKAGE_TARGET_NAME} en ${PACKAGE_FILE}."
        exit 1
    fi
done

echo "Package.swift actualizado con éxito para la versión ${VERSION}."
