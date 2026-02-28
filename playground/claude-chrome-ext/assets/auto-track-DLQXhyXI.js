import { aJ as t } from "./Main-Baot3sP1.js";
import "./index-BVS4T5_D.js";
import "./SavedPromptsService-Ca57zNuQ.js";
import "./index-D6M7XaCF.js";
function n(n, e, r, o) {
  var i = this;
  return n
    ? ((n instanceof Element ? [n] : "toArray" in n ? n.toArray() : n).forEach(
        function (n) {
          n.addEventListener(
            "click",
            function (a) {
              var c,
                u,
                s = e instanceof Function ? e(n) : e,
                f = r instanceof Function ? r(n) : r,
                l =
                  n.getAttribute("href") ||
                  n.getAttributeNS("http://www.w3.org/1999/xlink", "href") ||
                  n.getAttribute("xlink:href") ||
                  (null === (c = n.getElementsByTagName("a")[0]) || void 0 === c
                    ? void 0
                    : c.getAttribute("href")),
                h = t(
                  i.track(s, f, null != o ? o : {}),
                  null !== (u = i.settings.timeout) && void 0 !== u ? u : 500,
                );
              (function (t, n) {
                return !("_blank" !== t.target || !n);
              })(n, l) ||
                (function (t) {
                  var n = t;
                  return !!(
                    n.ctrlKey ||
                    n.shiftKey ||
                    n.metaKey ||
                    (n.button && 1 == n.button)
                  );
                })(a) ||
                (l &&
                  (a.preventDefault ? a.preventDefault() : (a.returnValue = !1),
                  h
                    .catch(console.error)
                    .then(function () {
                      window.location.href = l;
                    })
                    .catch(console.error)));
            },
            !1,
          );
        },
      ),
      this)
    : this;
}
function e(n, e, r, o) {
  var i = this;
  return n
    ? (n instanceof HTMLFormElement && (n = [n]),
      n.forEach(function (n) {
        if (!(n instanceof Element))
          throw new TypeError(
            "Must pass HTMLElement to trackForm/trackSubmit.",
          );
        var a = function (a) {
            var c;
            a.preventDefault ? a.preventDefault() : (a.returnValue = !1);
            var u = e instanceof Function ? e(n) : e,
              s = r instanceof Function ? r(n) : r;
            t(
              i.track(u, s, null != o ? o : {}),
              null !== (c = i.settings.timeout) && void 0 !== c ? c : 500,
            )
              .catch(console.error)
              .then(function () {
                n.submit();
              })
              .catch(console.error);
          },
          c = window.jQuery || window.Zepto;
        c ? c(n).submit(a) : n.addEventListener("submit", a, !1);
      }),
      this)
    : this;
}
export { e as form, n as link };
