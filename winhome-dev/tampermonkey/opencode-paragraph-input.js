// ==UserScript==
// @name         OpenCode Paragraph-Friendly Input
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Enter = paragraph, Alt/Ctrl+Enter = submit
// @match        http://127.0.0.1:4096/*
// @grant        none
// ==/UserScript==

(function() {
  "use strict";

  const controller = new AbortController();
  const { signal } = controller;

  const isMac =
    navigator.userAgentData?.platform === "macOS" ||
    navigator.platform.toLowerCase().includes("mac");

  function isEditor(el) {
    return (
      el instanceof HTMLElement &&
      el.getAttribute("role") === "textbox" &&
      el.getAttribute("aria-multiline") === "true" &&
      el.isContentEditable
    );
  }

  function handleKey(e) {
    if (e.isComposing) return;
    if (e.key !== "Enter") return;
    if (!isEditor(e.target)) return;

    const isModifier = isMac ? e.altKey : e.ctrlKey;

    if (isModifier) return;

    e.preventDefault();
    document.execCommand("insertLineBreak");
    document.execCommand("insertLineBreak");
  }

  document.addEventListener("keydown", handleKey, {
    capture: true,
    signal,
  });

  window.addEventListener("beforeunload", () => controller.abort(), {
    once: true,
  });
})();