# Rol Ansible: resources

Este rol instala y configura recursos de apariencia como temas, wallpapers, fuentes, configuración de GRUB y LightDM Web Greeter.

## Archivos esperados en `files/`:

- **mc/skin/**: Skins de Midnight Commander.
- **wallpapers/**: Imágenes a copiar a fondo de pantalla.
- **fonts/**: Fonts organizadas por destino.
- **lxappearance/**: Temas GTK y temas de iconos/cursor comprimidos.
- **web-greeter/**: Temas y configuración de LightDM Web Greeter.
- **grub/**: Tema y configuración para GRUB.

## Uso

```yaml
- hosts: localhost
  become: true
  roles:
    - resources
