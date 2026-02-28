import { R as e } from "./index-BVS4T5_D.js";
function t(e, t, s, n, r) {
  if ("function" == typeof t || !t.has(e))
    throw new TypeError(
      "Cannot write private member to an object whose class did not declare it",
    );
  return (t.set(e, s), s);
}
function s(e, t, s, n) {
  if ("a" === s && !n)
    throw new TypeError("Private accessor was defined without a getter");
  if ("function" == typeof t ? e !== t || !n : !t.has(e))
    throw new TypeError(
      "Cannot read private member from an object whose class did not declare it",
    );
  return "m" === s ? n : "a" === s ? n.call(e) : n ? n.value : t.get(e);
}
let n = function () {
  const { crypto: e } = globalThis;
  if (e?.randomUUID) return ((n = e.randomUUID.bind(e)), e.randomUUID());
  const t = new Uint8Array(1),
    s = e ? () => e.getRandomValues(t)[0] : () => (255 * Math.random()) & 255;
  return "10000000-1000-4000-8000-100000000000".replace(/[018]/g, (e) =>
    (+e ^ (s() & (15 >> (+e / 4)))).toString(16),
  );
};
function r(e) {
  return (
    "object" == typeof e &&
    null !== e &&
    (("name" in e && "AbortError" === e.name) ||
      ("message" in e &&
        String(e.message).includes("FetchRequestCanceledException")))
  );
}
const i = (e) => {
  if (e instanceof Error) return e;
  if ("object" == typeof e && null !== e) {
    try {
      if ("[object Error]" === Object.prototype.toString.call(e)) {
        const t = new Error(e.message, e.cause ? { cause: e.cause } : {});
        return (
          e.stack && (t.stack = e.stack),
          e.cause && !t.cause && (t.cause = e.cause),
          e.name && (t.name = e.name),
          t
        );
      }
    } catch {}
    try {
      return new Error(JSON.stringify(e));
    } catch {}
  }
  return new Error(e);
};
class o extends Error {}
class a extends o {
  constructor(e, t, s, n) {
    (super(`${a.makeMessage(e, t, s)}`),
      (this.status = e),
      (this.headers = n),
      (this.requestID = n?.get("request-id")),
      (this.error = t));
  }
  static makeMessage(e, t, s) {
    const n = t?.message
      ? "string" == typeof t.message
        ? t.message
        : JSON.stringify(t.message)
      : t
        ? JSON.stringify(t)
        : s;
    return e && n
      ? `${e} ${n}`
      : e
        ? `${e} status code (no body)`
        : n || "(no status code or body)";
  }
  static generate(e, t, s, n) {
    if (!e || !n) return new l({ message: s, cause: i(t) });
    const r = t;
    return 400 === e
      ? new h(e, r, s, n)
      : 401 === e
        ? new d(e, r, s, n)
        : 403 === e
          ? new p(e, r, s, n)
          : 404 === e
            ? new f(e, r, s, n)
            : 409 === e
              ? new g(e, r, s, n)
              : 422 === e
                ? new m(e, r, s, n)
                : 429 === e
                  ? new y(e, r, s, n)
                  : e >= 500
                    ? new b(e, r, s, n)
                    : new a(e, r, s, n);
  }
}
class c extends a {
  constructor({ message: e } = {}) {
    super(void 0, void 0, e || "Request was aborted.", void 0);
  }
}
class l extends a {
  constructor({ message: e, cause: t }) {
    (super(void 0, void 0, e || "Connection error.", void 0),
      t && (this.cause = t));
  }
}
class u extends l {
  constructor({ message: e } = {}) {
    super({ message: e ?? "Request timed out." });
  }
}
class h extends a {}
class d extends a {}
class p extends a {}
class f extends a {}
class g extends a {}
class m extends a {}
class y extends a {}
class b extends a {}
const w = /^[a-z][a-z0-9+.-]*:/i;
let _ = (e) => ((_ = Array.isArray), _(e)),
  v = _;
function k(e) {
  return "object" != typeof e ? {} : (e ?? {});
}
const S = (e) => {
    try {
      return JSON.parse(e);
    } catch (t) {
      return;
    }
  },
  x = "0.72.1";
const R = () => {
  const e =
    "undefined" != typeof Deno && null != Deno.build
      ? "deno"
      : "undefined" != typeof EdgeRuntime
        ? "edge"
        : "[object process]" ===
            Object.prototype.toString.call(
              void 0 !== globalThis.process ? globalThis.process : 0,
            )
          ? "node"
          : "unknown";
  if ("deno" === e)
    return {
      "X-Stainless-Lang": "js",
      "X-Stainless-Package-Version": x,
      "X-Stainless-OS": P(Deno.build.os),
      "X-Stainless-Arch": M(Deno.build.arch),
      "X-Stainless-Runtime": "deno",
      "X-Stainless-Runtime-Version":
        "string" == typeof Deno.version
          ? Deno.version
          : (Deno.version?.deno ?? "unknown"),
    };
  if ("undefined" != typeof EdgeRuntime)
    return {
      "X-Stainless-Lang": "js",
      "X-Stainless-Package-Version": x,
      "X-Stainless-OS": "Unknown",
      "X-Stainless-Arch": `other:${EdgeRuntime}`,
      "X-Stainless-Runtime": "edge",
      "X-Stainless-Runtime-Version": globalThis.process.version,
    };
  if ("node" === e)
    return {
      "X-Stainless-Lang": "js",
      "X-Stainless-Package-Version": x,
      "X-Stainless-OS": P(globalThis.process.platform ?? "unknown"),
      "X-Stainless-Arch": M(globalThis.process.arch ?? "unknown"),
      "X-Stainless-Runtime": "node",
      "X-Stainless-Runtime-Version": globalThis.process.version ?? "unknown",
    };
  const t = (function () {
    if ("undefined" == typeof navigator || !navigator) return null;
    const e = [
      { key: "edge", pattern: /Edge(?:\W+(\d+)\.(\d+)(?:\.(\d+))?)?/ },
      { key: "ie", pattern: /MSIE(?:\W+(\d+)\.(\d+)(?:\.(\d+))?)?/ },
      { key: "ie", pattern: /Trident(?:.*rv\:(\d+)\.(\d+)(?:\.(\d+))?)?/ },
      { key: "chrome", pattern: /Chrome(?:\W+(\d+)\.(\d+)(?:\.(\d+))?)?/ },
      { key: "firefox", pattern: /Firefox(?:\W+(\d+)\.(\d+)(?:\.(\d+))?)?/ },
      {
        key: "safari",
        pattern:
          /(?:Version\W+(\d+)\.(\d+)(?:\.(\d+))?)?(?:\W+Mobile\S*)?\W+Safari/,
      },
    ];
    for (const { key: t, pattern: s } of e) {
      const e = s.exec(navigator.userAgent);
      if (e) {
        return {
          browser: t,
          version: `${e[1] || 0}.${e[2] || 0}.${e[3] || 0}`,
        };
      }
    }
    return null;
  })();
  return t
    ? {
        "X-Stainless-Lang": "js",
        "X-Stainless-Package-Version": x,
        "X-Stainless-OS": "Unknown",
        "X-Stainless-Arch": "unknown",
        "X-Stainless-Runtime": `browser:${t.browser}`,
        "X-Stainless-Runtime-Version": t.version,
      }
    : {
        "X-Stainless-Lang": "js",
        "X-Stainless-Package-Version": x,
        "X-Stainless-OS": "Unknown",
        "X-Stainless-Arch": "unknown",
        "X-Stainless-Runtime": "unknown",
        "X-Stainless-Runtime-Version": "unknown",
      };
};
const M = (e) =>
    "x32" === e
      ? "x32"
      : "x86_64" === e || "x64" === e
        ? "x64"
        : "arm" === e
          ? "arm"
          : "aarch64" === e || "arm64" === e
            ? "arm64"
            : e
              ? `other:${e}`
              : "unknown",
  P = (e) =>
    (e = e.toLowerCase()).includes("ios")
      ? "iOS"
      : "android" === e
        ? "Android"
        : "darwin" === e
          ? "MacOS"
          : "win32" === e
            ? "Windows"
            : "freebsd" === e
              ? "FreeBSD"
              : "openbsd" === e
                ? "OpenBSD"
                : "linux" === e
                  ? "Linux"
                  : e
                    ? `Other:${e}`
                    : "Unknown";
let O;
function $(...e) {
  const t = globalThis.ReadableStream;
  if (void 0 === t)
    throw new Error(
      "`ReadableStream` is not defined as a global; You will need to polyfill it, `globalThis.ReadableStream = ReadableStream`",
    );
  return new t(...e);
}
function T(e) {
  let t =
    Symbol.asyncIterator in e
      ? e[Symbol.asyncIterator]()
      : e[Symbol.iterator]();
  return $({
    start() {},
    async pull(e) {
      const { done: s, value: n } = await t.next();
      s ? e.close() : e.enqueue(n);
    },
    async cancel() {
      await t.return?.();
    },
  });
}
function A(e) {
  if (e[Symbol.asyncIterator]) return e;
  const t = e.getReader();
  return {
    async next() {
      try {
        const e = await t.read();
        return (e?.done && t.releaseLock(), e);
      } catch (e) {
        throw (t.releaseLock(), e);
      }
    },
    async return() {
      const e = t.cancel();
      return (t.releaseLock(), await e, { done: !0, value: void 0 });
    },
    [Symbol.asyncIterator]() {
      return this;
    },
  };
}
const j = ({ headers: e, body: t }) => ({
  bodyHeaders: { "content-type": "application/json" },
  body: JSON.stringify(t),
});
let q, E;
function I(e) {
  let t;
  return (q ?? ((t = new globalThis.TextEncoder()), (q = t.encode.bind(t))))(e);
}
function L(e) {
  let t;
  return (E ?? ((t = new globalThis.TextDecoder()), (E = t.decode.bind(t))))(e);
}
var W, U;
class N {
  constructor() {
    (W.set(this, void 0),
      U.set(this, void 0),
      t(this, W, new Uint8Array()),
      t(this, U, null));
  }
  decode(e) {
    if (null == e) return [];
    const n =
      e instanceof ArrayBuffer
        ? new Uint8Array(e)
        : "string" == typeof e
          ? I(e)
          : e;
    t(
      this,
      W,
      (function (e) {
        let t = 0;
        for (const r of e) t += r.length;
        const s = new Uint8Array(t);
        let n = 0;
        for (const r of e) (s.set(r, n), (n += r.length));
        return s;
      })([s(this, W, "f"), n]),
    );
    const r = [];
    let i;
    for (; null != (i = C(s(this, W, "f"), s(this, U, "f"))); ) {
      if (i.carriage && null == s(this, U, "f")) {
        t(this, U, i.index);
        continue;
      }
      if (
        null != s(this, U, "f") &&
        (i.index !== s(this, U, "f") + 1 || i.carriage)
      ) {
        (r.push(L(s(this, W, "f").subarray(0, s(this, U, "f") - 1))),
          t(this, W, s(this, W, "f").subarray(s(this, U, "f"))),
          t(this, U, null));
        continue;
      }
      const e = null !== s(this, U, "f") ? i.preceding - 1 : i.preceding,
        n = L(s(this, W, "f").subarray(0, e));
      (r.push(n),
        t(this, W, s(this, W, "f").subarray(i.index)),
        t(this, U, null));
    }
    return r;
  }
  flush() {
    return s(this, W, "f").length ? this.decode("\n") : [];
  }
}
function C(e, t) {
  for (let s = t ?? 0; s < e.length; s++) {
    if (10 === e[s]) return { preceding: s, index: s + 1, carriage: !1 };
    if (13 === e[s]) return { preceding: s, index: s + 1, carriage: !0 };
  }
  return null;
}
function D(e) {
  for (let t = 0; t < e.length - 1; t++) {
    if (10 === e[t] && 10 === e[t + 1]) return t + 2;
    if (13 === e[t] && 13 === e[t + 1]) return t + 2;
    if (
      13 === e[t] &&
      10 === e[t + 1] &&
      t + 3 < e.length &&
      13 === e[t + 2] &&
      10 === e[t + 3]
    )
      return t + 4;
  }
  return -1;
}
((W = new WeakMap()),
  (U = new WeakMap()),
  (N.NEWLINE_CHARS = new Set(["\n", "\r"])),
  (N.NEWLINE_REGEXP = /\r\n|[\n\r]/g));
const B = { off: 0, error: 200, warn: 300, info: 400, debug: 500 },
  X = (e, t, s) => {
    var n, r;
    if (e)
      return (
        (n = B),
        (r = e),
        Object.prototype.hasOwnProperty.call(n, r)
          ? e
          : void V(s).warn(
              `${t} was set to ${JSON.stringify(e)}, expected one of ${JSON.stringify(Object.keys(B))}`,
            )
      );
  };
