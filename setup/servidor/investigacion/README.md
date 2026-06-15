# Investigación — Servidor e Infraestructura
*Última actualización: 15 junio 2026*

## Estado del conocimiento
Docker existe en el repo de THDORA (Dockerfile + docker-compose.yml). Servidor aún no montado. Hetzner identificado como opción principal.

## 📋 Pendiente de investigar
- [ ] Comparativa Hetzner vs DigitalOcean vs AWS Frankfurt para THDORA
- [ ] Seguridad básica servidor Linux: checklist completo
- [ ] Nginx como reverse proxy para FastAPI
- [ ] Let's Encrypt automático con Certbot
- [ ] Backups automáticos de PostgreSQL
- [ ] Monitorización básica (Grafana + Prometheus vs alternativas simples)
- [ ] WireGuard VPN para acceso seguro al servidor

## 📰 Log de actualizaciones

### 15 jun 2026
- Hetzner CAX11 identificado: €4.51/mes, ARM, 2vCPU, 4GB RAM, Europa
- Docker ya existe en thdora repo (Dockerfile + docker-compose.yml)
- Decisión: montar servidor antes del MVP con usuarios reales
- Fuente: sesión Claude vía Perplexity
