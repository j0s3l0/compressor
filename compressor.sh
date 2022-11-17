#!/bin/bash
#author: J.Chacano

ext=$1

if [ -z "$ext" ]
then
        echo "Uso: ./compressor.sh [extension]"
        echo ""
        echo "ejemplo: ./compressor.sh csv"
        exit
else
        count=$(ls -l *.$ext | awk '{print $NF}' | wc -l)

        for list in $(seq 1 $count)
        do
                tar -czvf ./compressed/$(ls -l *.$ext | awk '{print $NF}' | sed -n "$list"p)_$(date +"%Y-%m-%d_%I-%M").tar.gz ./$(ls -l *.$ext | awk '{print $NF}' | sed -n "$list"p)
        done

        if [ $? -eq 0 ]
        then
                rm ./*.$ext
        fi
fi
