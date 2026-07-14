---
tipo: indice
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
actualizado: 2026-07-14 18:01 CEST
ruta: protocolo/INDEX.md
status: vigente
version: 4.0
---

# 📚 ÍNDICE DE PROTOCOLOS — ECOSISTEMA YGGDRASIL

> Registro maestro de todos los protocolos del ecosistema.
> **Regla de oro:** Solo se registra aquí lo que existe en disco. Nunca anticipar.
> **Regla:** Todo protocolo nuevo se registra aquí en el mismo commit en que se crea.
> **Regla:** Cuando se borra un protocolo, se ejecuta PROTOCOLO-BORRADO antes de tocar nada.
> **Regla:** Cuando un protocolo sube de nivel (manual → script → action → bot), se actualiza la columna "Nivel".

---

## 🟢 SESIÓN — apertura y cierre

| Protocolo | Propósito | Audiencia | Nivel | Versión |
|-----------|-----------|-----------|-------|---------|
| [PROTOCOLO-APERTURA-SESION.md](PROTOCOLO-APERTURA-SESION.md) | Abrir sesión con contexto completo y objetivo declarado | Humano + Agente | 0 — Manual | 2.0 |
| [PROTOCOLO-CIERRE-SESION.md](PROTOCOLO-CIERRE-SESION.md) | Cerrar sesión con 9 fases, push verificado e issue de apertura creado | Humano + Agente | 0 — Manual | 2.0 |

---

## 🔍 AUDITORÍA — calidad y mantenimiento

| Protocolo | Propósito | Audiencia | Nivel | Versión |
|-----------|-----------|-----------|-------|---------|
| [PROTOCOLO-AUDITORIA-ECOSISTEMA.md](PROTOCOLO-AUDITORIA-ECOSISTEMA.md) | Auditoría total de coherencia entre todos los repos del ecosistema | Humano + Agente | 0 — Manual | 1.0 |

---

## 📛 CONVENCIONES — naming y estándares

| Protocolo | Propósito | Audiencia | Nivel | Versión |
|-----------|-----------|-----------|-------|---------|
| [PROTOCOLO-NOMBRES.md](PROTOCOLO-NOMBRES.md) | Convenciones de nomenclatura para todo el ecosistema | Humano + Agente | 0 — Manual | 2.0 |

---

## 🗑️ BORRADO — eliminación segura

| Protocolo | Propósito | Audiencia | Nivel | Versión |
|-----------|-----------|-----------|-------|---------|
| [PROTOCOLO-BORRADO.md](PROTOCOLO-BORRADO.md) | Borrado seguro en cascada: archivo → INDEX → referencias → issue | Humano + Agente | 0 — Manual | 1.0 |

---

## 🚧 PROTOCOLOS PENDIENTES DE RECREAR

> Estos protocolos existieron, fueron borrados sin PROTOCOLO-BORRADO y necesitan recrearse.
> Ordenados por prioridad.

| Protocolo | Prioridad | Issue |
|-----------|-----------|-------|
| `PROTOCOLO-CONTEXTO-ECOSISTEMA.md` | 🔴 Alta | Pendiente |
| `PROTOCOLO-CONTEXTO-REPO.md` | 🔴 Alta | Pendiente |
| `PROTOCOLO-AUDITORIA-WIKI.md` | 🔴 Alta | Pendiente |
| `PROTOCOLO-SECRETOS.md` | 🔴 Alta | Pendiente |
| `PROTOCOLO-NUEVA-ISLA.md` | 🟡 Media | Pendiente |
| `PROTOCOLO-NUEVO-REPO.md` | 🟡 Media | Pendiente |
| `PROTOCOLO-INCIDENTE.md` | 🟡 Media | Pendiente |
| `PROTOCOLO-ISSUE.md` | 🟡 Media | Pendiente |
| `PROTOCOLO-IA.md` | 🟡 Media | Pendiente |
| `PROTOCOLO-SEMANAL.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-CIERRE-MES.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-ROTACION-SECRETOS.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-AUDITORIA-PROYECTO.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-AUDITORIA-DEW.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-ADR.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-NUEVA-MAQUINA.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-NUEVO-SERVICIO.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-DOCKER-DEPLOY.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-BACKUP.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-MANTENIMIENTO.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-LOCAL-BRAIN.md` | 🟢 Baja | Pendiente |
| `PROTOCOLO-CONTEXTO-ROADMAP.md` | 🟢 Baja | Pendiente |

---

## 📊 ESTADO DEL ECOSISTEMA DE PROTOCOLOS

| Métrica | Valor |
|---------|-------|
| Total protocolos activos en disco | 5 |
| Versión 2.0+ (nivel ingeniero) | 2 |
| Pendientes de recrear | 22 |
| Solo nivel 0 (manual) | 5 |

---

_Actualizado: 2026-07-14 18:01 CEST · v4.0 — INDEX sincronizado con disco real_
