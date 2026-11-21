# Confluence HTML cheat sheet

Patterns for the design moves in SKILL.md, in the HTML the Atlassian MCP accepts (`body.format: "html"`). The live `getContentFormatGuide` output is authoritative — if it differs from this file, follow the guide. Emit a body fragment only (no `<html>`/`<body>`, no code fences), and never use storage XML (`<ac:structured-macro>` etc.); it renders as raw text.

## Contents
- Header: summary panel
- Panels
- Layouts and columns
- Stat / highlight tiles
- Expand
- Status, emoji, dates, mentions
- Tables (wide)
- Smart links and embeds
- Images and visual placeholders
- Tasks and decisions
- Code
- Nesting gotchas

## Header: summary panel

The default opening for every page: the summary panel alone, at full width — no layout section, no key-facts line, no Table of Contents macro. The first H2 follows directly.

```html
<div data-type="panel-info">
  <p><strong>What this is:</strong> How the checkout service limits and retries requests.</p>
  <p><strong>Who it's for:</strong> Engineers integrating with or on call for checkout.</p>
  <p><strong>Key takeaway:</strong> Clients get 100 req/min; retry 429s with exponential backoff, max 5 tries.</p>
</div>
```

On a wide page the full-width panel has long lines, so keep each summary line to one short sentence.

Use `<time datetime="YYYY-MM-DD">` for every real date. Use a mention span only with a real account ID; otherwise `[@Name]` text.

## Panels

```html
<div data-type="panel-info"><p>Context or summary.</p></div>
<div data-type="panel-success"><p>Tip or desired outcome.</p></div>
<div data-type="panel-note"><p>Heads-up the reader might miss.</p></div>
<div data-type="panel-warning"><p>Risk, irreversible step, deadline.</p></div>
<div data-type="panel-error"><p>Don't do this / breaking change.</p></div>
<div data-type="panel-custom" data-icon=":bulb:" data-color="#EAE6FF"><p>Custom callout.</p></div>
```

Custom panel colours only from the guide's background palette (e.g. `#DEEBFF` light blue, `#E3FCEF` light green, `#FFFAE6` light yellow, `#EAE6FF` light purple, `#F4F5F7` light gray).

## Layouts and columns

`data-type` values: `layout-two-equal`, `layout-two-left-sidebar`, `layout-two-right-sidebar`, `layout-three-equal`, `layout-three-with-sidebars`, `layout-section` (custom widths via column `data-width`). Supply the matching number of `<div data-type="column">` children.

Steps + screenshot:

```html
<section data-type="layout-two-equal">
  <div data-type="column">
    <h3>1. Open the billing settings</h3>
    <p>Go to <strong>Settings → Billing</strong> and choose <strong>Invoices</strong>.</p>
  </div>
  <div data-type="column">
    <div data-type="panel-custom" data-icon=":frame_photo:" data-color="#F4F5F7"><p><em>Screenshot to add:</em> Billing → Invoices tab with the export button highlighted.</p></div>
  </div>
</section>
```

Comparison (3 columns):

```html
<section data-type="layout-three-equal">
  <div data-type="column"><h3>Option A — Build</h3><p>…</p></div>
  <div data-type="column"><h3>Option B — Buy</h3><p>…</p></div>
  <div data-type="column"><h3>Option C — Defer</h3><p>…</p></div>
</section>
```

Breathing room between major blocks: a new layout section, or `<hr>`.

## Stat / highlight tiles

Light content only — for 2–4 headline numbers (e.g. a PRD's problem evidence or meeting metrics), at most one row per page. Put the figure in bold text, not a heading: headings inside tiles end up in the page outline and break the H2/H3 order.

```html
<section data-type="layout-three-equal">
  <div data-type="column"><div data-type="panel-custom" data-icon=":chart_with_upwards_trend:" data-color="#E3FCEF"><p><strong>+18%</strong></p><p>Orders vs. October</p></div></div>
  <div data-type="column"><div data-type="panel-custom" data-icon=":stopwatch:" data-color="#DEEBFF"><p><strong>2.4 days</strong></p><p>Avg. fulfilment time</p></div></div>
  <div data-type="column"><div data-type="panel-custom" data-icon=":warning:" data-color="#FFFAE6"><p><strong>3</strong></p><p>Open incidents</p></div></div>
</section>
```

## Expand

```html
<details><summary>Full error codes (14)</summary><table>…</table></details>
```

Use for FAQ answers, logs, edge cases, appendix detail. Expands can't go inside panels.

## Status, emoji, dates, mentions

```html
<span data-type="status" data-color="green">Done</span>
<span data-type="status" data-color="blue">In progress</span>
<span data-type="status" data-color="yellow">At risk</span>
<span data-type="status" data-color="red">Blocked</span>
<span data-type="status" data-color="neutral">Not started</span>
<span data-type="status" data-color="purple">In review</span>

<span data-type="emoji" data-shortname=":white_check_mark:">✅</span>
<time datetime="2026-12-01">Dec 1, 2026</time>
```

## Tables (wide)

```html
<table data-layout="wide">
  <thead><tr><th>Service</th><th>Owner</th><th>Status</th></tr></thead>
  <tbody>
    <tr><td>Checkout</td><td>[@Jane Doe]</td><td><span data-type="status" data-color="green">Healthy</span></td></tr>
  </tbody>
</table>
```

Put a one-line takeaway above a data table ("Two services are degraded; both have owners"). Cell backgrounds via `data-background` from the palette.

## Smart links and embeds

```html
<p><a href="https://example.com/doc" data-card-appearance="inline"></a></p>
<a href="https://example.com/main-spec" data-card-appearance="block"></a>
<a href="https://www.loom.com/share/ID" data-card-appearance="embed"></a>
```

Cards drop anchor text — leave them empty. Embed for video, Figma, Google Docs, Jira, whiteboards. Same-page jumps: `<a href="#Heading-text">` (spaces → hyphens).

## Images and visual placeholders

External image (no upload needed):

```html
<figure data-type="media-single" data-layout="center" data-width="80" data-width-type="percentage"><img src="https://…/diagram.png" alt="Request flow from client through gateway to checkout"></figure>
```

Widths: ~80% charts/diagrams, ~60% screenshots, 40–50% small images; `wide` layout for big diagrams. Never point at local file paths or invent media IDs — attach first. If no real image exists, use a gray custom panel saying exactly which screenshot/diagram the author should add, or use the guide's Remix/infographic operation if offered and appropriate.

## Tasks and decisions

```html
<ul data-type="task-list"><li data-type="task-item"><input type="checkbox"> [@Sam] Draft the migration plan by <time datetime="2026-12-05">Dec 5</time></li></ul>
<ul data-type="decision-list"><li data-type="decision-item" data-state="DECIDED">Ship v2 behind a feature flag</li></ul>
```

## Code

```html
<pre><code class="language-bash">kubectl rollout restart deploy/checkout</code></pre>
```

Always set the language.

## Nesting gotchas

- Panels can't contain tables, expands, blockquotes, embed cards, or other panels.
- Layout sections contain only columns; columns can hold core blocks, tables, expands, cards, extensions.
- Expands can hold tables and nested expands; nested expands hold only core blocks.
- Containers can't be empty.