function H() {}
function F(e, t, s) {
  return !t || B[e] > B[s] ? H : t[e].bind(t);
}
const J = { error: H, warn: H, info: H, debug: H };
let K = new WeakMap();
function V(e) {
  const t = e.logger,
    s = e.logLevel ?? "off";
  if (!t) return J;
  const n = K.get(t);
  if (n && n[0] === s) return n[1];
  const r = {
    error: F("error", t, s),
    warn: F("warn", t, s),
    info: F("info", t, s),
    debug: F("debug", t, s),
  };
  return (K.set(t, [s, r]), r);
}
const z = (e) => (
  e.options && ((e.options = { ...e.options }), delete e.options.headers),
  e.headers &&
    (e.headers = Object.fromEntries(
      (e.headers instanceof Headers
        ? [...e.headers]
        : Object.entries(e.headers)
      ).map(([e, t]) => [
        e,
        "x-api-key" === e.toLowerCase() ||
        "authorization" === e.toLowerCase() ||
        "cookie" === e.toLowerCase() ||
        "set-cookie" === e.toLowerCase()
          ? "***"
          : t,
      ]),
    )),
  "retryOfRequestLogID" in e &&
    (e.retryOfRequestLogID && (e.retryOf = e.retryOfRequestLogID),
    delete e.retryOfRequestLogID),
  e
);
var G, Q, Y;
class Z {
  constructor(e, s, n) {
    ((this.iterator = e),
      G.set(this, void 0),
      (this.controller = s),
      t(this, G, n));
  }
  static fromSSEResponse(e, t, s) {
    let n = !1;
    const i = s ? V(s) : console;
    return new Z(
      async function* () {
        if (n)
          throw new o(
            "Cannot iterate over a consumed stream, use `.tee()` to split the stream.",
          );
        n = !0;
        let s = !1;
        try {
          for await (const s of (async function* (e, t) {
            if (!e.body) {
              if (
                (t.abort(),
                void 0 !== globalThis.navigator &&
                  "ReactNative" === globalThis.navigator.product)
              )
                throw new o(
                  "The default react-native fetch implementation does not support streaming. Please use expo/fetch: https://docs.expo.dev/versions/latest/sdk/expo/#expofetch-api",
                );
              throw new o("Attempted to iterate over a response with no body");
            }
            const s = new ee(),
              n = new N(),
              r = A(e.body);
            for await (const i of (async function* (e) {
              let t = new Uint8Array();
              for await (const s of e) {
                if (null == s) continue;
                const e =
                  s instanceof ArrayBuffer
                    ? new Uint8Array(s)
                    : "string" == typeof s
                      ? I(s)
                      : s;
                let n,
                  r = new Uint8Array(t.length + e.length);
                for (r.set(t), r.set(e, t.length), t = r; -1 !== (n = D(t)); )
                  (yield t.slice(0, n), (t = t.slice(n)));
              }
              t.length > 0 && (yield t);
            })(r))
              for (const e of n.decode(i)) {
                const t = s.decode(e);
                t && (yield t);
              }
            for (const i of n.flush()) {
              const e = s.decode(i);
              e && (yield e);
            }
          })(e, t)) {
            if ("completion" === s.event)
              try {
                yield JSON.parse(s.data);
              } catch (c) {
                throw (
                  i.error("Could not parse message into JSON:", s.data),
                  i.error("From chunk:", s.raw),
                  c
                );
              }
            if (
              "message_start" === s.event ||
              "message_delta" === s.event ||
              "message_stop" === s.event ||
              "content_block_start" === s.event ||
              "content_block_delta" === s.event ||
              "content_block_stop" === s.event
            )
              try {
                yield JSON.parse(s.data);
              } catch (c) {
                throw (
                  i.error("Could not parse message into JSON:", s.data),
                  i.error("From chunk:", s.raw),
                  c
                );
              }
            if ("ping" !== s.event && "error" === s.event)
              throw new a(void 0, S(s.data) ?? s.data, void 0, e.headers);
          }
          s = !0;
        } catch (c) {
          if (r(c)) return;
          throw c;
        } finally {
          s || t.abort();
        }
      },
      t,
      s,
    );
  }
  static fromReadableStream(e, t, s) {
    let n = !1;
    return new Z(
      async function* () {
        if (n)
          throw new o(
            "Cannot iterate over a consumed stream, use `.tee()` to split the stream.",
          );
        n = !0;
        let s = !1;
        try {
          for await (const t of (async function* () {
            const t = new N(),
              s = A(e);
            for await (const e of s) for (const s of t.decode(e)) yield s;
            for (const e of t.flush()) yield e;
          })())
            s || (t && (yield JSON.parse(t)));
          s = !0;
        } catch (i) {
          if (r(i)) return;
          throw i;
        } finally {
          s || t.abort();
        }
      },
      t,
      s,
    );
  }
  [((G = new WeakMap()), Symbol.asyncIterator)]() {
    return this.iterator();
  }
  tee() {
    const e = [],
      t = [],
      n = this.iterator(),
      r = (s) => ({
        next: () => {
          if (0 === s.length) {
            const s = n.next();
            (e.push(s), t.push(s));
          }
          return s.shift();
        },
      });
    return [
      new Z(() => r(e), this.controller, s(this, G, "f")),
      new Z(() => r(t), this.controller, s(this, G, "f")),
    ];
  }
  toReadableStream() {
    const e = this;
    let t;
    return $({
      async start() {
        t = e[Symbol.asyncIterator]();
      },
      async pull(e) {
        try {
          const { value: s, done: n } = await t.next();
          if (n) return e.close();
          const r = I(JSON.stringify(s) + "\n");
          e.enqueue(r);
        } catch (s) {
          e.error(s);
        }
      },
      async cancel() {
        await t.return?.();
      },
    });
  }
}
class ee {
  constructor() {
    ((this.event = null), (this.data = []), (this.chunks = []));
  }
  decode(e) {
    if ((e.endsWith("\r") && (e = e.substring(0, e.length - 1)), !e)) {
      if (!this.event && !this.data.length) return null;
      const e = {
        event: this.event,
        data: this.data.join("\n"),
        raw: this.chunks,
      };
      return ((this.event = null), (this.data = []), (this.chunks = []), e);
    }
    if ((this.chunks.push(e), e.startsWith(":"))) return null;
    let [t, s, n] = (function (e, t) {
      const s = e.indexOf(t);
      if (-1 !== s) return [e.substring(0, s), t, e.substring(s + t.length)];
      return [e, "", ""];
    })(e, ":");
    return (
      n.startsWith(" ") && (n = n.substring(1)),
      "event" === t ? (this.event = n) : "data" === t && this.data.push(n),
      null
    );
  }
}
async function te(e, t) {
  const {
      response: s,
      requestLogID: n,
      retryOfRequestLogID: r,
      startTime: i,
    } = t,
    o = await (async () => {
      if (t.options.stream)
        return (
          V(e).debug("response", s.status, s.url, s.headers, s.body),
          t.options.__streamClass
            ? t.options.__streamClass.fromSSEResponse(s, t.controller)
            : Z.fromSSEResponse(s, t.controller)
        );
      if (204 === s.status) return null;
      if (t.options.__binaryResponse) return s;
      const n = s.headers.get("content-type"),
        r = n?.split(";")[0]?.trim();
      if (r?.includes("application/json") || r?.endsWith("+json")) {
        return se(await s.json(), s);
      }
      return await s.text();
    })();
  return (
    V(e).debug(
      `[${n}] response parsed`,
      z({
        retryOfRequestLogID: r,
        url: s.url,
        status: s.status,
        body: o,
        durationMs: Date.now() - i,
      }),
    ),
    o
  );
}
function se(e, t) {
  return !e || "object" != typeof e || Array.isArray(e)
    ? e
    : Object.defineProperty(e, "_request_id", {
        value: t.headers.get("request-id"),
        enumerable: !1,
      });
}
class ne extends Promise {
  constructor(e, s, n = te) {
    (super((e) => {
      e(null);
    }),
      (this.responsePromise = s),
      (this.parseResponse = n),
      Q.set(this, void 0),
      t(this, Q, e));
  }
  _thenUnwrap(e) {
    return new ne(s(this, Q, "f"), this.responsePromise, async (t, s) =>
      se(e(await this.parseResponse(t, s), s), s.response),
    );
  }
  asResponse() {
    return this.responsePromise.then((e) => e.response);
  }
  async withResponse() {
    const [e, t] = await Promise.all([this.parse(), this.asResponse()]);
    return { data: e, response: t, request_id: t.headers.get("request-id") };
  }
  parse() {
    return (
      this.parsedPromise ||
        (this.parsedPromise = this.responsePromise.then((e) =>
          this.parseResponse(s(this, Q, "f"), e),
        )),
      this.parsedPromise
    );
  }
  then(e, t) {
    return this.parse().then(e, t);
  }
  catch(e) {
    return this.parse().catch(e);
  }
  finally(e) {
    return this.parse().finally(e);
  }
}
Q = new WeakMap();
class re {
  constructor(e, s, n, r) {
    (Y.set(this, void 0),
      t(this, Y, e),
      (this.options = r),
      (this.response = s),
      (this.body = n));
  }
  hasNextPage() {
    return (
      !!this.getPaginatedItems().length && null != this.nextPageRequestOptions()
    );
  }
  async getNextPage() {
    const e = this.nextPageRequestOptions();
    if (!e)
      throw new o(
        "No next page expected; please check `.hasNextPage()` before calling `.getNextPage()`.",
      );
    return await s(this, Y, "f").requestAPIList(this.constructor, e);
  }
  async *iterPages() {
    let e = this;
    for (yield e; e.hasNextPage(); ) ((e = await e.getNextPage()), yield e);
  }
  async *[((Y = new WeakMap()), Symbol.asyncIterator)]() {
    for await (const e of this.iterPages())
      for (const t of e.getPaginatedItems()) yield t;
  }
}
class ie extends ne {
  constructor(e, t, s) {
    super(
      e,
      t,
      async (e, t) => new s(e, t.response, await te(e, t), t.options),
    );
  }
  async *[Symbol.asyncIterator]() {
    const e = await this;
    for await (const t of e) yield t;
  }
}
class oe extends re {
  constructor(e, t, s, n) {
    (super(e, t, s, n),
      (this.data = s.data || []),
      (this.has_more = s.has_more || !1),
      (this.first_id = s.first_id || null),
      (this.last_id = s.last_id || null));
  }
  getPaginatedItems() {
    return this.data ?? [];
  }
  hasNextPage() {
    return !1 !== this.has_more && super.hasNextPage();
  }
  nextPageRequestOptions() {
    if (this.options.query?.before_id) {
      const e = this.first_id;
      return e
        ? { ...this.options, query: { ...k(this.options.query), before_id: e } }
        : null;
    }
    const e = this.last_id;
    return e
      ? { ...this.options, query: { ...k(this.options.query), after_id: e } }
      : null;
  }
}
class ae extends re {
  constructor(e, t, s, n) {
    (super(e, t, s, n),
      (this.data = s.data || []),
      (this.has_more = s.has_more || !1),
      (this.next_page = s.next_page || null));
  }
  getPaginatedItems() {
    return this.data ?? [];
  }
  hasNextPage() {
    return !1 !== this.has_more && super.hasNextPage();
  }
  nextPageRequestOptions() {
    const e = this.next_page;
    return e
      ? { ...this.options, query: { ...k(this.options.query), page: e } }
      : null;
  }
}
const ce = () => {
  if ("undefined" == typeof File) {
    const { process: e } = globalThis,
      t =
        "string" == typeof e?.versions?.node &&
        parseInt(e.versions.node.split(".")) < 20;
    throw new Error(
      "`File` is not defined as a global, which is required for file uploads." +
        (t
          ? " Update to Node 20 LTS or newer, or set `globalThis.File` to `import('node:buffer').File`."
          : ""),
    );
  }
};
function le(e, t, s) {
  return (ce(), new File(e, t ?? "unknown_file", s));
}
function ue(e, t) {
  const s =
    ("object" == typeof e &&
      null !== e &&
      (("name" in e && e.name && String(e.name)) ||
        ("url" in e && e.url && String(e.url)) ||
        ("filename" in e && e.filename && String(e.filename)) ||
        ("path" in e && e.path && String(e.path)))) ||
    "";
  return t ? s.split(/[\\/]/).pop() || void 0 : s;
}
const he = (e) =>
    null != e &&
    "object" == typeof e &&
    "function" == typeof e[Symbol.asyncIterator],
  de = async (e, t, s = !0) => ({ ...e, body: await fe(e.body, t, s) }),
  pe = new WeakMap();
const fe = async (e, t, s = !0) => {
    if (
      !(await (function (e) {
        const t = "function" == typeof e ? e : e.fetch,
          s = pe.get(t);
        if (s) return s;
        const n = (async () => {
          try {
            const e =
                "Response" in t ? t.Response : (await t("data:,")).constructor,
              s = new FormData();
            return s.toString() !== (await new e(s).text());
          } catch {
            return !0;
          }
        })();
        return (pe.set(t, n), n);
      })(t))
    )
      throw new TypeError(
        "The provided fetch function does not support file uploads with the current global FormData class.",
      );
    const n = new FormData();
    return (
      await Promise.all(
        Object.entries(e || {}).map(([e, t]) => ge(n, e, t, s)),
      ),
      n
    );
  },
  ge = async (e, t, s, n) => {
    if (void 0 !== s) {
      if (null == s)
        throw new TypeError(
          `Received null for "${t}"; to pass null in FormData, you must use the string 'null'`,
        );
      if ("string" == typeof s || "number" == typeof s || "boolean" == typeof s)
        e.append(t, String(s));
      else if (s instanceof Response) {
        let r = {};
        const i = s.headers.get("Content-Type");
        (i && (r = { type: i }),
          e.append(t, le([await s.blob()], ue(s, n), r)));
      } else if (he(s))
        e.append(t, le([await new Response(T(s)).blob()], ue(s, n)));
      else if (((e) => e instanceof Blob && "name" in e)(s))
        e.append(t, le([s], ue(s, n), { type: s.type }));
      else if (Array.isArray(s))
        await Promise.all(s.map((s) => ge(e, t + "[]", s, n)));
      else {
        if ("object" != typeof s)
          throw new TypeError(
            `Invalid value given to form, expected a string, number, boolean, object, Array, File or Blob but got ${s} instead`,
          );
        await Promise.all(
          Object.entries(s).map(([s, r]) => ge(e, `${t}[${s}]`, r, n)),
        );
      }
    }
  },
  me = (e) =>
    null != e &&
    "object" == typeof e &&
    "number" == typeof e.size &&
    "string" == typeof e.type &&
    "function" == typeof e.text &&
    "function" == typeof e.slice &&
    "function" == typeof e.arrayBuffer;
