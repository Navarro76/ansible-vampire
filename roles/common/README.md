# Rol Ansible: common

Este rol instala paquetes comunes y dependencias de entorno en sistemas Debian/Ubuntu. Incluye herramientas como `bspwm`, `zsh`, `git`, `vim`, `kitty`, entre otras.

## Variables

Puedes personalizar los paquetes usando las siguientes variables:

```yaml
common_env_packages:
  - build-essential
  - git
  - ...

common_extra_packages:
  - feh
  - scrot
  - ...
