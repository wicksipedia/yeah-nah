# Yeah Nah

G'day legend. Yeah Nah is an output style for [Claude Code](https://claude.com/claude-code) that turns Claude into a fair dinkum Aussie bogan who still writes code tighter than a fresh carton's shrink wrap.

It's one Markdown file. No model weights, no GPUs, no trainin'. Just a bit of attitude.

## How this whole carry-on started

In November 2026 the Nous Research mob dropped [Arete-27B](https://nousresearch.com/arete). They took Alibaba's Qwen3.8-27B and post-trained it to reinforce Western values. Fair play to 'em.

So I reckoned, righto, what about a model that reinforces *bogan* values? Then I priced up GPUs and nearly choked on me servo pie. Fine-tunin' means a dataset, rented hardware and somewhere to host the bloody thing. I'm tighter than a fish's arse, so I wrote an output style instead. It swaps Claude's system prompt for a Markdown file, costs nothin', and gets you most of the way to the bottle-o.

## What you get

**In chat**, Claude talks like your mate at the pub. It calls you "legend" and "champ", compares your codebase to a shed nobody's cleaned since '94, and calls a flaky test a ute that won't start on a cold mornin'.

**In code**, new variables, functions and classes get bogan names that still tell you what they do. Comments get the treatment too:

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

## What stays sensible

She's a larrikin, not a vandal. Claude leaves these alone:

- **Your existing code.** It won't rename a thing unless you ask.
- **Names other stuff relies on**, like public APIs, config keys, env vars, database columns and anything your framework wants. Rename those and the whole lot's rooted.
- **Commit messages, PR descriptions and shell commands.** Your reviewers have enough on their plate.
- **Errors, security warnings and "you're about to delete prod" checks.** Claude gives you the straight facts first, then the banter.

## Gettin' it on your machine

For your whole user account, so it's in every project:

```sh
curl -fsSL https://raw.githubusercontent.com/wicksipedia/yeah-nah/main/install.sh | bash
```

For just the project you're sittin' in:

```sh
curl -fsSL https://raw.githubusercontent.com/wicksipedia/yeah-nah/main/install.sh | bash -s -- --project
```

Not keen on pipin' scripts into bash? Good on ya. Clone the repo and run `./install.sh`, or chuck `output-styles/yeah-nah.md` into `~/.claude/output-styles/` yourself.

Claude Code only checks for output styles when a session starts, so give it a restart, then run:

```
/output-style Yeah Nah
```

## Had enough?

No wukkas. Delete `~/.claude/output-styles/yeah-nah.md` (or `.claude/output-styles/yeah-nah.md` in your project) and run `/output-style default`. Back to bein' a corporate drone.

## Before you get too excited

- Install it at user level and bogan names turn up in *every* project, work stuff included. If your boss doesn't get the joke, use `--project`.
- If your `CLAUDE.md` or `AGENTS.md` has strict rules about code comments, those can win and you'll get boring comments. Your call, mate.
- It's taking the mickey out of the culture, with love. The style tells Claude no slurs and no punchin' down. If it ever crosses the line, open an issue and we'll sort it.

## License

MIT. Do what ya like with it, just don't blame me when your tech lead spits the dummy.
