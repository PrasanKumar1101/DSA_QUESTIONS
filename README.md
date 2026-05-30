# DSA_QUESTIONS

A click-to-code DSA practice system. Open a problem from a visual **launchpad**, code it in
VS Code with the real description beside you, then **submit to LeetCode and push to GitHub in one
keystroke**.

226 problems in curated study order across 22 topics (sourced from the
[question-bank](https://github.com/Prateek-5/question-bank) learning path), with **real LeetCode
difficulties**.

## How it works

```
launchpad.html  ──click "Open"──►  vscode://prateek.dsa-bank/open?...
                                          │
                                   dsa-bank extension
                                          │  scaffolds + fetches description
                                          ▼
        DSA/Solutions/<topic>/<NNN-slug>/{README.md, solution.cpp}
                                          │  you solve it
                                          ▼
                        Ctrl+Alt+S  →  leetcode submit  ─(Accepted)─►  git push
```

- **Open in VS Code** — `launchpad.html` has an *Open ▸* button per problem. Clicking it scaffolds
  `DSA/Solutions/<topic>/<NNN-slug>/` (LeetCode description → `README.md`, starter → `solution.cpp`)
  and opens both side-by-side. Existing problems just re-open.
- **Submit & Push** — one command submits to LeetCode (updates your profile) and, only if
  **Accepted**, commits + pushes the solution here. No redundant re-solve on the website.
- **No-redundancy** — submitting from VS Code is the same as submitting on leetcode.com.

## Layout

| Path | What |
|---|---|
| `launchpad.html` | Clickable, filterable index of all 226 problems |
| `data/problems.json` | Parsed metadata (source of truth for the launchpad/extension) |
| `DSA/Solutions/…` | Your per-problem folders (created on demand) |
| `tooling/dsa-bank/` | The VS Code extension (TS source + packaged `.vsix`) |
| `tooling/generate.py` | Rebuilds `problems.json` + `launchpad.html` |
| `tooling/lc-submit.sh` | Submit-to-LeetCode + push (used by the task) |
| `.vscode/tasks.json` | "DSA: Submit & Push" task |

## Setup
See **[SETUP.md](./SETUP.md)** — install the extension, log in to `leetcode-cli` (cookie), bind a key.
