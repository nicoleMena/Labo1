# !/bin/bash
nombre_proceso=$1  
comando_proceso=$2  

# Funciones necesarias
obtener_ID_proceso() {
    pgrep -l "$nombre_proceso" | awk -v np="$nombre_proceso" '$2 == np {print $1}'
}


obtener_estado_proceso() {
    ps aux | awk '$2 == '"$1"' {print $8}'
}


#usando un ciclo while
while true
do
    id_proceso=$(obtener_ID_proceso)  
    if [ -n "$id_proceso" ] 
    then
        estado_proceso=$(obtener_estado_proceso "$id_proceso")  
        echo "El proceso $nombre_proceso con PID $id_proceso se esta ejecutando y su estado es $estado_proceso"
    else
        echo "El proceso $nombre_proceso no se esta ejecutando, se va a iniciar"
        $comando_proceso & > /dev/null  
        sleep 6
        id_proceso=$(obtener_ID_proceso)  
        estado_proceso=$(obtener_estado_proceso "$id_proceso")  
        echo "El proceso ha sido levantado, su estado es $estado_proceso"
    fi
    sleep 7  
done