async function ye(e) {
  let t = [];
  if ("string" == typeof e || ArrayBuffer.isView(e) || e instanceof ArrayBuffer)
    t.push(e);
  else if (me(e)) t.push(e instanceof Blob ? e : await e.arrayBuffer());
  else {
    if (!he(e)) {
      const t = e?.constructor?.name;
      throw new Error(
        `Unexpected data type: ${typeof e}${t ? `; constructor: ${t}` : ""}${(function (
          e,
        ) {
          if ("object" != typeof e || null === e) return "";
          const t = Object.getOwnPropertyNames(e);
          return `; props: [${t.map((e) => `"${e}"`).join(", ")}]`;
        })(e)}`,
      );
    }
    for await (const s of e) t.push(...(await ye(s)));
  }
  return t;
}
class be {
  constructor(e) {
    this._client = e;
  }
}
const we = Symbol.for("brand.privateNullableHeaders");
function* _e(e) {
  if (!e) return;
  if (we in e) {
    const { values: t, nulls: s } = e;
    yield* t.entries();
    for (const e of s) yield [e, null];
    return;
  }
  let t,
    s = !1;
  e instanceof Headers
    ? (t = e.entries())
    : v(e)
      ? (t = e)
      : ((s = !0), (t = Object.entries(e ?? {})));
  for (let n of t) {
    const e = n[0];
    if ("string" != typeof e)
      throw new TypeError("expected header name to be a string");
    const t = v(n[1]) ? n[1] : [n[1]];
    let r = !1;
    for (const n of t)
      void 0 !== n && (s && !r && ((r = !0), yield [e, null]), yield [e, n]);
  }
}
const ve = (e) => {
    const t = new Headers(),
      s = new Set();
    for (const n of e) {
      const e = new Set();
      for (const [r, i] of _e(n)) {
        const n = r.toLowerCase();
        (e.has(n) || (t.delete(r), e.add(n)),
          null === i ? (t.delete(r), s.add(n)) : (t.append(r, i), s.delete(n)));
      }
    }
    return { [we]: !0, values: t, nulls: s };
  },
  ke = Symbol("anthropic.sdk.stainlessHelper");
