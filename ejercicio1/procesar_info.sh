#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 <ID del proceso>"
    exit 1
fi

PID=$1

if ! ps aux | awk '{print $2}' | grep -wq "$PID"; then
    echo "El proceso con ID $PID no existe."
    exit 1
fi

PROC_INFO=$(ps aux | grep -w "$PID" | head -n 1)

PROC_NAME=$(echo "$PROC_INFO" | awk '{print $11}')

PROC_ID=$PID

PPID=$(echo "$PROC_INFO" | awk '{print $3}')

OWNER=$(echo "$PROC_INFO" | awk '{print $1}')

CPU_USAGE=$(echo "$PROC_INFO" | awk '{print $3}')

MEMORY_USAGE=$(echo "$PROC_INFO" | awk '{print $4}')

STATUS=$(echo "$PROC_INFO" | awk '{print $8}')

EXEC_PATH=$(readlink -f /proc/$PID/exe 2>/dev/null)

# Informacion obtenida por el codigo:
echo "Nombre del proceso es: $PROC_NAME"
echo "ID del proceso es: $PROC_ID"
echo "Parent process ID es: $PPID"
echo "Usuario propietario es: $OWNER"
echo "Porcentaje de uso de CPU es: $CPU_USAGE%"
echo "Consumo de memoria es: $MEMORY_USAGE%"
echo "Estado es: $STATUS"
if [ -n "$EXEC_PATH" ]; then
    echo "Path del ejecutable es: $EXEC_PATH"
else
    echo "Path del ejecutable: No esta disponible"
fi
#fin del codigo
