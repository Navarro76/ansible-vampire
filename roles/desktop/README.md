# Rol Ansible: desktop

Este rol instala un entorno gráfico ligero con un gestor de ventanas tipo *tiling* (`sway`), barra de estado (`waybar`) y gestor de sesiones (`ly`).

## 📦 Paquetes instalados

- `sway` (gestor de ventanas, compositor y atajos)
- `swaybg` (utilidad de fondo de pantalla para Wayland)
- `swaylock` (utilidad de bloqueo de pantalla para Wayland)
- `swayidle` (utilidad de gestión de inactividad)
- `mako-notifier` (un demonio de notificaciones ligero)
- `xdg-desktop-portal`
- `xdg-desktop-portal-wlr` (capturas de pantalla y grabación)
- `swayimg` (visor de imágenes para Wayland)
- `papersway` (scrollable tiling -mosaico desplazable-)
- `waybar` (barra de estado)
- `gammastep` (modo noche)
- `ly` (gestor de sesiones)


También incluye instalación desde código fuente de:
- `rofi` (lanzador de aplicaciones) 

## 🔧 Variables

Puedes personalizar los paquetes mediante la variable `desktop_packages`:

```yaml
desktop_packages:
  - sway
  - swaybg
  - swaylock
  - swayidle
  - mako-notifier
  - xdg-desktop-portal
  - xdg-desktop-portal-wlr
  - swayimg
  - papersway
  - waybar
  - gammastep
