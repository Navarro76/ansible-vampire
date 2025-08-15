# Rol Ansible: multimedia

Este rol configura un entorno multimedia funcional para el usuario `alex`, incluyendo la instalación de aplicaciones y la configuración personalizada de MPD (Music Player Daemon) como servicio de usuario.

## Estructura del rol

- `tasks/install_common.yml`: instala los siguientes paquetes multimedia:
  - `sonata`, `ncmpcpp`, `mpd`, `smplayer`, `mpc`
- `tasks/config_root.yml`: 
  - Desactiva servicios `mpd` del sistema (`mpd.service` y `mpd.socket`)
  - Agrega al usuario `mpd` a los grupos `alex` y `audio`
- `tasks/config_alex.yml`: 
  - Configura MPD como servicio de usuario (`systemd --user`)
  - Establece permisos y crea los directorios requeridos
  - Copia la configuración personalizada `~/.mpd/mpd.conf`

## Requisitos

- Ansible ejecutándose como usuario con privilegios (`become: true`)
- El usuario `alex` debe existir en el sistema
- Se recomienda habilitar el entorno persistente para servicios `systemd --user`:
  
  ```bash
  sudo loginctl enable-linger alex

