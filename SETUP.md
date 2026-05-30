# Setup — one time

## 1. Install the `dsa-bank` VS Code extension
```bash
code --install-extension tooling/dsa-bank/dsa-bank.vsix --force
```
Reload VS Code. (Already installed on this machine during setup.)

## 2. Always open the repo as the workspace
The extension scaffolds into the **first workspace folder**, so open this repo:
```bash
code ~/Documents/DSA_QUESTIONS
```

## 3. Install + log in to leetcode-cli (needed for Submit & Push)
```bash
npm i -g vsc-leetcode-cli          # provides the `leetcode` command
leetcode user -c                   # cookie login (built in — do NOT run `plugin -i cookie`)
```
> Do **not** run `leetcode plugin -i cookie` — that plugin's download URL is dead (404) and it
> isn't needed; cookie login is built into the core.

`leetcode user -c` prompts for two things:
- **login** → your LeetCode username
- **cookie** → one line containing **both** values: `csrftoken=<CSRF>; LEETCODE_SESSION=<SESSION>`

**Getting the two values:** log in at leetcode.com → **F12** → **Application → Cookies →
`https://leetcode.com`** → copy the `csrftoken` and `LEETCODE_SESSION` values, paste them combined.
Verify: `leetcode user` should print your username. (Cookie expires every few weeks — re-run `leetcode user -c`.)
The `padLevels` deprecation warning is harmless.

> Submitting via `leetcode submit` **counts on your LeetCode profile** — no separate website step.

## 4. (Optional) one-key Submit & Push
Add this to your VS Code **keybindings.json** (`Ctrl+Shift+P → Preferences: Open Keyboard Shortcuts (JSON)`):
```json
{ "key": "ctrl+alt+s", "command": "workbench.action.tasks.runTask", "args": "DSA: Submit & Push" }
```
Now `Ctrl+Alt+S` in any open `solution.cpp` submits + pushes.
(Or run it from the **Command Palette → DSA: Submit to LeetCode & Push**.)

---

# Daily workflow

1. Open `launchpad.html` (double-click it, or **Command Palette → DSA: Open Launchpad**).
2. Click **Open ▸** on a problem → the folder is scaffolded and opens (description + `solution.cpp`).
3. Solve. Test with the LeetCode VS Code extension's "Test", or `leetcode test solution.cpp`.
4. Hit **`Ctrl+Alt+S`** (or run the task) → submits to LeetCode; **if Accepted**, commits + pushes here.

GeeksforGeeks / non-LeetCode problems skip submission and just push (they can't post to your LeetCode profile).

---

# Regenerate the launchpad / metadata
If the source question-bank changes:
```bash
QB=/path/to/question-bank DIFF_JSON=/path/to/leet_diff.json python3 tooling/generate.py
```
This rewrites `data/problems.json` and `launchpad.html`.

# Re-package the extension after editing it
```bash
cd tooling/dsa-bank && npm install && npm run compile && npm run package
code --install-extension dsa-bank.vsix --force
```
