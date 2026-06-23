#!/bin/bash
# ==============================================================================
# DevOps Stress Testing Sandbox - Git CLI Benchmarking Tool
# Description: Measures latency of basic git operations in a local loop.
# ==============================================================================

set -e

ITERATIONS=5
LOG_FILE="benchmark_git.log"

echo "=== Starting Git CLI Benchmarking ===" | tee "$LOG_FILE"
echo "Iterations: $ITERATIONS" | tee -a "$LOG_FILE"
echo "Timestamp: $(date)" | tee -a "$LOG_FILE"

for i in $(seq 1 "$ITERATIONS"); do
    echo "----------------------------------------" | tee -a "$LOG_FILE"
    echo "Iteration $i of $ITERATIONS" | tee -a "$LOG_FILE"
    
    # 1. Measure branch creation time
    start_time=$(date +%s%N)
    git checkout -b "bench-temp-$i" > /dev/null 2>&1
    end_time=$(date +%s%N)
    elapsed=$(( (end_time - start_time) / 1000000 ))
    echo "git checkout -b: ${elapsed}ms" | tee -a "$LOG_FILE"
    
    # 2. Clean up branch
    git checkout main > /dev/null 2>&1
    git branch -D "bench-temp-$i" > /dev/null 2>&1
done

echo "=== Benchmarking Completed Successfully ===" | tee -a "$LOG_FILE"
