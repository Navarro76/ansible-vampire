# Rol: terminal

Este rol configura una terminal avanzada con Zsh, Neovim, tmux, y varios plugins útiles para los usuarios `alex` y `root`.

## ¿Qué hace?

- Instala herramientas esenciales como `tmux`, `kitty`, `mc`, `ranger`, etc.
- Configura:
  - Zsh con Powerlevel10k
  - Plugins útiles: `zsh-syntax-highlighting`, `zsh-autosuggestions`, `zsh-sudo`
- Neovim desde AppImage y configuración con tema Nord
- Oh My Tmux con tema Dracula
- Herramientas extra como `bat`, `lsd`, `fzf`

## Uso

Incluye el rol en tu playbook principal:

```yaml
- hosts: localhost
  become: true
  roles:
    - terminal
