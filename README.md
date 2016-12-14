# onRightClickElm

This project demonstrates how to respond to right mouse clicks in elm.

The code was originally taken from this gist: https://gist.github.com/roSievers/78f0a533b047d295d549453ae3db49d5 .

That code was written in response to this reddit question : https://www.reddit.com/r/elm/comments/58z9su/is_anyone_using_right_clicking_from_elm/

Oddly, the last comment in that thread says that using "oncontextmenu" instead of "contextmenu" was the key to getting it to work but my experience is the exact opposite.  In this code, the original use of "oncontextmenu" is changed to "contextmenu" and right mouse picks work.   Using "oncontextmenu" did not work.  Tested in chrome and firefox.

My original motivation was to get right mouse clicks working in svg so I added an svg rectangle in which right and left mouse clicks are both active.

For a live demo, follow this link: https://dc25.github.io/onRightClickElm/
