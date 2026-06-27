# Suricata af-packet + Wazuh — Guía de despliegue
#infra #seguridad #suricata #wazuh #soc

**Fecha:** 2026-06-27
**Estado:** 🔵 Documentado — pendiente de aplicar en Madre

---

## Fase 1 — Preparar interfaz de red (eno1)

1. Identificar interfaz principal:
   ```bash
   ip link show
   ```
2. Desactivar offloading (GRO/LRO) vía systemd:
   - Archivo: `disable-offload.service` (copia de referencia en `setup/servidor/disable-offload.service.example`)
   - Contenido ejemplo:
     ```ini
     [Unit]
     Description=Desactivar offloading de red para Suricata
     After=network.target

     [Service]
     Type=oneshot
     ExecStart=/usr/bin/ethtool -K eno1 gro off lro off
     RemainAfterExit=yes

     [Install]
     WantedBy=multi-user.target
     ```
   - Activar:
     ```bash
     sudo systemctl enable --now disable-offload.service
     ```

---

## Fase 2 — Configuración Suricata af-packet (plantilla)

Referencia de plantilla en `setup/servidor/suricata-af-packet.yaml.template` (no se usa directamente, solo como guía):

```yaml
vars:
  address-groups:
    HOME_NET: "[192.168.1.0/24, 100.64.0.0/10]"  # LAN + Tailscale
    EXTERNAL_NET: "!$HOME_NET"

outputs:
  - eve-log:
      enabled: yes
      filetype: regular
      filename: eve.json
      types:
        - alert:
            payload: yes
            payload-buffer-size: 4kb
            payload-printable: yes
        - http:
            extended: yes
        - dns:
        - tls:
            extended: yes

af-packet:
  - interface: eno1
    threads: auto
    cluster-id: 99
    cluster-type: cluster_flow
    defrag: yes
    use-mmap: yes
    tpacket-v3: yes
```

Pasos en Madre:
```bash
sudo nano /etc/suricata/suricata.yaml   # Aplicar sección vars, outputs y af-packet
sudo suricata-update                    # Descargar reglas Emerging Threats
sudo systemctl restart suricata
sudo systemctl status suricata
```

Logs:
```bash
sudo tail -f /var/log/suricata/eve.json
```

---

## Fase 3 — Integración con Wazuh Agent

En Madre (agente Wazuh):
```bash
sudo nano /var/ossec/etc/ossec.conf
```

Añadir dentro de `<ossec_config>`:
```xml
  <localfile>
    <log_format>json</log_format>
    <location>/var/log/suricata/eve.json</location>
  </localfile>
```

Reiniciar agente:
```bash
sudo systemctl restart wazuh-agent
```

---

## Fase 4 — Validación de la cadena IDS→SIEM

1. Generar tráfico de prueba:
   ```bash
   curl http://testmyids.com
   ```
2. Verificar en Suricata:
   ```bash
   grep "testmyids" /var/log/suricata/eve.json
   ```
3. Verificar en Wazuh (dashboard):
   - Buscar eventos del grupo `suricata` o por la IP origen de `curl`.

---

## Fase 5 — Snapshot de configuración en la repo

Una vez Suricata esté estable en Madre, crear snapshot local y subirlo:
```bash
sudo grep -v "^#" /etc/suricata/suricata.yaml | grep -v "^$" > setup/servidor/suricata-limpio.yaml

git add setup/servidor/suricata-limpio.yaml
git commit -m "sec: snapshot suricata.yaml productivo af-packet"
git push
```

---

*Esta guía complementa `docs/investigacion/pentest-osint-avanzado.md` y `PLAN-SEGURIDAD-Y-DESPLIEGUE.md`.*
