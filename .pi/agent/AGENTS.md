# Global instructions

## Code comments

Do not add comments to code unless they are **absolutely necessary**. This applies to all languages and file types (including Terraform, HCL, YAML, tests, etc.).

- Do **not** write comments that restate what the code does. If the code needs a comment to be understood, rename things or restructure it instead.
- Do **not** add banner/section comments above tests, blocks, or functions describing what they cover — the name should convey that.
- Do **not** add TODO/FIXME/NOTE comments unless the user explicitly asks for one.
- Do **not** add doc-comments (JSDoc/KDoc/etc.) unless the repository already uses them consistently or the user asks.

The **only** acceptable comments are those that explain a non-obvious _why_ — a subtle constraint, a workaround for an external bug, a deliberate deviation from the obvious approach — that a competent reader could not infer from the code itself. When in doubt, leave it out.

If you catch yourself writing a comment, delete it and ask: "would a reader be confused without this?" If the answer is no, don't write it.
