# git-prompt

A minimal, zero-dependency git branch indicator for **bash** and **zsh**.

Appends the current git branch to your existing prompt — no theme overrides, no framework required.

```
zonghua@MacBook-Air notes [main] %       # clean branch
zonghua@MacBook-Air notes [main*] %      # dirty branch (red)
zonghua@debian ~/project [feat/v2] $     # bash, same behaviour
```

## Features

- **Non-invasive** — appends to your existing `PS1`, never replaces it
- **Cross-shell** — one file works for both bash and zsh
- **Zero dependencies** — only requires `git` and your shell
- **Lightweight** — uses `git diff-index` instead of `git status` for faster prompt rendering
- **Color coded** — green for clean, red for dirty (staged / modified / untracked)

## Install

### One-line installer

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zouzonghua/git-prompt/main/install.sh)"
```

Then reload your shell:

```bash
source ~/.zshrc   # zsh
source ~/.bashrc  # bash
```

### Manual install

```bash
mkdir -p ~/scripts
curl -fsSL https://raw.githubusercontent.com/yourusername/git-prompt/main/git_prompt.sh \
  -o ~/scripts/git_prompt.sh
```

Add to your `~/.zshrc` or `~/.bashrc`:

```bash
[ -f ~/scripts/git_prompt.sh ] && source ~/scripts/git_prompt.sh
```

## How it works

| State | Color | Example |
|---|---|---|
| Clean | Green | `[main]` |
| Dirty (any changes) | Red | `[main]` |
| Not a git repo | — | _(nothing)_ |

Dirty means any of: staged files, modified files, or untracked files.

The prompt symbol (`%` on zsh, `$` on bash) is preserved from your original config. Root users see `#` as usual.

## Uninstall

```bash
rm ~/scripts/git_prompt.sh
```

Then remove the source line from your `~/.zshrc` or `~/.bashrc`:

```bash
# git-prompt
[ -f ~/scripts/git_prompt.sh ] && source ~/scripts/git_prompt.sh
```

## Compatibility

| Shell | Platform | Status |
|---|---|---|
| zsh | macOS | ✓ |
| bash | Debian / Ubuntu | ✓ |
| bash | macOS | ✓ |
| zsh | Linux | ✓ |

## License

MIT
