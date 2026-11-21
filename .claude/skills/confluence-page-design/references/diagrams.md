# Diagrams from the Atlassian ecosystem

A live diagram is the best visual anchor for specs, plans, PRDs and architecture decisions: readers see the system or flow at a glance, and the diagram stays editable by the team. Prefer a native **Confluence whiteboard embedded in the page** over a static image — it renders in place (an iframe-style embed card), people can click through to edit it, and it never goes stale as an attachment.

## When a diagram earns its place

Draw one when the page describes something with structure the reader would otherwise reconstruct in their head:

- **Tech spec / plan**: architecture or component diagram (who calls whom), sequence/data flow for the main request, or a rollout timeline.
- **PRD**: the user journey or flow through the feature (happy path + key branches).
- **ADR**: before/after or options side by side, only if the decision is structural (e.g. where a boundary sits). A pure library/vendor choice usually doesn't need one — a comparison table is enough.
- **Project/roadmap pages**: a timeline/roadmap board.

If the diagram would just restate a 3-item list, skip it.

## Workflow: whiteboard → embed

1. **Load the whiteboard guide**: `executeRead` → `getContentFormatGuide` with `{toolName: "createConfluenceWhiteboard"}`. It is a multi-file guide — follow its instructions to load each reference it lists (`reference` param), including template matching, the flowchart/roadmap reference that fits, design guidelines, and the visual quality gate. The guide is authoritative for SVG shape, palette tokens and ids; don't author whiteboard SVG from memory.
2. **Create the whiteboard** with `createConfluenceContent`: `contentType: "whiteboard"`, `body: {format: "svg", value: <full SVG>}`, same `parent` as the page (space root or the page's parent), title like `<Short subject> — <diagram name>` (e.g. "Delivery slots — request flow"). Whiteboard titles are capped at 60 characters, so keep it short. Keep it focused: one diagram per board, 5–12 nodes, labels in plain words, left-to-right or top-to-bottom flow.
3. **Verify it** per the guide's quality gate (read back with `getConfluenceContent`, `content_format: "png"` to inspect the render). If text is hidden or the layout is cramped, fix it before embedding.
4. **Embed in the page** where the reader needs it (usually right under the section's intro sentence, or in the header's left column for architecture overviews):

```html
<p>The request flow, from checkout to kitchen:</p>
<a href="https://SITE.atlassian.net/wiki/spaces/KEY/whiteboard/WHITEBOARD_ID" data-card-appearance="embed" data-layout="wide"></a>
```

Use the full URL returned by the create call (`baseUrl` + `webUrl`). Embed cards are block-level — put them on their own, not inside a paragraph or a panel. `data-layout="wide"` (or `full-width` on max-width pages) gives diagrams room. Add a one-line caption sentence above it saying what the diagram shows, since embeds have no alt text.

5. Mention the whiteboard link in your final message so the user knows it exists as its own item in the space tree.

## Fallbacks

- **Whiteboards not enabled / create fails**: try the guide's Remix infographic operation (`createConfluenceInfographicForPage`, if listed in the page format guide) to generate a source-backed visual, or embed a diagram the user already has (Figma, Lucid, draw.io/Google Drawings URL) as an `embed` smart card.
- **Nothing available**: use a gray custom placeholder panel stating exactly which diagram to draw (nodes and arrows in words), so the author can add it in a minute.
- Never point at local files or invent media IDs or URLs.
