#!/bin/bash

# ========== CREACIÓN DE USUARIO ANSIBLE ==========

echo "=== Creando usuario Ansible ==="

# 1. Verificar si estamos como root
if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse como root o con sudo"
    exit 1
fi

# 2. Actualizar e instalar sudo
echo "Actualizando lista de paquetes..."
apt update > /dev/null 2>&1

echo "Instalando sudo..."
apt install sudo -y > /dev/null 2>&1

# 3. Verificar si el usuario ya existe
if id "ansible" &>/dev/null; then
    echo "El usuario 'ansible' ya existe. Actualizando contraseña..."
else
    echo "Creando usuario 'ansible'..."
    useradd -m -s /bin/bash ansible
fi

# 4. Establecer contraseña
echo "Estableciendo contraseña para el usuario 'ansible'..."
echo "ansible:admin" | chpasswd

# ========== CONFIGURACIÓN DE SUDOERS ==========

echo "Configurando permisos sudo sin password..."

# 1. Agregar includedir a /etc/sudoers si no existe
if ! grep -q "^@includedir /etc/sudoers.d" /etc/sudoers; then
    echo "Agregando @includedir a /etc/sudoers..."
    echo "@includedir /etc/sudoers.d" >> /etc/sudoers
fi

# 2. Crear directorio /etc/sudoers.d si no existe
mkdir -p /etc/sudoers.d

# 3. Crear archivo de configuración para ansible
echo "Creando configuración sudo sin password..."
cat > /etc/sudoers.d/99-ansible-nopasswd << EOF
# Configuración para Ansible
ansible ALL=(ALL) NOPASSWD:ALL
alex ALL=(ALL) NOPASSWD:ALL
EOF

# 4. Establecer permisos seguros (440)
chmod 440 /etc/sudoers.d/99-ansible-nopasswd

# ========== VERIFICACIONES y RECOMENDACIONES ==========

# 1. Validar la sintaxis de sudoers
echo "Validando configuración sudo..."
if visudo -c; then
    echo "✓ Configuración sudo aplicada correctamente"
else
    echo "✗ Error: Sintaxis incorrecta en archivos sudoers"
    exit 1
fi

# 2. Verificar que todo se realizó correctamente
echo "Verificando la creación del usuario..."
if id "ansible" &>/dev/null; then
    echo "✓ Usuario 'ansible' creado exitosamente"
    echo "✓ Contraseña establecida: admin"
    echo "✓ Usuario agregado al grupo sudo"

    # Mostrar información del usuario
    echo ""
    echo "Información del usuario:"
    echo "-----------------------"
    grep ansible /etc/passwd
    groups ansible
else
    echo "✗ Error: No se pudo crear el usuario 'ansible'"
    exit 1
fi

# 3. Recomendaciones
echo ""
echo "Para cambiar al usuario ansible, ejecuta:"
echo "  su - ansible"
echo "  (usar contraseña: admin)"
echo ""
echo "Para mayor seguridad cambia la contraseña con sudo passwd ansible"
