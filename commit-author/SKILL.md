---
name: commit-author
description: User's guidelines for authoring commits. Use when authoring commits, in conjunction with another commit authoring skill if it is available.
---

# Guidelines for authoring commits

These guidelines are a reflection of their own process for authoring commits, applied on top of existing guidelines. If these guidelines conflict with the existing ones, confirm the next steps with the user.

Run scripts relative to this skill's directory.

## Writing commit messages

These are guidelines for writing commit messages.

### Syntax

Use CommonMark Markdown instead of GitHub Flavored Markdown (GFM), and in particular do the following.

- Use backticks (e.g. `var`) for any code symbols, unless it obviously is distinct not the code symbol version or is by its stylized name (e.g. Cppcheck vs `cppcheck`).
- Use `<https://...>`, i.e. angle brackets, for autolinks (links written verbatim) instead of omitting brackets, which is GFM.

Also apply Markdown syntax to the subject line if it is applicable.

### Body prose

The content of a Git commit's message is important for explaining motivation and context, which at this moment lives only in the session transcript and the user's head, and providing a compact, to-the-point summary.

- If the entire diff can be accurately captured by the subject line, omit the body.
- Start the body with a compact, to-the-point summary paragraph/sentence. Omit details that are obvious from the diff.
- Session transcripts are rich with context but not available in the Git history, so mine them for anything necessary to understanding the diff.
  - If the diff is not obviously explainable from the transcript alone, ask the user if there is anything they would like to add.

### The 50/72 rule

For readability, the first line (the subject line) _should_ be 50 characters long, the second line _must_ be empty, and the following lines (the body) _should_ be 72 characters long. An example of something that will exceed 72 characters in the body is a long link.

Use `scripts/verify_length.awk [-v subject=SUBJECT] [-v body=BODY]` as the verifier: it prints potential offenders as `<NL>\t<NC>\t<LINE>`.

When the text is verified, use `fmt -w 72 FILE...` (where `FILE` is the file to read, or `-` to read from standard input) as an aide that finds further word wrap, i.e. moving a word to the previous line if it fits. Do run `fmt` immediately before committing, but sanity-check its output.
