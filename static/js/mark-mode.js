'use strict';

/**
 * Knockoff/joke off of "dark mode." Mark mode dots all the i's in text nodes with a famous Mark:
 * Mark Zuckerburg, Marc Maron, Mark Cuban, Mark from The Room, Marc Andreeson…
 *
 * The technical implementation will happen in a few steps:
 *
 * - Find all the `i` text nodes and wrap them in a <span class="mark-i"><span class="mark-dot-x"></span>i</span>
 * - The (x) will be randomly generated within a range, each will have a different value for offset in a spritesheet.
 * - mark-dot-x will float on top, with a high z-index so it's "in front of" the lower i
 *
 * Since the rest is happening in CSS and the spritesheet, the main responsibility of this function is to edit the
 * DOM. It travels the whole damn thing, so it's not efficient.
 */
function markMode() {

  function getRandomArbitrary(min, max) {
    return Math.floor(Math.random() * (max - min) + min);
  }

  function wrapInSpans(textNode) {
    let text = textNode.nodeValue;
    let identifier = getRandomArbitrary(0, 11);
    let replacementText = text.replace(/[ij]/g, `<span class="mark-i"><span class="mark-dot-${identifier}"></span>i</span>`);
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
