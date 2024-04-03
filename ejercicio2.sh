#!/bin/bash
# Parte A
# Verificar si se proporcionan dos strings como parámetros
if [ $# -ne 2 ]; then
    echo "Uso: $0 <nombre_usuario> <nombre_grupo>"
    exit 1
fi

nuevo_usuario=$1
nuevo_grupo=$2

echo "Nuevo usuario: $nuevo_usuario"
echo "Nuevo grupo: $nuevo_grupo"

# Verificar si el usuario ya existe
if id "$nuevo_usuario" &>/dev/null; then
    echo "El usuario $nuevo_usuario ya existe."
else
    # Crear el nuevo usuario
    sudo adduser --disabled-password --gecos "" "$nuevo_usuario"
    echo "El usuario $nuevo_usuario ha sido creado."
fi

#Parte b

# Verificar si se proporcionan dos strings como parámetros
if [ $# -ne 2 ]; then
    echo "Uso: $0 <nombre_usuario> <nombre_grupo>"
    exit 1
fi

nuevo_usuario=$1
nuevo_grupo=$2

echo "Nuevo usuario: $nuevo_usuario"
echo "Nuevo grupo: $nuevo_grupo"

# Verificar si el usuario ya existe
if id "$nuevo_usuario" &>/dev/null; then
    echo "El usuario $nuevo_usuario ya existe."
else
    # Crear el nuevo usuario
    sudo adduser --disabled-password --gecos "" "$nuevo_usuario"
    echo "El usuario $nuevo_usuario ha sido creado."
fi


# Parte C

 #!/bin/bash

# Verificar si se proporcionan dos strings como parámetros
if [ $# -ne 2 ]; then
    echo "Uso: $0 <nombre_usuario> <nombre_grupo>"
    exit 1
fi

nuevo_usuario=$1
nuevo_grupo=$2

echo "Nuevo usuario: $nuevo_usuario"
echo "Nuevo grupo: $nuevo_grupo"

# Verificar si el usuario ya existe
if id "$nuevo_usuario" &>/dev/null; then
    echo "El usuario $nuevo_usuario ya existe."
else
    # Crear el nuevo usuario
    sudo adduser --disabled-password --gecos "" "$nuevo_usuario"
    echo "El usuario $nuevo_usuario ha sido creado."
fi

# Verificar si el grupo ya existe
if grep -q "^$nuevo_grupo:" /etc/group; then
    echo "El grupo $nuevo_grupo ya existe."
else
    # Crear el nuevo grupo
    sudo addgroup "$nuevo_grupo"
    echo "El grupo $nuevo_grupo ha sido creado."
fi


# Parte D
# Verificar si se proporcionan dos strings como parámetros
if [ $# -ne 2 ]; then
    echo "Uso: $0 <nombre_usuario> <nombre_grupo>"
    exit 1
fi

nuevo_usuario=$1
nuevo_grupo=$2

echo "Nuevo usuario: $nuevo_usuario"
echo "Nuevo grupo: $nuevo_grupo"

# Verificar si el usuario ya existe
if id "$nuevo_usuario" &>/dev/null; then
    echo "El usuario $nuevo_usuario ya existe."
else
    # Crear el nuevo usuario
    sudo adduser --disabled-password --gecos "" "$nuevo_usuario"
    echo "El usuario $nuevo_usuario ha sido creado."
fi

# Verificar si el grupo ya existe
if grep -q "^$nuevo_grupo:" /etc/group; then
    echo "El grupo $nuevo_grupo ya existe."
else
    # Crear el nuevo grupo
    sudo addgroup "$nuevo_grupo"
    echo "El grupo $nuevo_grupo ha sido creado."
fi

# Agregar el nuevo usuario al grupo
sudo usermod -aG "$nuevo_grupo" "$nuevo_usuario"

# Agregar tu usuario predeterminado al grupo
sudo usermod -aG "$nuevo_grupo" "$(whoami)"

echo "Los usuarios $USER y $nuevo_usuario han sido agregados al grupo $nuevo_grupo."

# Parte e
#!/bin/bash

# Verificar si se proporcionan dos strings como parámetros
if [ $# -ne 2 ]; then
    echo "Uso: $0 <nombre_usuario> <nombre_grupo>"
    exit 1
fi

nuevo_usuario=$1
nuevo_grupo=$2

echo "Nuevo usuario: $nuevo_usuario"
echo "Nuevo grupo: $nuevo_grupo"

# Verificar si el usuario ya existe
if id "$nuevo_usuario" &>/dev/null; then
    echo "El usuario $nuevo_usuario ya existe."
else
    # Crear el nuevo usuario
    sudo adduser --disabled-password --gecos "" "$nuevo_usuario"
    echo "El usuario $nuevo_usuario ha sido creado."
fi

# Verificar si el grupo ya existe
if grep -q "^$nuevo_grupo:" /etc/group; then
    echo "El grupo $nuevo_grupo ya existe."
else
    # Crear el nuevo grupo
    sudo addgroup "$nuevo_grupo"
    echo "El grupo $nuevo_grupo ha sido creado."
fi

# Agregar el nuevo usuario al grupo
sudo usermod -aG "$nuevo_grupo" "$nuevo_usuario"

# Agregar tu usuario predeterminado al grupo
sudo usermod -aG "$nuevo_grupo" "$(whoami)"

echo "Los usuarios $USER y $nuevo_usuario han sido agregados al grupo $nuevo_grupo."

# Asignar permisos de ejecución del script ejercicio1.sh al grupo
chmod g+x ejercicio1.sh

# Establecer el propietario del script ejercicio1.sh al nuevo usuario y al grupo creado
sudo chown "$nuevo_usuario:$nuevo_grupo" ejercicio1.sh

echo "Se han asignado permisos de ejecución del script ejercicio1.sh al grupo $nuevo_grupo."
