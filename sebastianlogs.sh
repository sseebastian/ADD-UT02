#!/bin/bash

# Comprobamos que el nivel sea correcto
case $1 in
    emerg|alert|crit|err|warning|notice|info|debug)
        ;;
    *)
        echo "Nivel incorrecto"
        exit
        ;;
esac

# Guardamos los registros de este mes en un archivo
journalctl --since "$(date +%Y-%m-01)" -p "$1..$1" > ~/logs.txt

# Contamos los registros
wc -l ~/logs.txt