/**
 * UserPromptSubmit hook: name a `/refine KEY` session after its ticket key.
 *
 * Reads the hook payload on stdin. Prints a sessionTitle only when the session
 * has no title yet, or its title starts with the key, so a name you chose
 * yourself stays. Runs on Node 22.18 or later, which strips the types itself.
 */
import { readFileSync } from "node:fs";

const REFINE = /^\s*\/refine\s+([A-Z][A-Z0-9]+-\d+)\b/;

interface HookEvent {
  prompt?: string;
  session_title?: string;
}

function readEvent(): HookEvent | null {
  try {
    return JSON.parse(readFileSync(0, "utf8")) as HookEvent;
  } catch {
    return null;
  }
}

const event = readEvent();
const key = event && REFINE.exec(event.prompt ?? "")?.[1];
const title = (event?.session_title ?? "").trim();

if (key && title !== key && (title === "" || title.startsWith(key))) {
  const output = { hookSpecificOutput: { hookEventName: "UserPromptSubmit", sessionTitle: key } };
  process.stdout.write(JSON.stringify(output));
}
