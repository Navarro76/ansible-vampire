# Rol Ansible: desktop

Este rol instala un entorno gráfico ligero con un gestor de ventanas tipo *tiling* (`bspwm`), barra de estado (`polybar`) y gestor de sesiones (`lightdm`).

## 📦 Paquetes instalados

- `bspwm`, `sxhkd` (gestor de ventanas y atajos)
- `polybar` (barra de estado)
- `rofi` (launcher)
- `picom` (compositor)
- `lightdm`, `lightdm-gtk-greeter` (gestor de sesiones)
- `lxappearance`, `qt5ct` (personalización visual)
- `feh` (fondo de pantalla)

También incluye instalación desde código fuente de:
- `polybar`
- `picom (ibhagwan fork)`
- `web-greeter` (instalado desde `.deb`)

## 🔧 Variables

Puedes personalizar los paquetes mediante la variable `desktop_packages`:

```yaml
desktop_packages:
  - bspwm
  - sxhkd
  - rofi
  - lightdm
  - lightdm-gtk-greeter
  - lxappearance
  - qt5ct
  - feh
