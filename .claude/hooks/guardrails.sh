#!/usr/bin/env bash
# Mr. Oriente — bloqueo duro de acciones prohibidas.
# Recibe el JSON del tool call por stdin (PreToolUse). Exit 2 = bloquear.
input=$(cat)
tool=$(printf '%s' "$input" | grep -o '"tool_name"[[:space:]]*:[[:space:]]*"[^"]*"' | head -1 | sed 's/.*"\([^"]*\)"$/\1/')
t=$(printf '%s' "$tool" | tr '[:upper:]' '[:lower:]')

case "$t" in
  mcp__*gmail*)
    # Gmail es solo lectura: lista blanca de herramientas de lectura.
    if ! printf '%s' "$t" | grep -Eq '__(search_threads|get_thread|get_message|list_labels|list_drafts|get_draft)$'; then
      echo "BLOQUEADO por Mr. Oriente: Gmail es solo lectura ($tool). Si hace falta un mail, redactalo en el chat para que lo mande un socio." >&2
      exit 2
    fi
    ;;
  mcp__*notion*|mcp__*drive*|mcp__*sheets*|mcp__*docs*|mcp__*slides*|mcp__*calendar*|mcp__*google*)
    if printf '%s' "$t" | grep -Eq '(delete|trash|remove|archive|purge|clear)'; then
      echo "BLOQUEADO por Mr. Oriente: nunca se borran registros, archivos, carpetas ni eventos ($tool). Proponé marcarlo como Descartado/Cancelado y que lo borre un socio." >&2
      exit 2
    fi
    # Compartir archivos o responder invitaciones manda mails a terceros.
    if printf '%s' "$t" | grep -Eq '(share_file|respond_to_event)'; then
      echo "BLOQUEADO por Mr. Oriente: esta acción notifica a terceros ($tool). Que lo haga un socio." >&2
      exit 2
    fi
    ;;
esac
exit 0
