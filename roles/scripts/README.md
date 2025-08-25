# Rol `scripts`

Este rol se encarga de instalar y configurar scripts útiles para el entorno del usuario.

## Archivos incluidos

- Scripts para red, HTB, y herramientas de pentesting.
- Compilación automática de scripts en Go.
- Copia y asignación de permisos.

## Uso

Agrega este rol en tu playbook principal:

```yaml
- hosts: localhost
  roles:
    - scripts