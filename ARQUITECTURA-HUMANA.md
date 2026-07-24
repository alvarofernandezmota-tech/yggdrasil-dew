# Arquitectura Humana de Yggdrasil-Dew

## Principio
La arquitectura técnica refleja la filosofía humana: cada componente técnico tiene un propósito humano y cada decisión técnica respeta el dogma.

## Estructura en árbol
- Raíz: Dogma
  - DOGMA.md (identidad, mandato)
- Tronco: Filosofía y Manifiesto
  - FILOSOFIA.md (cómo pensamos)
  - MANIFIESTO.md (propósito y compromisos)
- Ramas: Valores e Identidad
  - VALORES.md (reglas operativas)
  - IDENTIDAD.md (roles y expectativas)
- Hojas: Cultura y Operaciones
  - CULTURA.md (rituales, tono)
  - ARQUITECTURA-HUMANA.md (integración técnica-humana)

## Integración con la arquitectura técnica
- Modelos y agentes: los agentes ejecutan tareas según reglas definidas en los documentos fundacionales.
- MCP y acciones: cada acción externa (GitHub, Docker, deploys) debe registrar su motivo y autorización en el sistema de logs.
- Documentación viva: los archivos fundacionales son fuente de verdad; los agentes consultan y actualizan contexto cuando procede.
- Supervisión humana: ninguna acción crítica se ejecuta sin aprobación humana explícita del guardián.

## Flujo de decisión
1. Intención: definida por el humano o por un agente con permiso.
2. Evaluación: el agente consulta DOGMA, FILOSOFIA y VALORES.
3. Plan: se genera un plan técnico (modelo, herramienta, MCP).
4. Autorización: el guardián revisa y aprueba.
5. Ejecución: acción registrada y documentada.
6. Revisión: resultado analizado y lecciones integradas.
