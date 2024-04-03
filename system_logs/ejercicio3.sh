#!/bin/bash

# Función para imprimir el menú de ayuda
print_help() {
    echo "Uso: $0 [-h] [-m MODE] [-d DATE]"
    echo "  -h           Mostrar este menú de ayuda"
    echo "  -m MODE      Modo de funcionamiento del informe: servidor_web, base_de_datos, proceso_batch, aplicación, monitoreo"
    echo "  -d DATE      Especifica la fecha en formato año-mes-día (ejemplo: 2024-03-08)"
    exit 0
}

# Variables por defecto
MODE=""
DATE=""

# Procesar las opciones de línea de comandos
while getopts ":hm:d:" opt; do
    case $opt in
        h)
            print_help
            ;;
        m)
            MODE=$OPTARG
            ;;
        d)
            DATE=$OPTARG
            ;;
        \?)
            echo "Opción inválida: -$OPTARG" >&2
            print_help
            ;;
        :)
            echo "Opción -$OPTARG requiere un argumento." >&2
            print_help
            ;;
    esac
done

# Validar que se haya especificado al menos una opción
if [ -z "$MODE" ] && [ -z "$DATE" ]; then
    echo "Debe especificar al menos una opción." >&2
    print_help
fi

# Extraer archivos de log del zip
unzip -q system_logs.zip

# Generar informe según las opciones proporcionadas
if [ ! -z "$MODE" ] && [ -z "$DATE" ]; then
    grep ".* $MODE .*" *.log
elif [ ! -z "$MODE" ] && [ ! -z "$DATE" ]; then
    grep "^\[$DATE\] .* $MODE .*" *.log
elif [ -z "$MODE" ] && [ ! -z "$DATE" ]; then
    grep "^\[$DATE\]" *.log
fi

# Eliminar archivos de log
for file in *.log; do
    rm "$file"
done
