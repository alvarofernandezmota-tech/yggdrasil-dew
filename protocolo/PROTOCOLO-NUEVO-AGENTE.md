---
tipo: protocolo
author: Alvaro Fernandez Mota
creado: 2026-07-17
actualizado: 2026-07-17 15:24 CEST
ruta: protocolo/PROTOCOLO-NUEVO-AGENTE.md
tags: [protocolo, agente, docker, madre, mcp, infra]
status: vigente
version: 1.0
---

# PROTOCOLO-NUEVO-AGENTE v1.0

> Proceso canonico para incorporar un nuevo agente al ecosistema Yggdrasil.
> Un "agente" es cualquier servicio con autonomia propia: MCP server, bot, worker,
> pipeline automatizado, o servicio con acceso al ecosistema.
> Tiempo estimado: 30-90 min segun complejidad.

---

## Fase 1: Definir antes de construir

Responder estas preguntas antes de escribir una sola linea de codigo:

```
Nombre canonico:     yggdrasil-[nombre]  (ver PROTOCOLO-NOMBRES)
Rol:                 que hace exactamente en una frase
Tier:                cerebro | herramienta | datos | observabilidad
Acceso docker.sock:  si / no — justificar si es si
Acceso a repos:      cuales y con que permisos
Puerto:              cual — verificar libre en PROTOCOLO-AUDITORIA-MADRE
Persistencia:        volumen / BD / ficheros — o sin estado
Efectos secundarios: que puede modificar en el ecosistema
```

---

## Fase 2: Crear el repo

```
[ ] Seguir PROTOCOLO-NUEVO-REPO
[ ] README.md con: proposito, arquitectura, variables de entorno, como conectar
[ ] Incluir desde el inicio: Dockerfile, docker-compose.yml, .env.template
```

Etiquetas Docker obligatorias en el compose:

```yaml
labels:
  - "yggdrasil.role=[rol]"
  - "yggdrasil.tier=[tier]"
```

---

## Fase 3: Build y test en local

```bash
docker build -t yggdrasil-[nombre]:test .
docker run --rm -it yggdrasil-[nombre]:test
# Verificar que herramientas / endpoints responden segun tipo de agente
```

---

## Fase 4: Desplegar en Madre

Seguir PROTOCOLO-DESPLIEGUE-CONTENEDOR completo.

```bash
ssh varopc@100.91.112.32
mkdir -p /srv/[proyecto]/[nombre]
cd /srv/[proyecto]/[nombre]
# Clonar repo o copiar ficheros
docker compose up -d
docker ps | grep yggdrasil-[nombre]
docker logs --tail 30 yggdrasil-[nombre]
```

---

## Fase 5: Documentar en el ecosistema

```
[ ] Actualizar docs/inventario-madre.md con el nuevo contenedor
[ ] Actualizar tabla de puertos en PROTOCOLO-AUDITORIA-MADRE
[ ] Si el agente tiene entidad propia: crear isla en WIKI (PROTOCOLO-NUEVA-ISLA)
[ ] Si expone herramientas MCP: documentar las tools en su README
[ ] Si la decision de arquitectura es relevante: crear ADR (PROTOCOLO-NUEVO-ADR)
[ ] Anotar en diario DEW del dia
[ ] Cerrar issue asociado si lo habia
```

---

## Tabla de tiers

| Tier | Descripcion | Ejemplo |
|---|---|---|
| cerebro | Acceso total al ecosistema | yggdrasil-mcp |
| herramienta | Procesamiento especifico acotado | yggdrasil-scraper |
| datos | Gestion de vectores / BD | yggdrasil-embedder |
| observabilidad | Metricas y alertas | yggdrasil-monitor |

---

_Creado: 2026-07-17 v1.0 · motivado por despliegue yggdrasil-mcp · Perplexity MCP_
