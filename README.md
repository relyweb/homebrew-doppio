# Doppio — Homebrew tap

Homebrew tap for **[Doppio](https://github.com/relyweb/doppio)**, a tiny macOS
menu-bar app that keeps your Mac awake for long-running **agentic tasks** —
Claude Code, omp, opencode, Codex, Gemini, or anything else — even while the
screen is locked or the lid is closed. A more reliable, task-aware replacement
for `caffeinate`.

![Doppio menu bar with a live keep-awake countdown and menu](https://raw.githubusercontent.com/relyweb/doppio/main/docs/menu.png)

## Install

```sh
brew tap relyweb/doppio
brew trust relyweb/doppio     # one-time: Homebrew requires trusting third-party taps
brew install --cask doppio
open -a Doppio                # starts the menu-bar app
```

## Upgrade / uninstall

```sh
brew upgrade --cask doppio
brew uninstall --cask doppio          # add --zap to also remove preferences
```

## Gatekeeper & Security

Doppio is signed with a valid **Apple Developer ID** (`RELYWEB TECHNOLOGIES PRIVATE LIMITED`)
and **notarized by Apple**, allowing Gatekeeper to verify and open it smoothly without
unidentified developer warnings.

## Requirements

- macOS 13 Ventura or later (Apple Silicon or Intel).

## What Doppio does

- **Task-aware:** stays awake while Claude Code / omp / opencode / Codex / Gemini
  (or your own processes) are running — presence-based, so long model calls never
  let the Mac doze mid-task.
- **Timer / manual / schedule** modes, with a live countdown in the menu bar.
- **Works locked and lid-closed** (lid-closed on AC power).
- **Battery-aware:** optionally pauses on battery below a chosen level.
- Configurable global hotkey, and a signal API (`~/.doppio/active`) for precise
  integration from agent hooks.

## About this repository

This repo is **only the Homebrew tap** — it contains the cask
(`Casks/doppio.rb`). The application source, releases, full documentation, and
issue tracker live in the main repository:

- **App & docs:** https://github.com/relyweb/doppio
- **Issues / feature requests:** https://github.com/relyweb/doppio/issues
- **Releases:** https://github.com/relyweb/doppio/releases

The cask's download URL points at the release artifacts published there; this
tap is updated automatically by the app repo's `release.sh` on each release.
