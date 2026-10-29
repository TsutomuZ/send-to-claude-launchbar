# send-to-claude-launchbar

A LaunchBar action that types text into a Claude Code session that is already running in Terminal.app, and submits it.

## Requirements

- macOS with Terminal.app (iTerm, Ghostty, Zed, etc. are not supported)
- [LaunchBar](https://www.obdev.at/products/launchbar/)
- `claude` (Claude Code) running in a Terminal.app tab

No tmux, Accessibility permission or Claude Code channels are needed. In my testing, no Automation permission dialog appeared either.

## Install

Copy `Send to Claude.applescript` to `~/Library/Application Support/LaunchBar/Actions/`.

## Usage

1. Start `claude` in a Terminal.app tab.
2. In LaunchBar, type `Send to Claude`, press Space, type your text, and press Return.

## How it works

LaunchBar passes the text to `handle_string`. The script looks through every Terminal window for a tab whose `processes` include `claude`, then runs `do script` with the text in that tab. For a foreground program that reads stdin, `do script` writes the text followed by a newline, so the claude prompt receives and submits it. No tab ID is stored, so it keeps working after you restart claude or Terminal. If no such tab exists, it shows a notification.

## Caveats

- **Return is sent automatically.** Whatever you send is submitted immediately, including mistakes and slash commands.
- If several tabs run `claude`, the text goes to the first one found, starting from the frontmost window.
- Right after `claude` starts, wait until the input box appears before sending. Not tested.
- Tested only on macOS 27.2 with Terminal.app and Claude Code. Other versions may behave differently.

## License

MIT
