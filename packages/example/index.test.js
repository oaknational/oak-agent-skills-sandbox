import assert from "node:assert/strict";
import { test } from "node:test";

import { greet } from "./index.js";

test("greet names the person", () => {
  assert.equal(greet("sandbox"), "Hello, sandbox");
});
