# claude-code-starter

A minimal starter project pre-wired for [Vesalius](https://github.com/haplollc/Vesalius), the on-device code graph for Claude Code. Clone it, connect Vesalius, and ask Claude Code about the sample Swift package. The package is deliberately small, with a few types that call each other, so the graph has something real to index: `OrderService` calls `PricingService` and `OrderStore`, and notifies through the `Notifier` protocol.

## Setup in 3 steps

First, install Vesalius and register it with Claude Code:

```bash
brew install haplollc/tap/vesalius
vesalius setup
```

Next, clone this repo and open Claude Code in it. When Claude Code sees the `.mcp.json` in this repo, approve the Vesalius entry once. That file is the project-scoped form of the registration Vesalius setup performs, running `vesalius mcp` for this project only. If Claude Code cannot find the `vesalius` command, use its full path, `/opt/homebrew/bin/vesalius`, in `.mcp.json` instead.

Then ask Claude Code about the code the way you normally would. Try:

- Who calls `OrderService.placeOrder`, and what would I have to update if I renamed it?
- Where is pricing handled?
- Are there any circular imports in this package?
- What is in `PricingService`?

Most answers come back in one call, with file and line evidence. You need a Mac with Apple silicon and Claude Code or another MCP client.

## Before and after

In the Vesalius benchmark, Claude Code averaged 204k tokens per question without Vesalius and 113k tokens per question with Vesalius, and Claude chose Vesalius in 20 of 20 runs. Read the full write-up, including the setup and how answers were graded, in the [Vesalius benchmark docs](https://github.com/haplollc/Vesalius/blob/main/docs/benchmark/README.md).

## What is in this repo

- `.mcp.json`: registers the Vesalius MCP server for this project.
- `Package.swift` and `Sources/SampleKit`: a small Swift package with orders, pricing, storage, and notifications, written so the call graph is worth exploring.

Vesalius never writes to your repository and never uploads your code. Indexes live on your Mac.
