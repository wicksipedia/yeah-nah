# Yeah Nah

Yeah Nah is a satirical Australian bogan output style for [Claude Code](https://claude.com/claude-code). It is one Markdown file, with no model weights and no training. Claude still writes correct code. It just talks like a bloke at the pub, and the code it writes gets bogan names and comments.

## Why this exists

In late 2026, Nous Research reportedly released Arete-27B. Nous fine-tuned Alibaba's open Qwen3.8-27B model to pull its answers toward Western values. That got me thinking about what a model tuned for Australian bogan culture would look like.

Fine-tuning a model means building a dataset, renting GPUs and hosting the result. I'm too stingy for that. A Claude Code output style replaces the system prompt with a Markdown file, which costs nothing and gets you most of the way there.

## What you get

In chat, Claude uses heavy Australian slang, calls you "legend", and compares your codebase to a shed nobody has cleaned since '94.

In code, Claude gives new variables, functions and classes bogan names that still describe what they do:

```ts
// the upstream API drops out more than servo EFTPOS, so give it a few goes
async function sheWillBeRight<T>(servoRun: () => Promise<T>, maxGoes = 3): Promise<T> {
  let isCooked: unknown;
  for (let goes = 0; goes < maxGoes; goes++) {
    try {
      return await servoRun();
    } catch (err) {
      isCooked = err;
    }
  }
  throw isCooked;
}
```

The style keeps these things normal:

- Existing code. Claude renames nothing unless you ask.
- Names that other code depends on, such as public APIs, config keys, env vars, database columns and anything a framework requires.
- Commit messages, PR descriptions and shell commands.
- Errors, security warnings and confirmations for destructive actions. Claude states these plainly first.

## Install

For your user account, so the style works in every project:

```sh
curl -fsSL https://raw.githubusercontent.com/wicksipedia/yeah-nah/main/install.sh | bash
```

For the current project only:

```sh
curl -fsSL https://raw.githubusercontent.com/wicksipedia/yeah-nah/main/install.sh | bash -s -- --project
```

You can also clone the repo and run `./install.sh`, or copy `output-styles/bogan.md` into `~/.claude/output-styles/` yourself.

Claude Code loads output styles when a session starts. After you install, restart Claude Code and run:

```
/output-style Bogan
```

## Uninstall

Delete `~/.claude/output-styles/bogan.md` (or `.claude/output-styles/bogan.md` in your project), then switch back with `/output-style default`.

## Things to know

- If you install at user level, bogan names show up in every project. Use `--project` if your team might not see the joke.
- A `CLAUDE.md` or `AGENTS.md` that sets rules for code comments can override the bogan comments.
- The jokes aim at the culture, affectionately. The style tells Claude to avoid slurs and to never punch down. If you see it cross that line, open an issue.

## License

MIT
