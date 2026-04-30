// ==UserScript==
// @name         ChatGPT Paragraph-Friendly Input (ProseMirror Fix)
// @namespace    http://tampermonkey.net/
// @version      3.0
// @description  Enter = paragraph, Alt/Ctrl+Enter = submit
// @match        https://chatgpt.com/*
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
      el.id === "prompt-textarea" &&
      el.classList.contains("ProseMirror")
    );
  }

  function handleKey(e) {
    if (e.isComposing) return;
    if (e.key !== "Enter") return;
    if (!isEditor(e.target)) return;

    const isModifier = isMac ? e.altKey : e.ctrlKey;

    // Allow submit shortcut
    if (isModifier) return;

    // 🚨 IMPORTANT: don't fully block ProseMirror
    e.preventDefault();

    /**
     * Trick: simulate Shift+Enter OR double Enter depending on behavior
     * ProseMirror understands these
     */

    // this is ok even if depreacted it works on firefox
    document.execCommand('insertLineBreak');
    document.execCommand('insertLineBreak');

  }

  document.addEventListener("keydown", handleKey, {
    capture: true,
    signal,
  });

  window.addEventListener("beforeunload", () => controller.abort(), {
    once: true,
  });
})();

