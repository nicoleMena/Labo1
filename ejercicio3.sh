#!/bin/bash
# Para el menu se implementa:
print_help() {
    echo "Uso: $0 [-h] [-m MODE] [-d DATE]"
    echo "  -h        Imprime menú de ayuda"
    echo "  -m MODE   Especifique el modo de funcionamiento del informe: servidor_web, base_de_datos, proceso_batch, aplicación, monitoreo"
    echo "  -d DATE   Especifique la fecha (ejemplo: 2024-03-08)"
}

# Para generar el reporte, la funcion:
generate_report() {
    if [ -n "$mode" ] && [ -n "$date" ]; then
        grep "ERROR.$mode.$date" log_*.log | while read -r line; do
            echo "Fecha: $(echo $line | cut -d' ' -f1)"
            echo "Hora del Error: $(echo $line | cut -d' ' -f2)"
            echo "Descripción del Error: $(echo $line | cut -d' ' -f5-)"
        done
    elif [ -n "$mode" ]; then
        grep "ERROR.$mode" log_.log | while read -r line; do
            echo "Fecha: $(echo $line | cut -d' ' -f1)"
            echo "Hora del Error: $(echo $line | cut -d' ' -f2)"
            echo "Descripción del Error: $(echo $line | cut -d' ' -f5-)"
        done
    elif [ -n "$date" ]; then
        grep "ERROR.$date" log_.log | while read -r line; do
            echo "Fecha: $(echo $line | cut -d' ' -f1)"
            echo "Hora del Error: $(echo $line | cut -d' ' -f2)"
            echo "Descripción del Error: $(echo $line | cut -d' ' -f5-)"
        done
    else
        echo "Especificar al menos un modo (-m MODE) o una fecha (-d DATE)."
        exit 1
    fi
}

while getopts ":hm:d:" opt; do
    case ${opt} in
        h)
            print_help
            exit 0
            ;;
        m)
            mode=$OPTARG
            ;;
        d)
            date=$OPTARG
            ;;
        \?)
            echo "Opción inválida: -$OPTARG" >&2
            print_help
            exit 1
            ;;
        :)
            echo "La opción -$OPTARG requiere un argumento." >&2
            print_help
            exit 1
            ;;
    esac
done

generate_report()
