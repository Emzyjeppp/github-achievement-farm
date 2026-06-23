#!/bin/bash
# ==============================================================================
# DevOps Stress Testing Sandbox - API Rate Limit Benchmark Tool
# Description: Simulates API calls with a clean rate-limit header parser.
# ==============================================================================

TARGET_URL="https://api.github.com/zen"
LOG_FILE="benchmark_api.log"

echo "=== Starting API Rate-Limit Check ===" | tee "$LOG_FILE"
echo "Checking: $TARGET_URL" | tee -a "$LOG_FILE"

response=$(curl -sI -H "Accept: application/vnd.github.v3+json" "$TARGET_URL")

# Extract rate limit headers safely
limit=$(echo "$response" | grep -i "x-ratelimit-limit" | tr -d '\r' | awk '{print $2}')
remaining=$(echo "$response" | grep -i "x-ratelimit-remaining" | tr -d '\r' | awk '{print $2}')

if [ -n "$limit" ]; then
    echo "Rate limit quota: $limit" | tee -a "$LOG_FILE"
    echo "Remaining quota: $remaining" | tee -a "$LOG_FILE"
else
    echo "Warning: Could not extract rate-limit headers. Are you unauthenticated?" | tee -a "$LOG_FILE"
fi

echo "=== API Checks Completed ===" | tee -a "$LOG_FILE"
