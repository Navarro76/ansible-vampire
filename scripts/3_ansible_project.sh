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
echo "Configurando proyecto de Ansible..."

# Verificar si git está instalado, si no, instalarlo
echo "Verificando e instalando git..."
if ! command -v git &> /dev/null; then
    echo "Instalando git (requiere privilegios sudo)..."
    sudo apt update
    sudo apt install git -y
fi

# Verificar si el entorno virtual existe
if [ ! -f "/home/ansible/venvs/ansible-env/bin/activate" ]; then
    echo "Error: El entorno virtual de Ansible no existe."
    echo "Ejecuta primero el script 2_ansible_env.sh"
    exit 1
fi

# Activar entorno virtual
source /home/ansible/venvs/ansible-env/bin/activate

# Crear directorio del proyecto
mkdir -p ~/ansible-project
cd ~/ansible-project

# Clonar el repositorio específico de la rama ansible-vm13-sway
echo "Clonando repositorio de Ansible (rama ansible-vm13-sway)..."
if git clone -b ansible-vm13-sway https://github.com/Navarro76/ansible-vampire.git; then
    echo "✓ Repositorio clonado exitosamente (rama ansible-vm13-sway)"
    cd ansible-vampire

    # Verificar que estamos en la rama correcta
    echo "Rama actual:"
    git branch

    # Verificar la estructura del proyecto
    echo "Estructura del proyecto:"
    ls -la

    # Verificar si existe el inventory y playbook
    if [ -d "inventory" ] && [ -f "inventory/hosts.ini" ]; then
        echo "✓ Archivo inventory/hosts.ini encontrado"
    else
        echo "⚠️  Advertencia: inventory/hosts.ini no encontrado"
    fi

    if [ -f "playbook.yml" ]; then
        echo "✓ playbook.yml encontrado"
    else
        echo "⚠️  Advertencia: playbook.yml no encontrado"
        echo "Archivos YAML disponibles:"
        ls *.yml 2>/dev/null || echo "No hay archivos YAML en el directorio"
    fi

else
    echo "✗ Error: No se pudo clonar el repositorio o la rama ansible-vm13-sway no existe"
    echo "Verifica:"
    echo "1. Conexión a internet"
    echo "2. Que la rama 'ansible-vm13-sway' exista en el repositorio"
    echo "3. Los permisos de acceso al repositorio"
    deactivate
    exit 1
fi

# Desactivar entorno virtual
deactivate

echo ""
echo "✅ Projecto de Ansible configurado correctamente"
echo "📦 Rama clonada: ansible-vm13-sway"
echo ""
echo "Para trabajar con el proyecto:"
echo "1. Ejecuta 'ansible-env' para activar el entorno virtual"
echo "2. Navega al directorio: cd ~/ansible-project/ansible-vampire"
echo "3. Verifica la rama: git branch"
echo "4. Verifica el inventory: cat inventory/hosts.ini"
echo "5. Ejecuta el playbook: ansible-playbook -i inventory/hosts.ini playbook.yml --tags \"common\""
