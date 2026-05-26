/**
 * Custom ASCII Header Extension
 *
 * Displays ASCII art when Pi launches.
 */

import type { ExtensionAPI, Theme } from "@earendil-works/pi-coding-agent";
import { VERSION } from "@earendil-works/pi-coding-agent";

function getAsciiArt(theme: Theme): string[] {
  const accent = (t: string) => theme.fg("accent", t);
  const muted = (t: string) => theme.fg("muted", t);
  const dim = (t: string) => theme.fg("dim", t);

  return [
    "",
    accent("        ██████╗ ██╗"),
    accent("        ██╔══██╗██║"),
    accent("        ██████╔╝██║"),
    accent("        ██╔═══╝ ██║"),
    accent("        ██║     ██║"),
    accent("        ╚═╝     ╚═╝"),
    "",
    muted("         coding agent") + dim(` v${VERSION}`),
    "",
  ];
}

export default function (pi: ExtensionAPI) {
  pi.on("session_start", async (_event, ctx) => {
    if (ctx.hasUI) {
      ctx.ui.setHeader((_tui, theme) => ({
        render(_width: number): string[] {
          return getAsciiArt(theme);
        },
        invalidate() {},
      }));
    }
  });

  pi.registerCommand("builtin-header", {
    description: "Restore built-in header",
    handler: async (_args, ctx) => {
      ctx.ui.setHeader(undefined);
      ctx.ui.notify("Built-in header restored", "info");
    },
  });
}
