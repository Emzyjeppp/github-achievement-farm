# 🛠️ DevOps Stress Testing & API Throttling Sandbox

A testing sandbox designed to benchmark, validate, and research automated Git workflows, GitHub CLI (`gh`) scripting behaviors, and API rate-limiting boundaries.

---

## 📋 Objectives & Focus Areas

This repository serves as an active playground for testing the following engineering scenarios:

1. **GitHub CLI Benchmarking (`gh`):**
   - Streamlining programmatic branch management, pull request generation, and merge strategies.
   - Measuring CLI execution latency under rapid loop conditions.

2. **API Rate-Limit Testing & Resiliency:**
   - Benchmarking secondary rate limit thresholds on GitHub's API.
   - Testing throttling scripts and dynamic sleep back-offs during high-frequency PR operations (e.g., batch stress-testing loops).

3. **Collaborative Metadata Attribution:**
   - Testing Git integration with system accounts and verified bots using `Co-authored-by` metadata.
   - Verifying commit author mapping behavior on remote pull request merges.

4. **Workflow Automation & CI/CD Triggers:**
   - Simulating direct-merge policies (hotfix deployments) without external reviews.
   - Testing rapid web-hook triggers by opening and closing issue lifecycles in short intervals (under 10 seconds).

---

## ⚙️ Utilities & Experiments

*   **`yolo-merge` validation:** Simulates hotfix releases by merging PRs instantly without manual intervention.
*   **`rate-limit-stress` loops:** Evaluates API resilience by pushing multiple branches and merging PRs sequentially using rate-limit back-off logic.
*   **`bot-attribution` hooks:** Tests collaborative commits with system entities (e.g., `github-actions[bot]`).
*   **`quickdraw-issue-lifecycles`:** Evaluates API latency and web-hook response times for issue creation and immediate resolution.

---

## 📝 License
MIT License. Created for local development workflow testing and performance profiling.
