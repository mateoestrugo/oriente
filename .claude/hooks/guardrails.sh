#!/usr/bin/env bash
# Mr. Oriente — bloqueo duro de acciones prohibidas.
# Recibe el JSON del tool call por stdin (PreToolUse). Exit 2 = bloquear.
input=$(cat)
tool=$(printf '%s' "$input" | grep -o '"tool_name"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"\([^"]*\)"$/\1/')
t=$(printf '%s' "$tool" | tr '[:upper:]' '[:lower:]')

case "$t" in
  mcp__*gmail*)
    # Gmail es solo lectura: se permite buscar, listar y leer.
    if printf '%s' "$t" | grep -Eq '(send|draft|reply|forward|trash|delete|remove|modify|update|create|archive|label_message|batch)'; then
      echo "BLOQUEADO por Mr. Oriente: Gmail es solo lectura ($tool). Si hace falta un mail, redactalo en el chat para que lo mande un socio." >&2
      exit 2
    fi
    ;;
  mcp__*notion*|mcp__*drive*|mcp__*sheets*|mcp__*docs*|mcp__*slides*|mcp__*calendar*|mcp__*google*)
    if printf '%s' "$t" | grep -Eq '(delete|trash|remove|archive|purge)'; then
      echo "BLOQUEADO por Mr. Oriente: nunca se borran registros, archivos, carpetas ni eventos ($tool). Proponé marcarlo como Descartado/Cancelado y que lo borre un socio." >&2
      exit 2
    fi
    ;;
esac
exit 0
