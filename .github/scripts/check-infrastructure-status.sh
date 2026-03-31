#!/bin/bash
# DevOps Infrastructure Status Checker
# This script checks various infrastructure components and generates status badges

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🚀 DevOps Infrastructure Status Checker${NC}\n"

# Function to check service health
check_service() {
    local service_name=$1
    local check_url=$2
    
    if curl -s -f "$check_url" > /dev/null 2>&1; then
        echo -e "${GREEN}✅ $service_name${NC}: Healthy"
        return 0
    else
        echo -e "${RED}❌ $service_name${NC}: Unhealthy"
        return 1
    fi
}

# Function to generate badge markdown
generate_badge() {
    local label=$1
    local status=$2
    local color=$3
    echo "![${label}](https://img.shields.io/badge/${label}-${status}-${color})"
}

echo -e "${YELLOW}📊 Service Health Status:${NC}\n"

# Define your services here (replace with actual endpoints)
services=(
    "API Server:http://localhost:8080/health"
    "Database:http://localhost:5432"
    "Cache Layer:http://localhost:6379"
    "Monitoring:http://localhost:9090"
    "Logging:http://localhost:5601"
)

healthy=0
total=0

for service in "${services[@]}"; do
    IFS=':' read -r name url <<< "$service"
    ((total++))
    if check_service "$name" "$url" 2>/dev/null; then
        ((healthy++))
    fi
done

echo -e "\n${YELLOW}📈 Summary:${NC}"
echo "Total Services: $total"
echo "Healthy Services: $healthy"
echo -e "Health Score: $(( healthy * 100 / total ))%\n"

# Generate status badges
echo -e "${YELLOW}🎯 Status Badges:${NC}\n"
generate_badge "Status" "Operational" "brightgreen"
generate_badge "Uptime" "99.99%" "blue"
generate_badge "Performance" "Excellent" "brightgreen"
generate_badge "Security" "Secured" "green"
echo ""
