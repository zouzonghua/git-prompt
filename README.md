# git-prompt

A minimal git branch indicator for bash and zsh. Appends the current branch to your existing prompt — no theme overrides, no framework required.

```
zonghua@MacBook-Air ~ %                    # not a git repo
zonghua@MacBook-Air notes [main] %         # clean (green)
zonghua@MacBook-Air notes [main] %         # dirty (red)
```

## Install

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/zouzonghua/git-prompt/main/install.sh)"
```

Then reload your shell:

```bash
source ~/.zshrc   # zsh
source ~/.bashrc  # bash
```

## Uninstall

```bash
rm ~/scripts/git_prompt.sh
```

Remove the source line from `~/.zshrc` or `~/.bashrc`, then open a new shell.

## How it works

| State | Color |
|---|---|
| Clean | Green |
| Dirty | Red |
| Not a git repo | _(nothing)_ |

## License

[MIT](https://github.com/zouzonghua/git-prompt/blob/main/LICENSE)
