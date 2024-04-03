#!/bin/bash

# Menú de ayuda:
imprimir_menu() {
    echo "Uso: ejercicio3.sh [-h] [-m MODE] [-d DATE]"
    echo "  -h           Imprimir este menú de ayuda"
    echo "  -m MODE      Modo de funcionamiento del informe: servidor_web, base_de_datos, proceso_batch, aplicación, monitoreo"
    echo "  -d DATE      Especifica la fecha en el formato año-mes-día (ejemplo: 2024-03-08)"
}

# Generar el informe
generar_reporte() {
    local mode="$1"
    local date="$2"

    if [ -n "$mode" ]; then
        if [ -n "$date" ]; then
            # Informe con modo y fecha especificados
            grep "ERROR \[$mode\]" log_"$date".log | while read -r line; do
                echo "Fecha: $date"
                echo "$line" | cut -d' ' -f2,3,5-
            done
        else
            # Informe solo con modo especificado
            grep "ERROR \[$mode\]" log_*.log | while read -r line; do
                echo "$line" | cut -d' ' -f1,2,4,6-
            done
        fi
    elif [ -n "$date" ]; then
        # Informe solo con fecha especificada
        grep "ERROR" log_"$date".log | while read -r line; do
            echo "$line" | cut -d' ' -f1,2,4,6-
        done
    fi
}

# Procesar opciones con ayuda del comando getopts
while getopts ":hm:d:" opt; do
    case ${opt} in
        h )
            print_help
            exit 0
            ;;
        m )
            mode="$OPTARG"
            ;;
        d )
            date="$OPTARG"
            ;;
        \? )
            echo "La opción no es valida, intente después: -$OPTARG" >&2
            print_help
            exit 1
            ;;
        : )
            echo "La opción -$OPTARG necesita un argumento valido." >&2
            print_help
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

# Llamado a la funcion para generar el informe
generar_reporte "$mode" "$date"