function Se(e) {
  return "object" == typeof e && null !== e && ke in e;
}
function xe(e, t) {
  const s = new Set();
  if (e) for (const n of e) Se(n) && s.add(n[ke]);
  if (t)
    for (const n of t)
      if ((Se(n) && s.add(n[ke]), Array.isArray(n.content)))
        for (const e of n.content) Se(e) && s.add(e[ke]);
  return Array.from(s);
}
function Re(e, t) {
  const s = xe(e, t);
  return 0 === s.length ? {} : { "x-stainless-helper": s.join(", ") };
}
function Me(e) {
  return e.replace(/[^A-Za-z0-9\-._~!$&'()*+,;=:@]+/g, encodeURIComponent);
}
const Pe = Object.freeze(Object.create(null)),
  Oe = ((e = Me) =>
    function (t, ...s) {
      if (1 === t.length) return t[0];
      let n = !1;
      const r = [],
        i = t.reduce((t, i, o) => {
          /[?#]/.test(i) && (n = !0);
          const a = s[o];
          let c = (n ? encodeURIComponent : e)("" + a);
          return (
            o !== s.length &&
              (null == a ||
                ("object" == typeof a &&
                  a.toString ===
                    Object.getPrototypeOf(
                      Object.getPrototypeOf(a.hasOwnProperty ?? Pe) ?? Pe,
                    )?.toString)) &&
              ((c = a + ""),
              r.push({
                start: t.length + i.length,
                length: c.length,
                error: `Value of type ${Object.prototype.toString.call(a).slice(8, -1)} is not a valid path parameter`,
              })),
            t + i + (o === s.length ? "" : c)
          );
        }, ""),
        a = i.split(/[?#]/, 1)[0],
        c = new RegExp("(?<=^|\\/)(?:\\.|%2e){1,2}(?=\\/|$)", "gi");
      let l;
      for (; null !== (l = c.exec(a)); )
        r.push({
          start: l.index,
          length: l[0].length,
          error: `Value "${l[0]}" can't be safely passed as a path parameter`,
        });
      if ((r.sort((e, t) => e.start - t.start), r.length > 0)) {
        let e = 0;
        const t = r.reduce((t, s) => {
          const n = " ".repeat(s.start - e),
            r = "^".repeat(s.length);
          return ((e = s.start + s.length), t + n + r);
        }, "");
        throw new o(
          `Path parameters result in path with invalid segments:\n${r.map((e) => e.error).join("\n")}\n${i}\n${t}`,
        );
      }
      return i;
    })(Me);
class $e extends be {
  list(e = {}, t) {
    const { betas: s, ...n } = e ?? {};
    return this._client.getAPIList("/v1/files", oe, {
      query: n,
      ...t,
      headers: ve([
        { "anthropic-beta": [...(s ?? []), "files-api-2025-04-14"].toString() },
        t?.headers,
      ]),
    });
  }
  delete(e, t = {}, s) {
    const { betas: n } = t ?? {};
    return this._client.delete(Oe`/v1/files/${e}`, {
      ...s,
      headers: ve([
        { "anthropic-beta": [...(n ?? []), "files-api-2025-04-14"].toString() },
        s?.headers,
      ]),
    });
  }
  download(e, t = {}, s) {
    const { betas: n } = t ?? {};
    return this._client.get(Oe`/v1/files/${e}/content`, {
      ...s,
      headers: ve([
        {
          "anthropic-beta": [...(n ?? []), "files-api-2025-04-14"].toString(),
          Accept: "application/binary",
        },
        s?.headers,
      ]),
      __binaryResponse: !0,
    });
  }
  retrieveMetadata(e, t = {}, s) {
    const { betas: n } = t ?? {};
    return this._client.get(Oe`/v1/files/${e}`, {
      ...s,
      headers: ve([
        { "anthropic-beta": [...(n ?? []), "files-api-2025-04-14"].toString() },
        s?.headers,
      ]),
    });
  }
  upload(e, t) {
    const { betas: s, ...n } = e;
    return this._client.post(
      "/v1/files",
      de(
        {
          body: n,
          ...t,
          headers: ve([
            {
              "anthropic-beta": [
                ...(s ?? []),
                "files-api-2025-04-14",
              ].toString(),
            },
            ((r = n.file), Se(r) ? { "x-stainless-helper": r[ke] } : {}),
            t?.headers,
          ]),
        },
        this._client,
      ),
    );
    var r;
  }
}
let Te = class extends be {
  retrieve(e, t = {}, s) {
    const { betas: n } = t ?? {};
    return this._client.get(Oe`/v1/models/${e}?beta=true`, {
      ...s,
      headers: ve([
        {
          ...(null != n?.toString()
            ? { "anthropic-beta": n?.toString() }
            : void 0),
        },
        s?.headers,
      ]),
    });
  }
  list(e = {}, t) {
    const { betas: s, ...n } = e ?? {};
    return this._client.getAPIList("/v1/models?beta=true", oe, {
      query: n,
      ...t,
      headers: ve([
        {
          ...(null != s?.toString()
            ? { "anthropic-beta": s?.toString() }
            : void 0),
        },
        t?.headers,
      ]),
    });
  }
};
const Ae = {
  "claude-opus-4-20250514": 8192,
  "claude-opus-4-0": 8192,
  "claude-4-opus-20250514": 8192,
  "anthropic.claude-opus-4-20250514-v1:0": 8192,
  "claude-opus-4@20250514": 8192,
  "claude-opus-4-1-20250805": 8192,
  "anthropic.claude-opus-4-1-20250805-v1:0": 8192,
  "claude-opus-4-1@20250805": 8192,
};
function je(e) {
  return e?.output_format ?? e?.output_config?.format;
}
function qe(e, t, s) {
  const n = je(t);
  return t && "parse" in (n ?? {})
    ? Ee(e, t, s)
    : {
        ...e,
        content: e.content.map((e) => {
          if ("text" === e.type) {
            const t = Object.defineProperty({ ...e }, "parsed_output", {
              value: null,
              enumerable: !1,
            });
            return Object.defineProperty(t, "parsed", {
              get: () => (
                s.logger.warn(
                  "The `parsed` property on `text` blocks is deprecated, please use `parsed_output` instead.",
                ),
                null
              ),
              enumerable: !1,
            });
          }
          return e;
        }),
        parsed_output: null,
      };
}
function Ee(e, t, s) {
  let n = null;
  const r = e.content.map((e) => {
    if ("text" === e.type) {
      const r = (function (e, t) {
        const s = je(e);
        if ("json_schema" !== s?.type) return null;
        try {
          return "parse" in s ? s.parse(t) : JSON.parse(t);
        } catch (n) {
          throw new o(`Failed to parse structured output: ${n}`);
        }
      })(t, e.text);
      null === n && (n = r);
      const i = Object.defineProperty({ ...e }, "parsed_output", {
        value: r,
        enumerable: !1,
      });
      return Object.defineProperty(i, "parsed", {
        get: () => (
          s.logger.warn(
            "The `parsed` property on `text` blocks is deprecated, please use `parsed_output` instead.",
          ),
          r
        ),
        enumerable: !1,
      });
    }
    return e;
  });
  return { ...e, content: r, parsed_output: n };
}
const Ie = (e) => {
    if (0 === e.length) return e;
    let t = e[e.length - 1];
    switch (t.type) {
      case "separator":
        return ((e = e.slice(0, e.length - 1)), Ie(e));
      case "number":
        let s = t.value[t.value.length - 1];
        if ("." === s || "-" === s)
          return ((e = e.slice(0, e.length - 1)), Ie(e));
      case "string":
        let n = e[e.length - 2];
        if ("delimiter" === n?.type)
          return ((e = e.slice(0, e.length - 1)), Ie(e));
        if ("brace" === n?.type && "{" === n.value)
          return ((e = e.slice(0, e.length - 1)), Ie(e));
        break;
      case "delimiter":
        return ((e = e.slice(0, e.length - 1)), Ie(e));
    }
    return e;
  },
  Le = (e) =>
    JSON.parse(
      ((e) => {
        let t = "";
        return (
          e.map((e) => {
            "string" === e.type ? (t += '"' + e.value + '"') : (t += e.value);
          }),
          t
        );
      })(
        ((e) => {
          let t = [];
          return (
            e.map((e) => {
              ("brace" === e.type &&
                ("{" === e.value
                  ? t.push("}")
                  : t.splice(t.lastIndexOf("}"), 1)),
                "paren" === e.type &&
                  ("[" === e.value
                    ? t.push("]")
                    : t.splice(t.lastIndexOf("]"), 1)));
            }),
            t.length > 0 &&
              t.reverse().map((t) => {
                "}" === t
                  ? e.push({ type: "brace", value: "}" })
                  : "]" === t && e.push({ type: "paren", value: "]" });
              }),
            e
          );
        })(
          Ie(
            ((e) => {
              let t = 0,
                s = [];
              for (; t < e.length; ) {
                let n = e[t];
                if ("\\" === n) {
                  t++;
                  continue;
                }
                if ("{" === n) {
                  (s.push({ type: "brace", value: "{" }), t++);
                  continue;
                }
                if ("}" === n) {
                  (s.push({ type: "brace", value: "}" }), t++);
                  continue;
                }
                if ("[" === n) {
                  (s.push({ type: "paren", value: "[" }), t++);
                  continue;
                }
                if ("]" === n) {
                  (s.push({ type: "paren", value: "]" }), t++);
                  continue;
                }
                if (":" === n) {
                  (s.push({ type: "separator", value: ":" }), t++);
                  continue;
                }
                if ("," === n) {
                  (s.push({ type: "delimiter", value: "," }), t++);
                  continue;
                }
                if ('"' === n) {
                  let r = "",
                    i = !1;
                  for (n = e[++t]; '"' !== n; ) {
                    if (t === e.length) {
                      i = !0;
                      break;
                    }
                    if ("\\" === n) {
                      if ((t++, t === e.length)) {
                        i = !0;
                        break;
                      }
                      ((r += n + e[t]), (n = e[++t]));
                    } else ((r += n), (n = e[++t]));
                  }
                  ((n = e[++t]), i || s.push({ type: "string", value: r }));
                  continue;
                }
                if (n && /\s/.test(n)) {
                  t++;
                  continue;
                }
                let r = /[0-9]/;
                if ((n && r.test(n)) || "-" === n || "." === n) {
                  let i = "";
                  for (
                    "-" === n && ((i += n), (n = e[++t]));
                    (n && r.test(n)) || "." === n;
                  )
                    ((i += n), (n = e[++t]));
                  s.push({ type: "number", value: i });
                  continue;
                }
                let i = /[a-z]/i;
                if (n && i.test(n)) {
                  let r = "";
                  for (; n && i.test(n) && t !== e.length; )
                    ((r += n), (n = e[++t]));
                  if ("true" != r && "false" != r && "null" !== r) {
                    t++;
                    continue;
                  }
                  s.push({ type: "name", value: r });
                  continue;
                }
                t++;
              }
              return s;
            })(e),
          ),
        ),
      ),
    );
var We,
  Ue,
  Ne,
  Ce,
  De,
  Be,
  Xe,
  He,
  Fe,
  Je,
  Ke,
  Ve,
  ze,
  Ge,
  Qe,
  Ye,
  Ze,
  et,
  tt,
  st,
  nt,
  rt,
  it,
  ot;
const at = "__json_buf";
function ct(e) {
  return (
    "tool_use" === e.type ||
    "server_tool_use" === e.type ||
    "mcp_tool_use" === e.type
  );
}
class lt {
  constructor(e, n) {
    (We.add(this),
      (this.messages = []),
      (this.receivedMessages = []),
      Ue.set(this, void 0),
      Ne.set(this, null),
      (this.controller = new AbortController()),
      Ce.set(this, void 0),
      De.set(this, () => {}),
      Be.set(this, () => {}),
      Xe.set(this, void 0),
      He.set(this, () => {}),
      Fe.set(this, () => {}),
      Je.set(this, {}),
      Ke.set(this, !1),
      Ve.set(this, !1),
      ze.set(this, !1),
      Ge.set(this, !1),
      Qe.set(this, void 0),
      Ye.set(this, void 0),
      Ze.set(this, void 0),
      st.set(this, (e) => {
        if ((t(this, Ve, !0), r(e) && (e = new c()), e instanceof c))
          return (t(this, ze, !0), this._emit("abort", e));
        if (e instanceof o) return this._emit("error", e);
        if (e instanceof Error) {
          const t = new o(e.message);
          return ((t.cause = e), this._emit("error", t));
        }
        return this._emit("error", new o(String(e)));
      }),
      t(
        this,
        Ce,
        new Promise((e, s) => {
          (t(this, De, e), t(this, Be, s));
        }),
      ),
      t(
        this,
        Xe,
        new Promise((e, s) => {
          (t(this, He, e), t(this, Fe, s));
        }),
      ),
      s(this, Ce, "f").catch(() => {}),
      s(this, Xe, "f").catch(() => {}),
      t(this, Ne, e),
      t(this, Ze, n?.logger ?? console));
  }
  get response() {
    return s(this, Qe, "f");
  }
  get request_id() {
    return s(this, Ye, "f");
  }
  async withResponse() {
    t(this, Ge, !0);
    const e = await s(this, Ce, "f");
    if (!e) throw new Error("Could not resolve a `Response` object");
    return { data: this, response: e, request_id: e.headers.get("request-id") };
  }
  static fromReadableStream(e) {
    const t = new lt(null);
    return (t._run(() => t._fromReadableStream(e)), t);
  }
  static createMessage(e, s, n, { logger: r } = {}) {
    const i = new lt(s, { logger: r });
    for (const t of s.messages) i._addMessageParam(t);
    return (
      t(i, Ne, { ...s, stream: !0 }),
      i._run(() =>
        i._createMessage(
          e,
          { ...s, stream: !0 },
          {
            ...n,
            headers: { ...n?.headers, "X-Stainless-Helper-Method": "stream" },
          },
        ),
      ),
      i
    );
  }
  _run(e) {
    e().then(
      () => {
        (this._emitFinal(), this._emit("end"));
      },
      s(this, st, "f"),
    );
  }
  _addMessageParam(e) {
    this.messages.push(e);
  }
  _addMessage(e, t = !0) {
    (this.receivedMessages.push(e), t && this._emit("message", e));
  }
  async _createMessage(e, t, n) {
    const r = n?.signal;
    let i;
    r &&
      (r.aborted && this.controller.abort(),
      (i = this.controller.abort.bind(this.controller)),
      r.addEventListener("abort", i));
    try {
      s(this, We, "m", nt).call(this);
      const { response: r, data: i } = await e
        .create({ ...t, stream: !0 }, { ...n, signal: this.controller.signal })
        .withResponse();
      this._connected(r);
      for await (const e of i) s(this, We, "m", rt).call(this, e);
      if (i.controller.signal?.aborted) throw new c();
      s(this, We, "m", it).call(this);
    } finally {
      r && i && r.removeEventListener("abort", i);
    }
  }
  _connected(e) {
    this.ended ||
      (t(this, Qe, e),
      t(this, Ye, e?.headers.get("request-id")),
      s(this, De, "f").call(this, e),
      this._emit("connect"));
  }
  get ended() {
    return s(this, Ke, "f");
  }
  get errored() {
    return s(this, Ve, "f");
  }
  get aborted() {
    return s(this, ze, "f");
  }
  abort() {
    this.controller.abort();
  }
  on(e, t) {
    return (
      (s(this, Je, "f")[e] || (s(this, Je, "f")[e] = [])).push({ listener: t }),
      this
    );
  }
  off(e, t) {
    const n = s(this, Je, "f")[e];
    if (!n) return this;
    const r = n.findIndex((e) => e.listener === t);
    return (r >= 0 && n.splice(r, 1), this);
  }
  once(e, t) {
    return (
      (s(this, Je, "f")[e] || (s(this, Je, "f")[e] = [])).push({
        listener: t,
        once: !0,
      }),
      this
    );
  }
  emitted(e) {
    return new Promise((s, n) => {
      (t(this, Ge, !0),
        "error" !== e && this.once("error", n),
        this.once(e, s));
    });
  }
  async done() {
    (t(this, Ge, !0), await s(this, Xe, "f"));
  }
  get currentMessage() {
    return s(this, Ue, "f");
  }
  async finalMessage() {
    return (await this.done(), s(this, We, "m", et).call(this));
  }
  async finalText() {
    return (await this.done(), s(this, We, "m", tt).call(this));
  }
  _emit(e, ...n) {
    if (s(this, Ke, "f")) return;
    "end" === e && (t(this, Ke, !0), s(this, He, "f").call(this));
    const r = s(this, Je, "f")[e];
    if (
      (r &&
        ((s(this, Je, "f")[e] = r.filter((e) => !e.once)),
        r.forEach(({ listener: e }) => e(...n))),
      "abort" === e)
    ) {
      const e = n[0];
      return (
        s(this, Ge, "f") || r?.length || Promise.reject(e),
        s(this, Be, "f").call(this, e),
        s(this, Fe, "f").call(this, e),
        void this._emit("end")
      );
    }
    if ("error" === e) {
      const e = n[0];
      (s(this, Ge, "f") || r?.length || Promise.reject(e),
        s(this, Be, "f").call(this, e),
        s(this, Fe, "f").call(this, e),
        this._emit("end"));
    }
  }
  _emitFinal() {
    this.receivedMessages.at(-1) &&
      this._emit("finalMessage", s(this, We, "m", et).call(this));
  }
  async _fromReadableStream(e, t) {
    const n = t?.signal;
    let r;
    n &&
      (n.aborted && this.controller.abort(),
      (r = this.controller.abort.bind(this.controller)),
      n.addEventListener("abort", r));
    try {
      (s(this, We, "m", nt).call(this), this._connected(null));
      const t = Z.fromReadableStream(e, this.controller);
      for await (const e of t) s(this, We, "m", rt).call(this, e);
      if (t.controller.signal?.aborted) throw new c();
      s(this, We, "m", it).call(this);
    } finally {
      n && r && n.removeEventListener("abort", r);
    }
  }
  [((Ue = new WeakMap()),
  (Ne = new WeakMap()),
  (Ce = new WeakMap()),
  (De = new WeakMap()),
  (Be = new WeakMap()),
  (Xe = new WeakMap()),
  (He = new WeakMap()),
  (Fe = new WeakMap()),
  (Je = new WeakMap()),
  (Ke = new WeakMap()),
  (Ve = new WeakMap()),
  (ze = new WeakMap()),
  (Ge = new WeakMap()),
  (Qe = new WeakMap()),
  (Ye = new WeakMap()),
  (Ze = new WeakMap()),
  (st = new WeakMap()),
  (We = new WeakSet()),
  (et = function () {
    if (0 === this.receivedMessages.length)
      throw new o(
        "stream ended without producing a Message with role=assistant",
      );
    return this.receivedMessages.at(-1);
  }),
  (tt = function () {
    if (0 === this.receivedMessages.length)
      throw new o(
        "stream ended without producing a Message with role=assistant",
      );
    const e = this.receivedMessages
      .at(-1)
      .content.filter((e) => "text" === e.type)
      .map((e) => e.text);
    if (0 === e.length)
      throw new o(
        "stream ended without producing a content block with type=text",
      );
    return e.join(" ");
  }),
  (nt = function () {
    this.ended || t(this, Ue, void 0);
  }),
  (rt = function (e) {
    if (this.ended) return;
    const n = s(this, We, "m", ot).call(this, e);
    switch ((this._emit("streamEvent", e, n), e.type)) {
      case "content_block_delta": {
        const t = n.content.at(-1);
        switch (e.delta.type) {
          case "text_delta":
            "text" === t.type && this._emit("text", e.delta.text, t.text || "");
            break;
          case "citations_delta":
            "text" === t.type &&
              this._emit("citation", e.delta.citation, t.citations ?? []);
            break;
          case "input_json_delta":
            ct(t) &&
              t.input &&
              this._emit("inputJson", e.delta.partial_json, t.input);
            break;
          case "thinking_delta":
            "thinking" === t.type &&
              this._emit("thinking", e.delta.thinking, t.thinking);
            break;
          case "signature_delta":
            "thinking" === t.type && this._emit("signature", t.signature);
            break;
          default:
            e.delta;
        }
        break;
      }
      case "message_stop":
        (this._addMessageParam(n),
          this._addMessage(
            qe(n, s(this, Ne, "f"), { logger: s(this, Ze, "f") }),
            !0,
          ));
        break;
      case "content_block_stop":
        this._emit("contentBlock", n.content.at(-1));
        break;
      case "message_start":
        t(this, Ue, n);
    }
  }),
  (it = function () {
    if (this.ended) throw new o("stream has ended, this shouldn't happen");
    const e = s(this, Ue, "f");
    if (!e) throw new o("request ended without sending any chunks");
    return (
      t(this, Ue, void 0),
      qe(e, s(this, Ne, "f"), { logger: s(this, Ze, "f") })
    );
  }),
  (ot = function (e) {
    let t = s(this, Ue, "f");
    if ("message_start" === e.type) {
      if (t)
        throw new o(
          `Unexpected event order, got ${e.type} before receiving "message_stop"`,
        );
      return e.message;
    }
    if (!t)
      throw new o(
        `Unexpected event order, got ${e.type} before "message_start"`,
      );
    switch (e.type) {
      case "message_stop":
      case "content_block_stop":
        return t;
      case "message_delta":
        return (
          (t.container = e.delta.container),
          (t.stop_reason = e.delta.stop_reason),
          (t.stop_sequence = e.delta.stop_sequence),
          (t.usage.output_tokens = e.usage.output_tokens),
          (t.context_management = e.context_management),
          null != e.usage.input_tokens &&
            (t.usage.input_tokens = e.usage.input_tokens),
          null != e.usage.cache_creation_input_tokens &&
            (t.usage.cache_creation_input_tokens =
              e.usage.cache_creation_input_tokens),
          null != e.usage.cache_read_input_tokens &&
            (t.usage.cache_read_input_tokens = e.usage.cache_read_input_tokens),
          null != e.usage.server_tool_use &&
            (t.usage.server_tool_use = e.usage.server_tool_use),
          t
        );
      case "content_block_start":
        return (t.content.push(e.content_block), t);
      case "content_block_delta": {
        const r = t.content.at(e.index);
        switch (e.delta.type) {
          case "text_delta":
            "text" === r?.type &&
              (t.content[e.index] = {
                ...r,
                text: (r.text || "") + e.delta.text,
              });
            break;
          case "citations_delta":
            "text" === r?.type &&
              (t.content[e.index] = {
                ...r,
                citations: [...(r.citations ?? []), e.delta.citation],
              });
            break;
          case "input_json_delta":
            if (r && ct(r)) {
              let i = r[at] || "";
              i += e.delta.partial_json;
              const a = { ...r };
              if (
                (Object.defineProperty(a, at, {
                  value: i,
                  enumerable: !1,
                  writable: !0,
                }),
                i)
              )
                try {
                  a.input = Le(i);
                } catch (n) {
                  const e = new o(
                    `Unable to parse tool parameter JSON from model. Please retry your request or adjust your prompt. Error: ${n}. JSON: ${i}`,
                  );
                  s(this, st, "f").call(this, e);
                }
              t.content[e.index] = a;
            }
            break;
          case "thinking_delta":
            "thinking" === r?.type &&
              (t.content[e.index] = {
                ...r,
                thinking: r.thinking + e.delta.thinking,
              });
            break;
          case "signature_delta":
            "thinking" === r?.type &&
              (t.content[e.index] = { ...r, signature: e.delta.signature });
            break;
          default:
            e.delta;
        }
        return t;
      }
    }
  }),
  Symbol.asyncIterator)]() {
    const e = [],
      t = [];
    let s = !1;
    return (
      this.on("streamEvent", (s) => {
        const n = t.shift();
        n ? n.resolve(s) : e.push(s);
      }),
      this.on("end", () => {
        s = !0;
        for (const e of t) e.resolve(void 0);
        t.length = 0;
      }),
      this.on("abort", (e) => {
        s = !0;
        for (const s of t) s.reject(e);
        t.length = 0;
      }),
      this.on("error", (e) => {
        s = !0;
        for (const s of t) s.reject(e);
        t.length = 0;
      }),
      {
        next: async () => {
          if (!e.length)
            return s
              ? { value: void 0, done: !0 }
              : new Promise((e, s) => t.push({ resolve: e, reject: s })).then(
                  (e) =>
                    e ? { value: e, done: !1 } : { value: void 0, done: !0 },
                );
          return { value: e.shift(), done: !1 };
        },
        return: async () => (this.abort(), { value: void 0, done: !0 }),
      }
    );
  }
  toReadableStream() {
    return new Z(
      this[Symbol.asyncIterator].bind(this),
      this.controller,
    ).toReadableStream();
  }
}
class ut extends Error {
  constructor(e) {
    (super(
      "string" == typeof e
        ? e
        : e.map((e) => ("text" === e.type ? e.text : `[${e.type}]`)).join(" "),
    ),
      (this.name = "ToolError"),
      (this.content = e));
  }
}
var ht, dt, pt, ft, gt, mt, yt, bt, wt, _t, vt;
function kt() {
  let e, t;
  return {
    promise: new Promise((s, n) => {
      ((e = s), (t = n));
    }),
    resolve: e,
    reject: t,
  };
}
class St {
  constructor(e, s, n) {
    (ht.add(this),
      (this.client = e),
      dt.set(this, !1),
      pt.set(this, !1),
      ft.set(this, void 0),
      gt.set(this, void 0),
      mt.set(this, void 0),
      yt.set(this, void 0),
      bt.set(this, void 0),
      wt.set(this, 0),
      t(this, ft, { params: { ...s, messages: structuredClone(s.messages) } }));
    const r = ["BetaToolRunner", ...xe(s.tools, s.messages)].join(", ");
    (t(this, gt, {
      ...n,
      headers: ve([{ "x-stainless-helper": r }, n?.headers]),
    }),
      t(this, bt, kt()));
  }
  async *[((dt = new WeakMap()),
  (pt = new WeakMap()),
  (ft = new WeakMap()),
  (gt = new WeakMap()),
  (mt = new WeakMap()),
  (yt = new WeakMap()),
  (bt = new WeakMap()),
  (wt = new WeakMap()),
  (ht = new WeakSet()),
  (_t = async function () {
    const e = s(this, ft, "f").params.compactionControl;
    if (!e || !e.enabled) return !1;
    let t = 0;
    if (void 0 !== s(this, mt, "f"))
      try {
        const e = await s(this, mt, "f");
        t =
          e.usage.input_tokens +
          (e.usage.cache_creation_input_tokens ?? 0) +
          (e.usage.cache_read_input_tokens ?? 0) +
          e.usage.output_tokens;
      } catch {
        return !1;
      }
    if (t < (e.contextTokenThreshold ?? 1e5)) return !1;
    const n = e.model ?? s(this, ft, "f").params.model,
      r =
        e.summaryPrompt ??
        "You have been working on the task described above but have not yet completed it. Write a continuation summary that will allow you (or another instance of yourself) to resume work efficiently in a future context window where the conversation history will be replaced with this summary. Your summary should be structured, concise, and actionable. Include:\n1. Task Overview\nThe user's core request and success criteria\nAny clarifications or constraints they specified\n2. Current State\nWhat has been completed so far\nFiles created, modified, or analyzed (with paths if relevant)\nKey outputs or artifacts produced\n3. Important Discoveries\nTechnical constraints or requirements uncovered\nDecisions made and their rationale\nErrors encountered and how they were resolved\nWhat approaches were tried that didn't work (and why)\n4. Next Steps\nSpecific actions needed to complete the task\nAny blockers or open questions to resolve\nPriority order if multiple steps remain\n5. Context to Preserve\nUser preferences or style requirements\nDomain-specific details that aren't obvious\nAny promises made to the user\nBe concise but complete—err on the side of including information that would prevent duplicate work or repeated mistakes. Write in a way that enables immediate resumption of the task.\nWrap your summary in <summary></summary> tags.",
      i = s(this, ft, "f").params.messages;
    if ("assistant" === i[i.length - 1].role) {
      const e = i[i.length - 1];
      if (Array.isArray(e.content)) {
        const t = e.content.filter((e) => "tool_use" !== e.type);
        0 === t.length ? i.pop() : (e.content = t);
      }
    }
    const a = await this.client.beta.messages.create(
      {
        model: n,
        messages: [
          ...i,
          { role: "user", content: [{ type: "text", text: r }] },
        ],
        max_tokens: s(this, ft, "f").params.max_tokens,
      },
      { headers: { "x-stainless-helper": "compaction" } },
    );
    if ("text" !== a.content[0]?.type)
      throw new o("Expected text response for compaction");
    return (
      (s(this, ft, "f").params.messages = [
        { role: "user", content: a.content },
      ]),
      !0
    );
  }),
  Symbol.asyncIterator)]() {
    var e;
    if (s(this, dt, "f")) throw new o("Cannot iterate over a consumed stream");
    (t(this, dt, !0), t(this, pt, !0), t(this, yt, void 0));
    try {
      for (;;) {
        let n;
        try {
          if (
            s(this, ft, "f").params.max_iterations &&
            s(this, wt, "f") >= s(this, ft, "f").params.max_iterations
          )
            break;
          (t(this, pt, !1),
            t(this, yt, void 0),
            t(this, wt, ((e = s(this, wt, "f")), ++e)),
            t(this, mt, void 0));
          const {
            max_iterations: r,
            compactionControl: i,
            ...o
          } = s(this, ft, "f").params;
          o.stream
            ? ((n = this.client.beta.messages.stream(
                { ...o },
                s(this, gt, "f"),
              )),
              t(this, mt, n.finalMessage()),
              s(this, mt, "f").catch(() => {}),
              yield n)
            : (t(
                this,
                mt,
                this.client.beta.messages.create(
                  { ...o, stream: !1 },
                  s(this, gt, "f"),
                ),
              ),
              yield s(this, mt, "f"));
          if (!(await s(this, ht, "m", _t).call(this))) {
            if (!s(this, pt, "f")) {
              const { role: e, content: t } = await s(this, mt, "f");
              s(this, ft, "f").params.messages.push({ role: e, content: t });
            }
            const e = await s(this, ht, "m", vt).call(
              this,
              s(this, ft, "f").params.messages.at(-1),
            );
            if (e) s(this, ft, "f").params.messages.push(e);
            else if (!s(this, pt, "f")) break;
          }
        } finally {
          n && n.abort();
        }
      }
      if (!s(this, mt, "f"))
        throw new o("ToolRunner concluded without a message from the server");
      s(this, bt, "f").resolve(await s(this, mt, "f"));
    } catch (n) {
      throw (
        t(this, dt, !1),
        s(this, bt, "f").promise.catch(() => {}),
        s(this, bt, "f").reject(n),
        t(this, bt, kt()),
        n
      );
    }
  }
  setMessagesParams(e) {
    ((s(this, ft, "f").params =
      "function" == typeof e ? e(s(this, ft, "f").params) : e),
      t(this, pt, !0),
      t(this, yt, void 0));
  }
  async generateToolResponse() {
    const e = (await s(this, mt, "f")) ?? this.params.messages.at(-1);
    return e ? s(this, ht, "m", vt).call(this, e) : null;
  }
  done() {
    return s(this, bt, "f").promise;
  }
  async runUntilDone() {
    if (!s(this, dt, "f")) for await (const e of this);
    return this.done();
  }
  get params() {
    return s(this, ft, "f").params;
  }
  pushMessages(...e) {
    this.setMessagesParams((t) => ({ ...t, messages: [...t.messages, ...e] }));
  }
  then(e, t) {
    return this.runUntilDone().then(e, t);
  }
}
vt = async function (e) {
  return (
    void 0 !== s(this, yt, "f") ||
      t(
        this,
        yt,
        (async function (e, t = e.messages.at(-1)) {
          if (
            !t ||
            "assistant" !== t.role ||
            !t.content ||
            "string" == typeof t.content
          )
            return null;
          const s = t.content.filter((e) => "tool_use" === e.type);
          if (0 === s.length) return null;
          return {
            role: "user",
            content: await Promise.all(
              s.map(async (t) => {
                const s = e.tools.find(
                  (e) => ("name" in e ? e.name : e.mcp_server_name) === t.name,
                );
                if (!s || !("run" in s))
                  return {
                    type: "tool_result",
                    tool_use_id: t.id,
                    content: `Error: Tool '${t.name}' not found`,
                    is_error: !0,
                  };
                try {
                  let e = t.input;
                  "parse" in s && s.parse && (e = s.parse(e));
                  const n = await s.run(e);
                  return { type: "tool_result", tool_use_id: t.id, content: n };
                } catch (n) {
                  return {
                    type: "tool_result",
                    tool_use_id: t.id,
                    content:
                      n instanceof ut
                        ? n.content
                        : `Error: ${n instanceof Error ? n.message : String(n)}`,
                    is_error: !0,
                  };
                }
              }),
            ),
          };
        })(s(this, ft, "f").params, e),
      ),
    s(this, yt, "f")
  );
};
class xt {
  constructor(e, t) {
    ((this.iterator = e), (this.controller = t));
  }
  async *decoder() {
    const e = new N();
    for await (const t of this.iterator)
      for (const s of e.decode(t)) yield JSON.parse(s);
    for (const t of e.flush()) yield JSON.parse(t);
  }
  [Symbol.asyncIterator]() {
    return this.decoder();
  }
  static fromResponse(e, t) {
    if (!e.body) {
      if (
        (t.abort(),
        void 0 !== globalThis.navigator &&
          "ReactNative" === globalThis.navigator.product)
      )
        throw new o(
          "The default react-native fetch implementation does not support streaming. Please use expo/fetch: https://docs.expo.dev/versions/latest/sdk/expo/#expofetch-api",
        );
      throw new o("Attempted to iterate over a response with no body");
    }
    return new xt(A(e.body), t);
  }
}
let Rt = class extends be {
  create(e, t) {
    const { betas: s, ...n } = e;
    return this._client.post("/v1/messages/batches?beta=true", {
      body: n,
      ...t,
      headers: ve([
        {
          "anthropic-beta": [
            ...(s ?? []),
            "message-batches-2024-09-24",
          ].toString(),
        },
        t?.headers,
      ]),
    });
  }
  retrieve(e, t = {}, s) {
    const { betas: n } = t ?? {};
    return this._client.get(Oe`/v1/messages/batches/${e}?beta=true`, {
      ...s,
      headers: ve([
        {
          "anthropic-beta": [
            ...(n ?? []),
            "message-batches-2024-09-24",
          ].toString(),
        },
        s?.headers,
      ]),
    });
  }
  list(e = {}, t) {
    const { betas: s, ...n } = e ?? {};
    return this._client.getAPIList("/v1/messages/batches?beta=true", oe, {
      query: n,
      ...t,
      headers: ve([
        {
          "anthropic-beta": [
            ...(s ?? []),
            "message-batches-2024-09-24",
          ].toString(),
        },
        t?.headers,
      ]),
    });
  }
  delete(e, t = {}, s) {
    const { betas: n } = t ?? {};
    return this._client.delete(Oe`/v1/messages/batches/${e}?beta=true`, {
      ...s,
      headers: ve([
        {
          "anthropic-beta": [
            ...(n ?? []),
            "message-batches-2024-09-24",
          ].toString(),
        },
        s?.headers,
      ]),
    });
  }
  cancel(e, t = {}, s) {
    const { betas: n } = t ?? {};
    return this._client.post(Oe`/v1/messages/batches/${e}/cancel?beta=true`, {
      ...s,
      headers: ve([
        {
          "anthropic-beta": [
            ...(n ?? []),
            "message-batches-2024-09-24",
          ].toString(),
        },
        s?.headers,
      ]),
    });
  }
  async results(e, t = {}, s) {
    const n = await this.retrieve(e);
    if (!n.results_url)
      throw new o(
        `No batch \`results_url\`; Has it finished processing? ${n.processing_status} - ${n.id}`,
      );
    const { betas: r } = t ?? {};
    return this._client
      .get(n.results_url, {
        ...s,
        headers: ve([
          {
            "anthropic-beta": [
              ...(r ?? []),
              "message-batches-2024-09-24",
            ].toString(),
            Accept: "application/binary",
          },
          s?.headers,
        ]),
        stream: !0,
        __binaryResponse: !0,
      })
      ._thenUnwrap((e, t) => xt.fromResponse(t.response, t.controller));
  }
};
let Mt = class extends be {
  constructor() {
    (super(...arguments), (this.batches = new Rt(this._client)));
  }
  create(e, t) {
    const s = Pt(e),
      { betas: n, ...r } = s;
    r.model;
    let i = this._client._options.timeout;
    if (!r.stream && null == i) {
      const e = Ae[r.model] ?? void 0;
      i = this._client.calculateNonstreamingTimeout(r.max_tokens, e);
    }
    const o = Re(r.tools, r.messages);
    return this._client.post("/v1/messages?beta=true", {
      body: r,
      timeout: i ?? 6e5,
      ...t,
      headers: ve([
        {
          ...(null != n?.toString()
            ? { "anthropic-beta": n?.toString() }
            : void 0),
        },
        o,
        t?.headers,
      ]),
      stream: s.stream ?? !1,
    });
  }
  parse(e, t) {
    return (
      (t = {
        ...t,
        headers: ve([
          {
            "anthropic-beta": [
              ...(e.betas ?? []),
              "structured-outputs-2025-12-15",
            ].toString(),
          },
          t?.headers,
        ]),
      }),
      this.create(e, t).then((t) =>
        Ee(t, e, { logger: this._client.logger ?? console }),
      )
    );
  }
  stream(e, t) {
    return lt.createMessage(this, e, t);
  }
  countTokens(e, t) {
    const s = Pt(e),
      { betas: n, ...r } = s;
    return this._client.post("/v1/messages/count_tokens?beta=true", {
      body: r,
      ...t,
      headers: ve([
        {
          "anthropic-beta": [
            ...(n ?? []),
            "token-counting-2024-11-01",
          ].toString(),
        },
        t?.headers,
      ]),
    });
  }
  toolRunner(e, t) {
    return new St(this._client, e, t);
  }
};
function Pt(e) {
  if (!e.output_format) return e;
  if (e.output_config?.format)
    throw new o(
      "Both output_format and output_config.format were provided. Please use only output_config.format (output_format is deprecated).",
    );
  const { output_format: t, ...s } = e;
  return { ...s, output_config: { ...e.output_config, format: t } };
}
((Mt.Batches = Rt), (Mt.BetaToolRunner = St), (Mt.ToolError = ut));
class Ot extends be {
  create(e, t = {}, s) {
    const { betas: n, ...r } = t ?? {};
    return this._client.post(
      Oe`/v1/skills/${e}/versions?beta=true`,
      de(
        {
          body: r,
          ...s,
          headers: ve([
            {
              "anthropic-beta": [...(n ?? []), "skills-2025-10-02"].toString(),
            },
            s?.headers,
          ]),
        },
        this._client,
      ),
    );
  }
  retrieve(e, t, s) {
    const { skill_id: n, betas: r } = t;
    return this._client.get(Oe`/v1/skills/${n}/versions/${e}?beta=true`, {
      ...s,
      headers: ve([
        { "anthropic-beta": [...(r ?? []), "skills-2025-10-02"].toString() },
        s?.headers,
      ]),
    });
  }
  list(e, t = {}, s) {
    const { betas: n, ...r } = t ?? {};
    return this._client.getAPIList(Oe`/v1/skills/${e}/versions?beta=true`, ae, {
      query: r,
      ...s,
      headers: ve([
        { "anthropic-beta": [...(n ?? []), "skills-2025-10-02"].toString() },
        s?.headers,
      ]),
    });
  }
  delete(e, t, s) {
    const { skill_id: n, betas: r } = t;
    return this._client.delete(Oe`/v1/skills/${n}/versions/${e}?beta=true`, {
      ...s,
      headers: ve([
        { "anthropic-beta": [...(r ?? []), "skills-2025-10-02"].toString() },
        s?.headers,
      ]),
    });
  }
}
class $t extends be {
  constructor() {
    (super(...arguments), (this.versions = new Ot(this._client)));
  }
  create(e = {}, t) {
    const { betas: s, ...n } = e ?? {};
    return this._client.post(
      "/v1/skills?beta=true",
      de(
        {
          body: n,
          ...t,
          headers: ve([
            {
              "anthropic-beta": [...(s ?? []), "skills-2025-10-02"].toString(),
            },
            t?.headers,
          ]),
        },
        this._client,
        !1,
      ),
    );
  }
  retrieve(e, t = {}, s) {
    const { betas: n } = t ?? {};
    return this._client.get(Oe`/v1/skills/${e}?beta=true`, {
      ...s,
      headers: ve([
        { "anthropic-beta": [...(n ?? []), "skills-2025-10-02"].toString() },
        s?.headers,
      ]),
    });
  }
  list(e = {}, t) {
    const { betas: s, ...n } = e ?? {};
    return this._client.getAPIList("/v1/skills?beta=true", ae, {
      query: n,
      ...t,
      headers: ve([
        { "anthropic-beta": [...(s ?? []), "skills-2025-10-02"].toString() },
        t?.headers,
      ]),
    });
  }
  delete(e, t = {}, s) {
    const { betas: n } = t ?? {};
    return this._client.delete(Oe`/v1/skills/${e}?beta=true`, {
      ...s,
      headers: ve([
        { "anthropic-beta": [...(n ?? []), "skills-2025-10-02"].toString() },
        s?.headers,
      ]),
    });
  }
}
$t.Versions = Ot;
class Tt extends be {
  constructor() {
    (super(...arguments),
      (this.models = new Te(this._client)),
      (this.messages = new Mt(this._client)),
      (this.files = new $e(this._client)),
      (this.skills = new $t(this._client)));
  }
}
((Tt.Models = Te), (Tt.Messages = Mt), (Tt.Files = $e), (Tt.Skills = $t));
class At extends be {
  create(e, t) {
    const { betas: s, ...n } = e;
    return this._client.post("/v1/complete", {
      body: n,
      timeout: this._client._options.timeout ?? 6e5,
      ...t,
      headers: ve([
        {
          ...(null != s?.toString()
            ? { "anthropic-beta": s?.toString() }
            : void 0),
        },
        t?.headers,
      ]),
      stream: e.stream ?? !1,
    });
  }
}
function jt(e) {
  return e?.output_config?.format;
}
function qt(e, t, s) {
  const n = jt(t);
  return t && "parse" in (n ?? {})
    ? Et(e, t)
    : {
        ...e,
        content: e.content.map((e) => {
          if ("text" === e.type) {
            return Object.defineProperty({ ...e }, "parsed_output", {
              value: null,
              enumerable: !1,
            });
          }
          return e;
        }),
        parsed_output: null,
      };
}
function Et(e, t, s) {
  let n = null;
  const r = e.content.map((e) => {
    if ("text" === e.type) {
      const s = (function (e, t) {
        const s = jt(e);
        if ("json_schema" !== s?.type) return null;
        try {
          return "parse" in s ? s.parse(t) : JSON.parse(t);
        } catch (n) {
          throw new o(`Failed to parse structured output: ${n}`);
        }
      })(t, e.text);
      null === n && (n = s);
      return Object.defineProperty({ ...e }, "parsed_output", {
        value: s,
        enumerable: !1,
      });
    }
    return e;
  });
  return { ...e, content: r, parsed_output: n };
}
var It,
  Lt,
  Wt,
  Ut,
  Nt,
  Ct,
  Dt,
  Bt,
  Xt,
  Ht,
  Ft,
  Jt,
  Kt,
  Vt,
  zt,
  Gt,
  Qt,
  Yt,
  Zt,
  es,
  ts,
  ss,
  ns,
  rs;
const is = "__json_buf";
function os(e) {
  return "tool_use" === e.type || "server_tool_use" === e.type;
}
class as {
  constructor(e, n) {
    (It.add(this),
      (this.messages = []),
      (this.receivedMessages = []),
      Lt.set(this, void 0),
      Wt.set(this, null),
      (this.controller = new AbortController()),
      Ut.set(this, void 0),
      Nt.set(this, () => {}),
      Ct.set(this, () => {}),
      Dt.set(this, void 0),
      Bt.set(this, () => {}),
      Xt.set(this, () => {}),
      Ht.set(this, {}),
      Ft.set(this, !1),
      Jt.set(this, !1),
      Kt.set(this, !1),
      Vt.set(this, !1),
      zt.set(this, void 0),
      Gt.set(this, void 0),
      Qt.set(this, void 0),
      es.set(this, (e) => {
        if ((t(this, Jt, !0), r(e) && (e = new c()), e instanceof c))
          return (t(this, Kt, !0), this._emit("abort", e));
        if (e instanceof o) return this._emit("error", e);
        if (e instanceof Error) {
          const t = new o(e.message);
          return ((t.cause = e), this._emit("error", t));
        }
        return this._emit("error", new o(String(e)));
      }),
      t(
        this,
        Ut,
        new Promise((e, s) => {
          (t(this, Nt, e), t(this, Ct, s));
        }),
      ),
      t(
        this,
        Dt,
        new Promise((e, s) => {
          (t(this, Bt, e), t(this, Xt, s));
        }),
      ),
      s(this, Ut, "f").catch(() => {}),
      s(this, Dt, "f").catch(() => {}),
      t(this, Wt, e),
      t(this, Qt, n?.logger ?? console));
  }
  get response() {
    return s(this, zt, "f");
  }
  get request_id() {
    return s(this, Gt, "f");
  }
  async withResponse() {
    t(this, Vt, !0);
    const e = await s(this, Ut, "f");
    if (!e) throw new Error("Could not resolve a `Response` object");
    return { data: this, response: e, request_id: e.headers.get("request-id") };
  }
  static fromReadableStream(e) {
    const t = new as(null);
    return (t._run(() => t._fromReadableStream(e)), t);
  }
  static createMessage(e, s, n, { logger: r } = {}) {
    const i = new as(s, { logger: r });
    for (const t of s.messages) i._addMessageParam(t);
    return (
      t(i, Wt, { ...s, stream: !0 }),
      i._run(() =>
        i._createMessage(
          e,
          { ...s, stream: !0 },
          {
            ...n,
            headers: { ...n?.headers, "X-Stainless-Helper-Method": "stream" },
          },
        ),
      ),
      i
    );
  }
  _run(e) {
    e().then(
      () => {
        (this._emitFinal(), this._emit("end"));
      },
      s(this, es, "f"),
    );
  }
  _addMessageParam(e) {
    this.messages.push(e);
  }
  _addMessage(e, t = !0) {
    (this.receivedMessages.push(e), t && this._emit("message", e));
  }
  async _createMessage(e, t, n) {
    const r = n?.signal;
    let i;
    r &&
      (r.aborted && this.controller.abort(),
      (i = this.controller.abort.bind(this.controller)),
      r.addEventListener("abort", i));
    try {
      s(this, It, "m", ts).call(this);
      const { response: r, data: i } = await e
        .create({ ...t, stream: !0 }, { ...n, signal: this.controller.signal })
        .withResponse();
      this._connected(r);
      for await (const e of i) s(this, It, "m", ss).call(this, e);
      if (i.controller.signal?.aborted) throw new c();
      s(this, It, "m", ns).call(this);
    } finally {
      r && i && r.removeEventListener("abort", i);
    }
  }
  _connected(e) {
    this.ended ||
      (t(this, zt, e),
      t(this, Gt, e?.headers.get("request-id")),
      s(this, Nt, "f").call(this, e),
      this._emit("connect"));
  }
  get ended() {
    return s(this, Ft, "f");
  }
  get errored() {
    return s(this, Jt, "f");
  }
  get aborted() {
    return s(this, Kt, "f");
  }
  abort() {
    this.controller.abort();
  }
  on(e, t) {
    return (
      (s(this, Ht, "f")[e] || (s(this, Ht, "f")[e] = [])).push({ listener: t }),
      this
    );
  }
  off(e, t) {
    const n = s(this, Ht, "f")[e];
    if (!n) return this;
    const r = n.findIndex((e) => e.listener === t);
    return (r >= 0 && n.splice(r, 1), this);
  }
  once(e, t) {
    return (
      (s(this, Ht, "f")[e] || (s(this, Ht, "f")[e] = [])).push({
        listener: t,
        once: !0,
      }),
      this
    );
  }
  emitted(e) {
    return new Promise((s, n) => {
      (t(this, Vt, !0),
        "error" !== e && this.once("error", n),
        this.once(e, s));
    });
  }
  async done() {
    (t(this, Vt, !0), await s(this, Dt, "f"));
  }
  get currentMessage() {
    return s(this, Lt, "f");
  }
  async finalMessage() {
    return (await this.done(), s(this, It, "m", Yt).call(this));
  }
  async finalText() {
    return (await this.done(), s(this, It, "m", Zt).call(this));
  }
  _emit(e, ...n) {
    if (s(this, Ft, "f")) return;
    "end" === e && (t(this, Ft, !0), s(this, Bt, "f").call(this));
    const r = s(this, Ht, "f")[e];
    if (
      (r &&
        ((s(this, Ht, "f")[e] = r.filter((e) => !e.once)),
        r.forEach(({ listener: e }) => e(...n))),
      "abort" === e)
    ) {
      const e = n[0];
      return (
        s(this, Vt, "f") || r?.length || Promise.reject(e),
        s(this, Ct, "f").call(this, e),
        s(this, Xt, "f").call(this, e),
        void this._emit("end")
      );
    }
    if ("error" === e) {
      const e = n[0];
      (s(this, Vt, "f") || r?.length || Promise.reject(e),
        s(this, Ct, "f").call(this, e),
        s(this, Xt, "f").call(this, e),
        this._emit("end"));
    }
  }
  _emitFinal() {
    this.receivedMessages.at(-1) &&
      this._emit("finalMessage", s(this, It, "m", Yt).call(this));
  }
  async _fromReadableStream(e, t) {
    const n = t?.signal;
    let r;
    n &&
      (n.aborted && this.controller.abort(),
      (r = this.controller.abort.bind(this.controller)),
      n.addEventListener("abort", r));
    try {
      (s(this, It, "m", ts).call(this), this._connected(null));
      const t = Z.fromReadableStream(e, this.controller);
      for await (const e of t) s(this, It, "m", ss).call(this, e);
      if (t.controller.signal?.aborted) throw new c();
      s(this, It, "m", ns).call(this);
    } finally {
      n && r && n.removeEventListener("abort", r);
    }
  }
  [((Lt = new WeakMap()),
  (Wt = new WeakMap()),
  (Ut = new WeakMap()),
  (Nt = new WeakMap()),
  (Ct = new WeakMap()),
  (Dt = new WeakMap()),
  (Bt = new WeakMap()),
  (Xt = new WeakMap()),
  (Ht = new WeakMap()),
  (Ft = new WeakMap()),
  (Jt = new WeakMap()),
  (Kt = new WeakMap()),
  (Vt = new WeakMap()),
  (zt = new WeakMap()),
  (Gt = new WeakMap()),
  (Qt = new WeakMap()),
  (es = new WeakMap()),
  (It = new WeakSet()),
  (Yt = function () {
    if (0 === this.receivedMessages.length)
      throw new o(
        "stream ended without producing a Message with role=assistant",
      );
    return this.receivedMessages.at(-1);
  }),
  (Zt = function () {
    if (0 === this.receivedMessages.length)
      throw new o(
        "stream ended without producing a Message with role=assistant",
      );
    const e = this.receivedMessages
      .at(-1)
      .content.filter((e) => "text" === e.type)
      .map((e) => e.text);
    if (0 === e.length)
      throw new o(
        "stream ended without producing a content block with type=text",
      );
    return e.join(" ");
  }),
  (ts = function () {
    this.ended || t(this, Lt, void 0);
  }),
  (ss = function (e) {
    if (this.ended) return;
    const n = s(this, It, "m", rs).call(this, e);
    switch ((this._emit("streamEvent", e, n), e.type)) {
      case "content_block_delta": {
        const t = n.content.at(-1);
        switch (e.delta.type) {
          case "text_delta":
            "text" === t.type && this._emit("text", e.delta.text, t.text || "");
            break;
          case "citations_delta":
            "text" === t.type &&
              this._emit("citation", e.delta.citation, t.citations ?? []);
            break;
          case "input_json_delta":
            os(t) &&
              t.input &&
              this._emit("inputJson", e.delta.partial_json, t.input);
            break;
          case "thinking_delta":
            "thinking" === t.type &&
              this._emit("thinking", e.delta.thinking, t.thinking);
            break;
          case "signature_delta":
            "thinking" === t.type && this._emit("signature", t.signature);
            break;
          default:
            e.delta;
        }
        break;
      }
      case "message_stop":
        (this._addMessageParam(n),
          this._addMessage(qt(n, s(this, Wt, "f"), s(this, Qt, "f")), !0));
        break;
      case "content_block_stop":
        this._emit("contentBlock", n.content.at(-1));
        break;
      case "message_start":
        t(this, Lt, n);
    }
  }),
  (ns = function () {
    if (this.ended) throw new o("stream has ended, this shouldn't happen");
    const e = s(this, Lt, "f");
    if (!e) throw new o("request ended without sending any chunks");
    return (t(this, Lt, void 0), qt(e, s(this, Wt, "f"), s(this, Qt, "f")));
  }),
  (rs = function (e) {
    let t = s(this, Lt, "f");
    if ("message_start" === e.type) {
      if (t)
        throw new o(
          `Unexpected event order, got ${e.type} before receiving "message_stop"`,
        );
      return e.message;
    }
    if (!t)
      throw new o(
        `Unexpected event order, got ${e.type} before "message_start"`,
      );
    switch (e.type) {
      case "message_stop":
      case "content_block_stop":
        return t;
      case "message_delta":
        return (
          (t.stop_reason = e.delta.stop_reason),
          (t.stop_sequence = e.delta.stop_sequence),
          (t.usage.output_tokens = e.usage.output_tokens),
          null != e.usage.input_tokens &&
            (t.usage.input_tokens = e.usage.input_tokens),
          null != e.usage.cache_creation_input_tokens &&
            (t.usage.cache_creation_input_tokens =
              e.usage.cache_creation_input_tokens),
          null != e.usage.cache_read_input_tokens &&
            (t.usage.cache_read_input_tokens = e.usage.cache_read_input_tokens),
          null != e.usage.server_tool_use &&
            (t.usage.server_tool_use = e.usage.server_tool_use),
          t
        );
      case "content_block_start":
        return (t.content.push({ ...e.content_block }), t);
      case "content_block_delta": {
        const s = t.content.at(e.index);
        switch (e.delta.type) {
          case "text_delta":
            "text" === s?.type &&
              (t.content[e.index] = {
                ...s,
                text: (s.text || "") + e.delta.text,
              });
            break;
          case "citations_delta":
            "text" === s?.type &&
              (t.content[e.index] = {
                ...s,
                citations: [...(s.citations ?? []), e.delta.citation],
              });
            break;
          case "input_json_delta":
            if (s && os(s)) {
              let n = s[is] || "";
              n += e.delta.partial_json;
              const r = { ...s };
              (Object.defineProperty(r, is, {
                value: n,
                enumerable: !1,
                writable: !0,
              }),
                n && (r.input = Le(n)),
                (t.content[e.index] = r));
            }
            break;
          case "thinking_delta":
            "thinking" === s?.type &&
              (t.content[e.index] = {
                ...s,
                thinking: s.thinking + e.delta.thinking,
              });
            break;
          case "signature_delta":
            "thinking" === s?.type &&
              (t.content[e.index] = { ...s, signature: e.delta.signature });
            break;
          default:
            e.delta;
        }
        return t;
      }
    }
  }),
  Symbol.asyncIterator)]() {
    const e = [],
      t = [];
    let s = !1;
    return (
      this.on("streamEvent", (s) => {
        const n = t.shift();
        n ? n.resolve(s) : e.push(s);
      }),
      this.on("end", () => {
        s = !0;
        for (const e of t) e.resolve(void 0);
        t.length = 0;
      }),
      this.on("abort", (e) => {
        s = !0;
        for (const s of t) s.reject(e);
        t.length = 0;
      }),
      this.on("error", (e) => {
        s = !0;
        for (const s of t) s.reject(e);
        t.length = 0;
      }),
      {
        next: async () => {
          if (!e.length)
            return s
              ? { value: void 0, done: !0 }
              : new Promise((e, s) => t.push({ resolve: e, reject: s })).then(
                  (e) =>
                    e ? { value: e, done: !1 } : { value: void 0, done: !0 },
                );
          return { value: e.shift(), done: !1 };
        },
        return: async () => (this.abort(), { value: void 0, done: !0 }),
      }
    );
  }
  toReadableStream() {
    return new Z(
      this[Symbol.asyncIterator].bind(this),
      this.controller,
    ).toReadableStream();
  }
}
class cs extends be {
  create(e, t) {
    return this._client.post("/v1/messages/batches", { body: e, ...t });
  }
  retrieve(e, t) {
    return this._client.get(Oe`/v1/messages/batches/${e}`, t);
  }
  list(e = {}, t) {
    return this._client.getAPIList("/v1/messages/batches", oe, {
      query: e,
      ...t,
    });
  }
  delete(e, t) {
    return this._client.delete(Oe`/v1/messages/batches/${e}`, t);
  }
  cancel(e, t) {
    return this._client.post(Oe`/v1/messages/batches/${e}/cancel`, t);
  }
  async results(e, t) {
    const s = await this.retrieve(e);
    if (!s.results_url)
      throw new o(
        `No batch \`results_url\`; Has it finished processing? ${s.processing_status} - ${s.id}`,
      );
    return this._client
      .get(s.results_url, {
        ...t,
        headers: ve([{ Accept: "application/binary" }, t?.headers]),
        stream: !0,
        __binaryResponse: !0,
      })
      ._thenUnwrap((e, t) => xt.fromResponse(t.response, t.controller));
  }
}
class ls extends be {
  constructor() {
    (super(...arguments), (this.batches = new cs(this._client)));
  }
  create(e, t) {
    e.model;
    let s = this._client._options.timeout;
    if (!e.stream && null == s) {
      const t = Ae[e.model] ?? void 0;
      s = this._client.calculateNonstreamingTimeout(e.max_tokens, t);
    }
    const n = Re(e.tools, e.messages);
    return this._client.post("/v1/messages", {
      body: e,
      timeout: s ?? 6e5,
      ...t,
      headers: ve([n, t?.headers]),
      stream: e.stream ?? !1,
    });
  }
  parse(e, t) {
    return this.create(e, t).then((t) =>
      Et(t, e, this._client.logger ?? console),
    );
  }
  stream(e, t) {
    return as.createMessage(this, e, t, {
      logger: this._client.logger ?? console,
    });
  }
  countTokens(e, t) {
    return this._client.post("/v1/messages/count_tokens", { body: e, ...t });
  }
}
ls.Batches = cs;
class us extends be {
  retrieve(e, t = {}, s) {
    const { betas: n } = t ?? {};
    return this._client.get(Oe`/v1/models/${e}`, {
      ...s,
      headers: ve([
        {
          ...(null != n?.toString()
            ? { "anthropic-beta": n?.toString() }
            : void 0),
        },
        s?.headers,
      ]),
    });
  }
  list(e = {}, t) {
    const { betas: s, ...n } = e ?? {};
    return this._client.getAPIList("/v1/models", oe, {
      query: n,
      ...t,
      headers: ve([
        {
          ...(null != s?.toString()
            ? { "anthropic-beta": s?.toString() }
            : void 0),
        },
        t?.headers,
      ]),
    });
  }
}
var hs = {};
const ds = (e) =>
  void 0 !== globalThis.process
    ? (hs?.[e]?.trim() ?? void 0)
    : void 0 !== globalThis.Deno
      ? globalThis.Deno.env?.get?.(e)?.trim()
      : void 0;
var ps, fs, gs, ms;
class ys {
  constructor({
    baseURL: e = ds("ANTHROPIC_BASE_URL"),
    apiKey: s = ds("ANTHROPIC_API_KEY") ?? null,
    authToken: n = ds("ANTHROPIC_AUTH_TOKEN") ?? null,
    ...r
  } = {}) {
    (ps.add(this), gs.set(this, void 0));
    const i = {
      apiKey: s,
      authToken: n,
      ...r,
      baseURL: e || "https://api.anthropic.com",
    };
    if (
      !i.dangerouslyAllowBrowser &&
      "undefined" != typeof window &&
      void 0 !== window.document &&
      "undefined" != typeof navigator
    )
      throw new o(
        "It looks like you're running in a browser-like environment.\n\nThis is disabled by default, as it risks exposing your secret API credentials to attackers.\nIf you understand the risks and have appropriate mitigations in place,\nyou can set the `dangerouslyAllowBrowser` option to `true`, e.g.,\n\nnew Anthropic({ apiKey, dangerouslyAllowBrowser: true });\n",
      );
    ((this.baseURL = i.baseURL),
      (this.timeout = i.timeout ?? fs.DEFAULT_TIMEOUT),
      (this.logger = i.logger ?? console));
    const a = "warn";
    ((this.logLevel = a),
      (this.logLevel =
        X(i.logLevel, "ClientOptions.logLevel", this) ??
        X(ds("ANTHROPIC_LOG"), "process.env['ANTHROPIC_LOG']", this) ??
        a),
      (this.fetchOptions = i.fetchOptions),
      (this.maxRetries = i.maxRetries ?? 2),
      (this.fetch =
        i.fetch ??
        (function () {
          if ("undefined" != typeof fetch) return fetch;
          throw new Error(
            "`fetch` is not defined as a global; Either pass `fetch` to the client, `new Anthropic({ fetch })` or polyfill the global, `globalThis.fetch = fetch`",
          );
        })()),
      t(this, gs, j),
      (this._options = i),
      (this.apiKey = "string" == typeof s ? s : null),
      (this.authToken = n));
  }
  withOptions(e) {
    return new this.constructor({
      ...this._options,
      baseURL: this.baseURL,
      maxRetries: this.maxRetries,
      timeout: this.timeout,
      logger: this.logger,
      logLevel: this.logLevel,
      fetch: this.fetch,
      fetchOptions: this.fetchOptions,
      apiKey: this.apiKey,
      authToken: this.authToken,
      ...e,
    });
  }
  defaultQuery() {
    return this._options.defaultQuery;
  }
  validateHeaders({ values: e, nulls: t }) {
    if (
      !e.get("x-api-key") &&
      !e.get("authorization") &&
      !(
        (this.apiKey && e.get("x-api-key")) ||
        t.has("x-api-key") ||
        (this.authToken && e.get("authorization")) ||
        t.has("authorization")
      )
    )
      throw new Error(
        'Could not resolve authentication method. Expected either apiKey or authToken to be set. Or for one of the "X-Api-Key" or "Authorization" headers to be explicitly omitted',
      );
  }
  async authHeaders(e) {
    return ve([await this.apiKeyAuth(e), await this.bearerAuth(e)]);
  }
  async apiKeyAuth(e) {
    if (null != this.apiKey) return ve([{ "X-Api-Key": this.apiKey }]);
  }
  async bearerAuth(e) {
    if (null != this.authToken)
      return ve([{ Authorization: `Bearer ${this.authToken}` }]);
  }
  stringifyQuery(e) {
    return Object.entries(e)
      .filter(([e, t]) => void 0 !== t)
      .map(([e, t]) => {
        if (
          "string" == typeof t ||
          "number" == typeof t ||
          "boolean" == typeof t
        )
          return `${encodeURIComponent(e)}=${encodeURIComponent(t)}`;
        if (null === t) return `${encodeURIComponent(e)}=`;
        throw new o(
          `Cannot stringify type ${typeof t}; Expected string, number, boolean, or null. If you need to pass nested query parameters, you can manually encode them, e.g. { query: { 'foo[key1]': value1, 'foo[key2]': value2 } }, and please open a GitHub issue requesting better support for your use case.`,
        );
      })
      .join("&");
  }
  getUserAgent() {
    return `${this.constructor.name}/JS ${x}`;
  }
  defaultIdempotencyKey() {
    return `stainless-node-retry-${n()}`;
  }
  makeStatusError(e, t, s, n) {
    return a.generate(e, t, s, n);
  }
  buildURL(e, t, n) {
    const r = (!s(this, ps, "m", ms).call(this) && n) || this.baseURL,
      i = ((e) => w.test(e))(e)
        ? new URL(e)
        : new URL(r + (r.endsWith("/") && e.startsWith("/") ? e.slice(1) : e)),
      o = this.defaultQuery();
    return (
      (function (e) {
        if (!e) return !0;
        for (const t in e) return !1;
        return !0;
      })(o) || (t = { ...o, ...t }),
      "object" == typeof t &&
        t &&
        !Array.isArray(t) &&
        (i.search = this.stringifyQuery(t)),
      i.toString()
    );
  }
  _calculateNonstreamingTimeout(e) {
    if ((3600 * e) / 128e3 > 600)
      throw new o(
        "Streaming is required for operations that may take longer than 10 minutes. See https://github.com/anthropics/anthropic-sdk-typescript#streaming-responses for more details",
      );
    return 6e5;
  }
  async prepareOptions(e) {}
  async prepareRequest(e, { url: t, options: s }) {}
  get(e, t) {
    return this.methodRequest("get", e, t);
  }
  post(e, t) {
    return this.methodRequest("post", e, t);
  }
  patch(e, t) {
    return this.methodRequest("patch", e, t);
  }
  put(e, t) {
    return this.methodRequest("put", e, t);
  }
  delete(e, t) {
    return this.methodRequest("delete", e, t);
  }
  methodRequest(e, t, s) {
    return this.request(
      Promise.resolve(s).then((s) => ({ method: e, path: t, ...s })),
    );
  }
  request(e, t = null) {
    return new ne(this, this.makeRequest(e, t, void 0));
  }
  async makeRequest(e, t, s) {
    const n = await e,
      o = n.maxRetries ?? this.maxRetries;
    (null == t && (t = o), await this.prepareOptions(n));
    const {
      req: a,
      url: h,
      timeout: d,
    } = await this.buildRequest(n, { retryCount: o - t });
    await this.prepareRequest(a, { url: h, options: n });
    const p =
        "log_" +
        ((Math.random() * (1 << 24)) | 0).toString(16).padStart(6, "0"),
      f = void 0 === s ? "" : `, retryOf: ${s}`,
      g = Date.now();
    if (
      (V(this).debug(
        `[${p}] sending request`,
        z({
          retryOfRequestLogID: s,
          method: n.method,
          url: h,
          options: n,
          headers: a.headers,
        }),
      ),
      n.signal?.aborted)
    )
      throw new c();
    const m = new AbortController(),
      y = await this.fetchWithTimeout(h, a, d, m).catch(i),
      b = Date.now();
    if (y instanceof globalThis.Error) {
      const e = `retrying, ${t} attempts remaining`;
      if (n.signal?.aborted) throw new c();
      const i =
        r(y) ||
        /timed? ?out/i.test(String(y) + ("cause" in y ? String(y.cause) : ""));
      if (t)
        return (
          V(this).info(
            `[${p}] connection ${i ? "timed out" : "failed"} - ${e}`,
          ),
          V(this).debug(
            `[${p}] connection ${i ? "timed out" : "failed"} (${e})`,
            z({
              retryOfRequestLogID: s,
              url: h,
              durationMs: b - g,
              message: y.message,
            }),
          ),
          this.retryRequest(n, t, s ?? p)
        );
      if (
        (V(this).info(
          `[${p}] connection ${i ? "timed out" : "failed"} - error; no more retries left`,
        ),
        V(this).debug(
          `[${p}] connection ${i ? "timed out" : "failed"} (error; no more retries left)`,
          z({
            retryOfRequestLogID: s,
            url: h,
            durationMs: b - g,
            message: y.message,
          }),
        ),
        i)
      )
        throw new u();
      throw new l({ cause: y });
    }
    const w = `[${p}${f}${[...y.headers.entries()]
      .filter(([e]) => "request-id" === e)
      .map(([e, t]) => ", " + e + ": " + JSON.stringify(t))
      .join(
        "",
      )}] ${a.method} ${h} ${y.ok ? "succeeded" : "failed"} with status ${y.status} in ${b - g}ms`;
    if (!y.ok) {
      const e = await this.shouldRetry(y);
      if (t && e) {
        const e = `retrying, ${t} attempts remaining`;
        return (
          await (async function (e) {
            if (null === e || "object" != typeof e) return;
            if (e[Symbol.asyncIterator])
              return void (await e[Symbol.asyncIterator]().return?.());
            const t = e.getReader(),
              s = t.cancel();
            (t.releaseLock(), await s);
          })(y.body),
          V(this).info(`${w} - ${e}`),
          V(this).debug(
            `[${p}] response error (${e})`,
            z({
              retryOfRequestLogID: s,
              url: y.url,
              status: y.status,
              headers: y.headers,
              durationMs: b - g,
            }),
          ),
          this.retryRequest(n, t, s ?? p, y.headers)
        );
      }
      const r = e ? "error; no more retries left" : "error; not retryable";
      V(this).info(`${w} - ${r}`);
      const o = await y.text().catch((e) => i(e).message),
        a = S(o),
        c = a ? void 0 : o;
      V(this).debug(
        `[${p}] response error (${r})`,
        z({
          retryOfRequestLogID: s,
          url: y.url,
          status: y.status,
          headers: y.headers,
          message: c,
          durationMs: Date.now() - g,
        }),
      );
      throw this.makeStatusError(y.status, a, c, y.headers);
    }
    return (
      V(this).info(w),
      V(this).debug(
        `[${p}] response start`,
        z({
          retryOfRequestLogID: s,
          url: y.url,
          status: y.status,
          headers: y.headers,
          durationMs: b - g,
        }),
      ),
      {
        response: y,
        options: n,
        controller: m,
        requestLogID: p,
        retryOfRequestLogID: s,
        startTime: g,
      }
    );
  }
  getAPIList(e, t, s) {
    return this.requestAPIList(t, { method: "get", path: e, ...s });
  }
  requestAPIList(e, t) {
    const s = this.makeRequest(t, null, void 0);
    return new ie(this, s, e);
  }
  async fetchWithTimeout(e, t, s, n) {
    const { signal: r, method: i, ...o } = t || {};
    r && r.addEventListener("abort", () => n.abort());
    const a = setTimeout(() => n.abort(), s),
      c =
        (globalThis.ReadableStream &&
          o.body instanceof globalThis.ReadableStream) ||
        ("object" == typeof o.body &&
          null !== o.body &&
          Symbol.asyncIterator in o.body),
      l = {
        signal: n.signal,
        ...(c ? { duplex: "half" } : {}),
        method: "GET",
        ...o,
      };
    i && (l.method = i.toUpperCase());
    try {
      return await this.fetch.call(void 0, e, l);
    } finally {
      clearTimeout(a);
    }
  }
  async shouldRetry(e) {
    const t = e.headers.get("x-should-retry");
    return (
      "true" === t ||
      ("false" !== t &&
        (408 === e.status ||
          409 === e.status ||
          429 === e.status ||
          e.status >= 500))
    );
  }
  async retryRequest(e, t, s, n) {
    let r;
    const i = n?.get("retry-after-ms");
    if (i) {
      const e = parseFloat(i);
      Number.isNaN(e) || (r = e);
    }
    const o = n?.get("retry-after");
    if (o && !r) {
      const e = parseFloat(o);
      r = Number.isNaN(e) ? Date.parse(o) - Date.now() : 1e3 * e;
    }
    if (!(r && 0 <= r && r < 6e4)) {
      const s = e.maxRetries ?? this.maxRetries;
      r = this.calculateDefaultRetryTimeoutMillis(t, s);
    }
    var a;
    return (
      await ((a = r), new Promise((e) => setTimeout(e, a))),
      this.makeRequest(e, t - 1, s)
    );
  }
  calculateDefaultRetryTimeoutMillis(e, t) {
    const s = t - e;
    return Math.min(0.5 * Math.pow(2, s), 8) * (1 - 0.25 * Math.random()) * 1e3;
  }
  calculateNonstreamingTimeout(e, t) {
    const s = 6e5;
    if ((36e5 * e) / 128e3 > s || (null != t && e > t))
      throw new o(
        "Streaming is required for operations that may take longer than 10 minutes. See https://github.com/anthropics/anthropic-sdk-typescript#long-requests for more details",
      );
    return s;
  }
  async buildRequest(e, { retryCount: t = 0 } = {}) {
    const s = { ...e },
      { method: n, path: r, query: i, defaultBaseURL: a } = s,
      c = this.buildURL(r, i, a);
    ("timeout" in s &&
      ((e, t) => {
        if ("number" != typeof t || !Number.isInteger(t))
          throw new o(`${e} must be an integer`);
        if (t < 0) throw new o(`${e} must be a positive integer`);
      })("timeout", s.timeout),
      (s.timeout = s.timeout ?? this.timeout));
    const { bodyHeaders: l, body: u } = this.buildBody({ options: s });
    return {
      req: {
        method: n,
        headers: await this.buildHeaders({
          options: e,
          method: n,
          bodyHeaders: l,
          retryCount: t,
        }),
        ...(s.signal && { signal: s.signal }),
        ...(globalThis.ReadableStream &&
          u instanceof globalThis.ReadableStream && { duplex: "half" }),
        ...(u && { body: u }),
        ...(this.fetchOptions ?? {}),
        ...(s.fetchOptions ?? {}),
      },
      url: c,
      timeout: s.timeout,
    };
  }
  async buildHeaders({ options: e, method: t, bodyHeaders: s, retryCount: n }) {
    let r = {};
    this.idempotencyHeader &&
      "get" !== t &&
      (e.idempotencyKey || (e.idempotencyKey = this.defaultIdempotencyKey()),
      (r[this.idempotencyHeader] = e.idempotencyKey));
    const i = ve([
      r,
      {
        Accept: "application/json",
        "User-Agent": this.getUserAgent(),
        "X-Stainless-Retry-Count": String(n),
        ...(e.timeout
          ? { "X-Stainless-Timeout": String(Math.trunc(e.timeout / 1e3)) }
          : {}),
        ...(O ?? (O = R())),
        ...(this._options.dangerouslyAllowBrowser
          ? { "anthropic-dangerous-direct-browser-access": "true" }
          : void 0),
        "anthropic-version": "2023-06-01",
      },
      await this.authHeaders(e),
      this._options.defaultHeaders,
      s,
      e.headers,
    ]);
    return (this.validateHeaders(i), i.values);
  }
  buildBody({ options: { body: e, headers: t } }) {
    if (!e) return { bodyHeaders: void 0, body: void 0 };
    const n = ve([t]);
    return ArrayBuffer.isView(e) ||
      e instanceof ArrayBuffer ||
      e instanceof DataView ||
      ("string" == typeof e && n.values.has("content-type")) ||
      (globalThis.Blob && e instanceof globalThis.Blob) ||
      e instanceof FormData ||
      e instanceof URLSearchParams ||
      (globalThis.ReadableStream && e instanceof globalThis.ReadableStream)
      ? { bodyHeaders: void 0, body: e }
      : "object" == typeof e &&
          (Symbol.asyncIterator in e ||
            (Symbol.iterator in e &&
              "next" in e &&
              "function" == typeof e.next))
        ? { bodyHeaders: void 0, body: T(e) }
        : s(this, gs, "f").call(this, { body: e, headers: n });
  }
}
((fs = ys),
  (gs = new WeakMap()),
  (ps = new WeakSet()),
  (ms = function () {
    return "https://api.anthropic.com" !== this.baseURL;
  }),
  (ys.Anthropic = fs),
  (ys.HUMAN_PROMPT = "\\n\\nHuman:"),
  (ys.AI_PROMPT = "\\n\\nAssistant:"),
  (ys.DEFAULT_TIMEOUT = 6e5),
  (ys.AnthropicError = o),
  (ys.APIError = a),
  (ys.APIConnectionError = l),
  (ys.APIConnectionTimeoutError = u),
  (ys.APIUserAbortError = c),
  (ys.NotFoundError = f),
  (ys.ConflictError = g),
  (ys.RateLimitError = y),
  (ys.BadRequestError = h),
  (ys.AuthenticationError = d),
  (ys.InternalServerError = b),
  (ys.PermissionDeniedError = p),
  (ys.UnprocessableEntityError = m),
  (ys.toFile = async function (e, t, s) {
    if (
      (ce(),
      (e = await e),
      t || (t = ue(e, !0)),
      ((e) =>
        null != e &&
        "object" == typeof e &&
        "string" == typeof e.name &&
        "number" == typeof e.lastModified &&
        me(e))(e))
    )
      return e instanceof File && null == t && null == s
        ? e
        : le([await e.arrayBuffer()], t ?? e.name, {
            type: e.type,
            lastModified: e.lastModified,
            ...s,
          });
    if (
      ((e) =>
        null != e &&
        "object" == typeof e &&
        "string" == typeof e.url &&
        "function" == typeof e.blob)(e)
    ) {
      const n = await e.blob();
      return (
        t || (t = new URL(e.url).pathname.split(/[\\/]/).pop()),
        le(await ye(n), t, s)
      );
    }
    const n = await ye(e);
    if (!s?.type) {
      const e = n.find((e) => "object" == typeof e && "type" in e && e.type);
      "string" == typeof e && (s = { ...s, type: e });
    }
    return le(n, t, s);
  }));
class bs extends ys {
  constructor() {
    (super(...arguments),
      (this.completions = new At(this)),
      (this.messages = new ls(this)),
      (this.models = new us(this)),
      (this.beta = new Tt(this)));
  }
}
function ws(e) {
  const [t, s] = e.split(","),
    n = t.match(/:(.*?);/)?.[1] || "image/png",
    r = atob(s),
    i = new Uint8Array(r.length);
  for (let o = 0; o < r.length; o++) i[o] = r.charCodeAt(o);
  return new Blob([i], { type: n });
}
function _s(e) {
  return new Promise((t, s) => {
    const n = new FileReader();
    ((n.onloadend = () => t(n.result)), (n.onerror = s), n.readAsDataURL(e));
  });
}
function vs(e) {
  return (e && e.includes(",") && e.split(",")[1]) || "";
}
function ks(e, t = "image/png") {
  const s = atob(e),
    n = new Uint8Array(s.length);
  for (let r = 0; r < s.length; r++) n[r] = s.charCodeAt(r);
  return new Blob([n], { type: t });
}
function Ss() {
  return `ss_${Date.now().toString().slice(-4)}${Math.random().toString(36).substring(2, 7)}`;
}
((bs.Completions = At), (bs.Messages = ls), (bs.Models = us), (bs.Beta = Tt));
const xs = (e) => {
    let t;
    const s = new Set(),
      n = (e, n) => {
        const r = "function" == typeof e ? e(t) : e;
        if (!Object.is(r, t)) {
          const e = t;
          ((t = (null != n ? n : "object" != typeof r || null === r)
            ? r
            : Object.assign({}, t, r)),
            s.forEach((s) => s(t, e)));
        }
      },
      r = () => t,
      i = {
        setState: n,
        getState: r,
        getInitialState: () => o,
        subscribe: (e) => (s.add(e), () => s.delete(e)),
      },
      o = (t = e(n, r, i));
    return i;
  },
  Rs = (e) => e;
const Ms = (t) => {
    const s = ((e) => (e ? xs(e) : xs))(t),
      n = (t) =>
        (function (t, s = Rs) {
          const n = e.useSyncExternalStore(
            t.subscribe,
            e.useCallback(() => s(t.getState()), [t, s]),
            e.useCallback(() => s(t.getInitialState()), [t, s]),
          );
          return (e.useDebugValue(n), n);
        })(s, t);
    return (Object.assign(n, s), n);
  },
  Ps = (e) => (e ? Ms(e) : Ms),
  Os = Ps((e, t) => ({
    remoteServers: {},
    remoteTools: {},
    addServers: (t) =>
      e((e) => ({
        remoteServers: t.reduce(
          (e, t) => ({ ...e, [t.uuid]: t }),
          e.remoteServers,
        ),
      })),
    addTools: (t, s) =>
      e((e) => ({ remoteTools: { ...e.remoteTools, [t]: s } })),
    updateServerConnection: (t, s) =>
      e((e) => {
        const n = e.remoteServers[t];
        return n
          ? {
              remoteServers: {
                ...e.remoteServers,
                [t]: { ...n, connected: s },
              },
            }
          : e;
      }),
    getServerByUuid: (e) => t().remoteServers[e],
  }));
export {
  bs as A,
  a,
  _s as b,
  Ps as c,
  ws as d,
  vs as e,
  ks as f,
  Ss as g,
  Os as u,
};
