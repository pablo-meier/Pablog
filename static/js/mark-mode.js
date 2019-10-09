'use strict';

/**
 * Knockoff/joke off of "dark mode." Mark mode dots all the i's in text nodes with a famous Mark:
 * Mark Zuckerburg, Marc Maron, Mark Cuban, Mark from The Room, Marc Andreeson…
 *
 * The technical implementation will happen in a few steps:
 *
 * - Find all the `i`'s or `j`'s in text nodes and wrap them in a <span class="mark-i"><span class="mark-dot-x"></span>i</span>
 * - The (x) will be randomly generated within a range, each will have a different value for offset in a spritesheet.
 * - mark-dot-x will float on top, with a high z-index so it's "in front of" the lower i
 *
 * Since the rest is happening in CSS and the spritesheet, the main responsibility of this function is to edit the
 * DOM. It travels the whole damn thing and wraps all text nodes in new <span>s, so it's not, like, efficient.
 */
function markMode() {

  function getRandomWithin(min, max) {
    return Math.floor(Math.random() * (max - min) + min);
  }

  /**
   * Only called on text nodes. Finds all the i's and j's in content, wraps them in a span with a random Mar[ck].
   *
   * Note that the naive way to do this is with global regex replace; unfortunately, this leads to you using the
   * same Mar[kc] for the entire text node. The better thing to do is use a random Mar[ck] for each instance of `i`, which
   * can happen multiple times in a text node.
   *
   * Therefore, we're doing a nasty little state-tracking runaround the string. This is a bit like a whiteboard
   * interview problem in 2009, where you'd mangle indices around a string.
   *
   * Also, turns out most elements that haven't been HTML minified have tabs and spaces as children; we just
   * return in those instances rather than create new <spans>
   */
  function wrapInSpans(textNode) {
    let text = textNode.nodeValue;
    if (text.trim() == '') {
      return;
    }

    const regex = /[i]/g;
    let replacementText = "";
    let startIndex = 0;
    while (regex.exec(text) !== null) {
      replacementText += text.substring(startIndex, regex.lastIndex - 1);
      let identifier = getRandomWithin(0, 10);
      replacementText += `<span class="mark-i"><span class="mark-dot-${identifier}"></span>i</span>`;
      startIndex = regex.lastIndex;
    }
    replacementText += text.substring(startIndex);

    let replacement = document.createElement('span');
    replacement.innerHTML = replacementText;
    textNode.replaceWith(replacement);
  }

  /**
   * DFS tree traversal, like we did back in college.
   */
  function markModeRecursive(element) {
    element.childNodes.forEach((child) => {
      if (child.nodeType == Node.TEXT_NODE) {
        wrapInSpans(child);
      } else {
        markModeRecursive(child);
      }
    });
  }

  markModeRecursive(document.querySelector('body'));
}
