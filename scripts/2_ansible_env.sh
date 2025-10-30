#!/bin/bash

# Verificar si estamos como usuario ansible
if [ "$USER" != "ansible" ]; then
    echo "Error: Este script debe ejecutarse como usuario ansible"
    echo "Usuario actual: $USER"
    echo "Para cambiar al usuario ansible, ejecuta:"
    echo "  su - ansible"
    exit 1
fi

echo "✓ Ejecutando como usuario ansible"
echo "Continuando con la configuración del entorno..."
echo "Configurando entorno de Ansible..."

# Instalar python3-venv si no está instalado
echo "Verificando e instalando python3-venv..."
if ! dpkg -l | grep -q python3-venv; then
    echo "Instalando python3-venv (requiere privilegios sudo)..."
    sudo apt update
    sudo apt install python3-venv -y
fi

# Crear directorio para entornos virtuales
mkdir -p ~/venvs
cd ~/venvs

# Crear entorno virtual
echo "Creando entorno virtual ansible-env..."
python3 -m venv ansible-env

# Verificar que el entorno se creó correctamente
if [ -f "/home/ansible/venvs/ansible-env/bin/activate" ]; then
    # Activar entorno virtual
    source /home/ansible/venvs/ansible-env/bin/activate

    # Actualizar pip e instalar ansible
    echo "Actualizando pip e instalando Ansible..."
    pip install --upgrade pip
    pip install ansible

    # Verificar instalación
    echo "Verificando instalación de Ansible..."
    ansible --version
    ansible localhost -m ping --connection=local

    # Desactivar entorno
    deactivate

    # Configurar alias en .bashrc
    echo "Configurando alias en .bashrc..."
    if ! grep -q "alias ansible-env" ~/.bashrc; then
        echo "alias ansible-env='source ~/venvs/ansible-env/bin/activate'" >> ~/.bashrc
    fi

    echo "Entorno de Ansible configurado correctamente"
    echo "Ejecuta 'ansible-env' para activar el entorno virtual"
    echo "O recarga tu shell con: source ~/.bashrc"
else
    echo "Error: No se pudo crear el entorno virtual"
    echo "Por favor, instala manualmente: sudo apt install python3-venv"
    exit 1
fi
