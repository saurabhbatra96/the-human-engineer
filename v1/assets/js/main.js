/* The Human Quest — small progressive-enhancement layer. */
(function () {
  "use strict";

  /* ---------------------------------------------------------- mobile nav -- */
  var toggle = document.querySelector(".nav-toggle");
  var nav = document.getElementById("primary-nav");

  if (toggle && nav) {
    toggle.addEventListener("click", function () {
      var open = toggle.getAttribute("aria-expanded") === "true";
      toggle.setAttribute("aria-expanded", String(!open));
      nav.classList.toggle("is-open", !open);
    });
  }

  /* ---------------------------------------------------- subscribe form ----
     GitHub Pages is static, so there is no server to post to. Set
     SUBSCRIBE_ENDPOINT below to your provider's form URL (Buttondown,
     ConvertKit, Mailchimp, Formspree, …) and the form posts there.
     Left blank, it falls back to opening a pre-filled email instead, so the
     button is never a dead end. See README.md.
  -------------------------------------------------------------------------- */
  var SUBSCRIBE_ENDPOINT = "";
  var FALLBACK_EMAIL = "info@umabatra.com";

  Array.prototype.forEach.call(
    document.querySelectorAll("form[data-subscribe]"),
    function (form) {
      var status = form.parentNode.querySelector(".form-status");

      if (SUBSCRIBE_ENDPOINT) {
        form.setAttribute("action", SUBSCRIBE_ENDPOINT);
        form.setAttribute("method", "post");
        return; // let the provider handle it natively
      }

      form.addEventListener("submit", function (event) {
        event.preventDefault();
        var field = form.querySelector('input[type="email"]');
        var email = field ? field.value.trim() : "";

        if (!email) {
          if (field) field.focus();
          return;
        }

        var href =
          "mailto:" + FALLBACK_EMAIL +
          "?subject=" + encodeURIComponent("Subscribe to The Human Quest") +
          "&body=" + encodeURIComponent(
            "Please add this address to The Human Quest newsletter:\n\n" + email
          );

        window.location.href = href;

        if (status) {
          status.textContent =
            "Opening your email app to finish subscribing…";
        }
        form.reset();
      });
    }
  );
})();
