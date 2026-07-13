---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-13
tags: [protocolo, hardware, ecosistema, isla]
status: vigente
---

# Protocolo Nueva Máquina en el Ecosistema

> Al incorporar hardware nuevo: servidor, laptop, móvil, SBC...

## Checklist

### Identidad
- [ ] Asignar nombre propio (convenio: nombres femeninos mitológicos/personales — Madre, Thea, Acer...)
- [ ] Documentar: tipo, marca/modelo, CPU, RAM, almacenamiento, OS
- [ ] Definir rol en el ecosistema

### Red y acceso
- [ ] Añadir a Tailscale — IP fija en `100.x.x.x`
- [ ] Configurar SSH con clave `id_ed25519_github` o clave dedicada
- [ ] Documentar IP Tailscale en isla wiki
- [ ] Verificar que NO está expuesto a internet sin auth

### Git y repos
- [ ] Clonar repos del ecosistema en `~/ygg/`:
  ```bash
  mkdir -p ~/ygg
  cd ~/ygg
  git clone git@github.com:alvarofernandezmota-tech/yggdrasil-dew.git
  git clone git@github.com:alvarofernandezmota-tech/yggdrasil-tracking.git
  # etc.
  ```
- [ ] Configurar git: `git config --global user.name` y `user.email`
- [ ] Verificar SSH key para GitHub

### Wiki
- [ ] Crear isla en `WIKI---PERSONAL/wiki/islas/<nombre>.md`
- [ ] Seguir `PROTOCOLO-NUEVA-ISLA.md`
- [ ] Añadir al INDEX de islas
- [ ] Si es servidor → crear sección en isla `madre.md` o isla propia

### DEW
- [ ] Añadir a tabla de hardware en `docs/ECOSISTEMA-CANON.md`
- [ ] Si corre servicios → seguir `PROTOCOLO-NUEVO-SERVICIO.md`

---
_Creado: 2026-07-13 · Perplexity MCP_
