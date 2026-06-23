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

## 📁 Repository Structure

```text
├── .github/
│   └── workflows/
│       └── ci.yml             # Automated CI pipeline for validation
├── config/
│   └── default.json          # Benchmark configurations and limits
├── scripts/
│   ├── api-stress-test.sh    # CLI API rate-limit analysis utility
│   └── benchmark-git.sh      # Git local loop performance profiling tool
├── .gitignore
└── README.md
```

---

## ⚙️ Utilities & Experiments

### 1. Git Benchmarks (`scripts/benchmark-git.sh`)
Profiles the speed of local branch checkout and deletion routines. Evaluates performance bottlenecks over multiple iterations.
Run the benchmark via:
```bash
chmod +x scripts/benchmark-git.sh
./scripts/benchmark-git.sh
```

### 2. API Rate Limit Analyzer (`scripts/api-stress-test.sh`)
Queries GitHub endpoints and parses header responses to check current rate limit capacities and remaining API quotas.
Run the analyzer via:
```bash
chmod +x scripts/api-stress-test.sh
./scripts/api-stress-test.sh
```

### 3. Automated CI Pipeline (`.github/workflows/ci.yml`)
Runs linting and validation on all shell scripts on every pull request or push to the `main` branch to guarantee sandbox integrity.

---

## 📝 License
MIT License. Created for local development workflow testing and performance profiling.
