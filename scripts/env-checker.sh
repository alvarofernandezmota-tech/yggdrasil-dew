#!/bin/bash
# env-checker.sh — Valida .env contra .env.template antes de docker compose up
# Uso: ./scripts/env-checker.sh .env.template .env
# Alias recomendado en .bashrc: alias ygg-check="cd ~/yggdrasil-dew && ./scripts/env-checker.sh .env.template .env"

TEMPLATE=${1:-.env.template}
ENV=${2:-.env}

if [[ ! -f "$TEMPLATE" ]]; then
  echo "❌ ERROR: No se encuentra el template: $TEMPLATE"
  exit 1
fi

if [[ ! -f "$ENV" ]]; then
  echo "❌ ERROR: No se encuentra el archivo .env: $ENV"
  exit 1
fi

ERRORS=0

while IFS= read -r line || [[ -n "$line" ]]; do
  # Ignorar comentarios y líneas vacías
  [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

  key=$(echo "$line" | cut -d '=' -f1 | tr -d ' ')

  if [[ -z "$key" ]]; then
    continue
  fi

  if ! grep -q "^${key}=" "$ENV"; then
    echo "❌ FALTA: $key"
    ERRORS=$((ERRORS + 1))
  else
    value=$(grep "^${key}=" "$ENV" | cut -d'=' -f2-)
    if [[ -z "$value" ]]; then
      echo "⚠️  VACÍA: $key (existe pero sin valor)"
      ERRORS=$((ERRORS + 1))
    fi
  fi
done < "$TEMPLATE"

if [[ $ERRORS -gt 0 ]]; then
  echo ""
  echo "🚨 $ERRORS error(es) encontrados en $ENV — despliegue ABORTADO"
  exit 1
fi

echo "✅ .env validado correctamente. Todas las variables presentes."
exit 0
