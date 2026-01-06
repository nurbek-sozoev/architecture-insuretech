#!/bin/bash

LOG_FILE="scaling-monitor-$(date +%Y%m%d_%H%M%S).log"

echo "Мониторинг масштабирования HPA"
echo "Начало мониторинга: $(date)" | tee -a "$LOG_FILE"

while true; do
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
    
    echo "HPA Status:" | tee -a "$LOG_FILE"
    kubectl get hpa insuretech-app-hpa 2>&1 | tee -a "$LOG_FILE"
    
    echo "Pods:" | tee -a "$LOG_FILE"
    kubectl get pods -l app=insuretech-app 2>&1 | tee -a "$LOG_FILE"
    
    echo "Metrics:" | tee -a "$LOG_FILE"
    kubectl top pods -l app=insuretech-app 2>&1 | tee -a "$LOG_FILE"
    
    echo "" | tee -a "$LOG_FILE"
    sleep 10
done

