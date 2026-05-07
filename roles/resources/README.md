# Rol Ansible: resources

Este rol instala y configura recursos de apariencia como temas, wallpapers, fuentes y configuración de GRUB.

## Archivos esperados en `files/`:

- **mc/skin/**: Skins de Midnight Commander.
- **wallpapers/**: Imágenes a copiar a fondo de pantalla.
- **fonts/**: Fonts organizadas por destino.
- **lxappearance/**: Temas GTK y temas de iconos/cursor comprimidos.
- **grub/**: Tema y configuración para GRUB.

## Uso

```yaml
- hosts: localhost
  become: true
  roles:
    - resources
