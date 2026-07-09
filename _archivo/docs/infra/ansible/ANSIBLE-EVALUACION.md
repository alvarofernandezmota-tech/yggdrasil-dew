---
tipo: infra
author: Alvaro Fernandez Mota <alvarofernandezmota@gmail.com>
creado: 2026-07-06
actualizado: 2026-07-06
ruta: docs/infra/ansible/ANSIBLE-EVALUACION.md
tags: [ansible, infra, madre, automatizacion, iac]
status: activo
---

# Evaluación Ansible para Madre

> Evaluación del uso de Ansible como herramienta de Infrastructure as Code (IaC)
> para gestionar la configuración de Madre de forma reproducible y versionada.

---

## Decisión

**Ansible: RECOMENDADO para Madre.** Implementación progresiva, empezando por las tareas
más repetitivas y críticas. No bloquea otras fases — se implementa en paralelo.

---

## Por qué Ansible para este ecosistema

| Criterio | Ansible | Alternativas |
|---|---|---|
| Agentless | ✅ Solo SSH, sin agente en Madre | Puppet/Chef requieren agente |
| Idempotente | ✅ Ejecutar 2 veces = mismo resultado | Scripts bash NO son idempotentes |
| Legible | ✅ YAML, fácil de auditar | Terraform es más complejo para infra local |
| Arch Linux | ✅ Módulo `pacman` nativo | Buen soporte oficial |
| Curva de aprendizaje | ✅ Baja para sysadmin con bash | Chef/Puppet: alta |
| Sin servidor central | ✅ Corre desde Acer → Madre | AWX/Tower: overhead innecesario |

---

## Casos de uso en Madre

### Prioridad alta (implementar primero)
- Instalar y configurar paquetes base (git, docker, gh, tailscale, fail2ban)
- Gestionar usuarios y `authorized_keys`
- Configurar UFW (reglas de firewall como código)
- Configurar `sshd_config` (hardening SSH)

### Prioridad media
- Desplegar y actualizar stack Docker (`docker-compose up -d`)
- Configurar cron jobs del ecosistema
- Gestionar `/etc/hosts` y configuración de red

### Prioridad baja (futuro)
- Rollout de configuración si se añaden más nodos (Thdora como servidor, etc.)
- Backup automatizado de configuraciones críticas

---

## Estructura de playbooks propuesta

```
yggdrasil-dew/
└── ansible/
    ├── inventory/
    │   └── hosts.yml          # Inventario de nodos (Madre, etc.)
    ├── playbooks/
    │   ├── base.yml           # Setup base de Madre
    │   ├── firewall.yml       # Configuración UFW
    │   ├── docker-stack.yml   # Deploy del stack Docker
    │   └── ssh-hardening.yml  # Hardening SSH
    └── roles/
        ├── common/
        ├── docker/
        ├── firewall/
        └── ollama/
```

---

## Playbook base de ejemplo

```yaml
# ansible/playbooks/base.yml
# Ejecutar: ansible-playbook -i inventory/hosts.yml playbooks/base.yml
---
- name: Setup base Madre
  hosts: madre
  become: true

  vars:
    paquetes_base:
      - git
      - docker
      - docker-compose
      - github-cli
      - fail2ban
      - ufw
      - htop
      - tmux
      - jq

  tasks:
    - name: Actualizar sistema
      community.general.pacman:
        update_cache: true
        upgrade: true

    - name: Instalar paquetes base
      community.general.pacman:
        name: "{{ paquetes_base }}"
        state: present

    - name: Habilitar y arrancar Docker
      ansible.builtin.systemd:
        name: docker
        enabled: true
        state: started

    - name: Habilitar y arrancar fail2ban
      ansible.builtin.systemd:
        name: fail2ban
        enabled: true
        state: started

    - name: Configurar UFW — denegar por defecto
      community.general.ufw:
        state: enabled
        policy: deny
        direction: incoming

    - name: Permitir SSH solo desde Tailscale
      community.general.ufw:
        rule: allow
        port: '22'
        src: '100.64.0.0/10'  # Rango CGNAT de Tailscale

    - name: Denegar puerto 21 FTP
      community.general.ufw:
        rule: deny
        port: '21'
```

---

## Inventario de ejemplo

```yaml
# ansible/inventory/hosts.yml
all:
  hosts:
    madre:
      ansible_host: 100.91.112.32   # IP Tailscale de Madre
      ansible_user: alvaro
      ansible_ssh_private_key_file: ~/.ssh/id_ed25519
      ansible_python_interpreter: /usr/bin/python3
```

---

## Instalación en Acer (controlador Ansible)

```bash
# Arch Linux
sudo pacman -S ansible

# Verificar
ansible --version

# Test de conectividad a Madre
ansible madre -i ansible/inventory/hosts.yml -m ping
# Debe devolver: madre | SUCCESS => { "ping": "pong" }
```

---

## Siguiente paso

- [ ] Crear `ansible/inventory/hosts.yml` con IP real de Madre
- [ ] Instalar Ansible en Acer: `sudo pacman -S ansible`
- [ ] Test de conectividad: `ansible madre -m ping`
- [ ] Ejecutar `base.yml` y verificar idempotencia (2 ejecuciones = mismo resultado)
- [ ] Abrir issue de tracking para implementación progresiva

---

_Creado: 2026-07-06 · Fase 5 Plan de Alineación · Referencia: [Ansible Arch Linux](https://wiki.archlinux.org/title/Ansible) · [Ansible community.general.pacman](https://docs.ansible.com/ansible/latest/collections/community/general/pacman_module.html)_
