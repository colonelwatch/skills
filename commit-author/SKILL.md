---
name: commit-author
description: User's guidelines for authoring commits. Use when authoring commits, in conjunction with another commit authoring skill if it is available.
compatibility: Requires GNU awk (`gawk`) and `rumdl`.
---

# Guidelines for authoring commits

These guidelines are a reflection of their own process for authoring commits, applied on top of existing guidelines. If these guidelines conflict with the existing ones, confirm the next steps with the user.

Run scripts relative to this skill's directory. All scripts in `scripts` are expected to be executable; execute them directly, without an interpreter (e.g. no `awk`, `python3`, `bash`, etc.).

## Writing commit messages

These are guidelines for writing commit messages.

### Syntax

Use CommonMark Markdown instead of GitHub Flavored Markdown (GFM), and in particular do the following.

- Use backticks (e.g. `var`) for code-related words, including but not limited to the following:
  - literal code symbols,
  - file paths/names, and
  - command names, unless it is obviously not in a shell context, like if the stylized name (e.g. Cppcheck vs `cppcheck`).
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

Use `rumdl fmt --config line-length=72 --config MD013.reflow=true --disable MD041 FILE...` (where `FILE` is the file to edit in-place or `-` to read from standard input and write to standard output) on paragraphs (separated by double `\n`) as the authoritative Markdown formatter, including word wrap. Do this sooner than reasoning about character counts. Prefer using standard input with heredocs.

Use `scripts/verify_length.awk -v subject=50 -v body=72 FILE...` (where `FILE` is the file to read or `-` to read from standard input) as the _authoritative_ verifier: it prints potential offenders as `<NL>\t<NC>\t<LINE>`. All other length checks, including agent-authored ones, are to be treated as purely informational. Prefer using standard input with heredocs.

Do run the aforementioned `scripts/verify_length.awk` and then `rumdl fmt` commands on the _entire_ commit message (subject line and body) immediately before committing. If those it is not obviously safe to proceed, confirm the next steps with the user first.
