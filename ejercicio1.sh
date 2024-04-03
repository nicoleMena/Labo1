#!/bin/bash

#Nicole Mena Porras C14663
# incisos de scripting y permisos - ejercicio1 1 del laboratorio


# Comprobando que se ingresa un archivo como parametro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo=$1

# Ahora comprobar si el archivo existe
if [ ! -e $archivo ]; then
    echo "Lo siento, el archivo mencionado $archivo no existe."
    exit 1
fi

# Permisos del archivo, y su almacenamiento en una variable
permisos=$(stat -c "%A" $archivo) #Aqui se aplicaron las recomendaciones de la guia; el comando

# Permisos para el usuario, grupos y otros usuarios
echo "Permisos del archivo $archivo:"
echo "Para_Usuarios: ${permisos:1:3}"
echo "Para_Grupos: ${permisos:4:3}"
echo "Para_OtrosUsuarios: ${permisos:7:3}"


get_permissions_verbose() {
    local permissions=$1
    user_permissions=${permissions:1:3}
    group_permissions=${permissions:4:3}
    other_permissions=${permissions:7:3}
}

# Verificar si el archivo cumple como parámetro valido
if [ $# -ne 1 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo=$1

# Verificar archivo existente, sino, dar error
if [ ! -e $archivo ]; then
    echo "Lo siento, el archivo mencionado $archivo no existe, no se pueden obtener los permisos."
    exit 1
fi


permisos=$(stat -c "%A" $archivo) # comando de la guia

# Llamado a la funcion creada recientemente para que se ejecute
get_permissions_verbose "$permisos"


get_permissions_verbose() {
    local permissions=$1
    user_permissions=${permissions:1:3}
    group_permissions=${permissions:4:3}
    other_permissions=${permissions:7:3}

    echo "Interpretación de permisos:"
    echo "Para_Usuarios: $(interpretar_permisos $user_permissions)"
    echo "Para_Grupos: $(interpretar_permisos $group_permissions)"
    echo "Para_OtrosUsuarios: $(interpretar_permisos $other_permissions)"
}

# Para interpretar los permisos:

interpretar_permisos() {
    local perms=$1
    interpretacion=""

    # Interpretación de permisos
    interpretacion+="$(if [[ "${perms:0:1}" == "r" ]]; then echo " r significa:Lectura "; fi)"
    interpretacion+="$(if [[ "${perms:1:1}" == "w" ]]; then echo " w significa:Escritura "; fi)"
    interpretacion+="$(if [[ "${perms:2:1}" == "x" ]]; then echo " x significa:Ejecución "; fi)"

    echo "$interpretacion"
}

# archivo como parámetro valido
if [ $# -ne 1 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo=$1

# el archivo existe o no, de lo contrario da error
if [ ! -e $archivo ]; then
    echo "Lo sentimos mucho, el archivo $archivo no existe."
    exit 1
fi

# Otros permisos del archivo 
permisos=$(stat -c "%A" "$archivo")

# Llamado a la funcion, fin del codigo
get_permissions_verbose "$permisos"


