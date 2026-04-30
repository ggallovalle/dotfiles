// ==UserScript==
// @name         DeepSeek Paragraph-Friendly Input
// @namespace    http://tampermonkey.net/
// @version      1.0
// @description  Enter = paragraph, Alt/Ctrl+Enter = submit
// @match        https://chat.deepseek.com/*
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
      el instanceof HTMLTextAreaElement &&
      el.placeholder === "Message DeepSeek"
    );
  }

  function handleKey(e) {
    if (e.isComposing) return;
    if (e.key !== "Enter") return;
    if (!isEditor(e.target)) return;

    const isModifier = isMac ? e.altKey : e.ctrlKey;

    if (isModifier) return;

    e.preventDefault();
    const start = e.target.selectionStart;
    const end = e.target.selectionEnd;
    const value = e.target.value;
    e.target.value = value.substring(0, start) + "\n" + value.substring(end);
    e.target.selectionStart = e.target.selectionEnd = start + 1;
    e.target.dispatchEvent(new Event("input", { bubbles: true }));
  }

  document.addEventListener("keydown", handleKey, {
    capture: true,
    signal,
  });

  window.addEventListener("beforeunload", () => controller.abort(), {
    once: true,
  });
})();