// Credits to Syaiful Rahman for this code https://github.com/ipunkvizard/cordova-plugin-customurlscheme/commit/f472f26b6416aa1951fa688500edcb61d005c519

(function () {
  "use strict";

  var remainingAttempts = 10;

  function waitForAndCallHandlerFunction(url) {
    if (typeof window.handleOpenURL === "function") {
      window.handleOpenURL(url);
    } else if (remainingAttempts-- > 0) {
      setTimeout(function () {
        waitForAndCallHandlerFunction(url);
      }, 500);
    }
  }

  function triggerOpenURL() {
    cordova.exec(
      waitForAndCallHandlerFunction,
      function (error) {
        // Error callback
        console.error("Error opening URL: ", error);
      },
      "LaunchMyApp",
      "openURL",
      []
    );
  }

  document.addEventListener("deviceready", triggerOpenURL, false);

}());
