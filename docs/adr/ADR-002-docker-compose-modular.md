---
tags: [adr, arquitectura, docker, gitops]
fecha: 2026-06-25
estado: aceptado
---

# ADR-002: Arquitectura Docker Compose Modular con Orquestador Maestro

## Contexto

El stack de la Batcueva creció de 4 servicios a +20. Un solo `docker-compose.yml` era inmanejable y cualquier error afectaba a todo el sistema.

## Opciones consideradas

| Opción | Pros | Contras |
|--------|------|---------|
| **YMLs modulares + master `include`** | Cada stack independiente, fácil de levantar por partes | Requiere Docker Compose v2.20+ |
| Un solo compose gigante | Simple al principio | Imposible de mantener, un error para todo |
| Ansible + roles | El más profesional | Curva de aprendizaje alta |
| Portainer/Dockge | UI visual | Añade dependencia de UI |

## Decisión

YMLs modulares en `docker/batcueva-*.yml` orquestados por `docker/batcueva-master.yml` usando la directiva `include` de Docker Compose v2.

## Justificación

- Permite levantar stacks independientes (`bc up osint` sin tocar SIEM)
- Compatible con GitOps: el repo es la única fuente de verdad
- Preparado para migración futura a Ansible (los YMLs se convierten en tasks)
- `batcueva-master.yml` es el punto de entrada único para despliegue completo

## Consecuencias

- Requiere Docker Compose >= 2.20 en Madre y Acer
- Las redes (`batcueva-net`, `vuln-net`) se definen en el master
- Levantar todo simultaneamente consume ~8-10GB RAM — verificar con `free -h` antes

---
_Decidido por: alvarofernandezmota-tech | Fecha: 2026-06-25_
