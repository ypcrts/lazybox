#!/bin/sh
set -e
case "$(id -u -n)" in
  ypcrts|hugg|ypcrts)
    GXG=true
    ;;
  *)
    if [ -z "$GXG" ]; then
      echo "These scripts run differently for different uses."
      echo "It is recommended to run in safe mode."
      echo "Turn off safe mode? [N/y]"
      read response
      case "$response" in
        y|Y|j|1)
          GXG=1
          ;;
        *)
          unset GXG
          ;;
      esac
      unset response
    fi
    ;;
esac
export GXG
