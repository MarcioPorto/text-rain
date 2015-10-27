# Text Rain Homework

Charles Park & Marcio Porto

COMP 394 - Interactive Graphics - Homework 1 - Text Rain

## Overview

Text Rain is an interactive installation in which participants use the familiar instrument of their bodies to lift and play with falling letters that do not really exist.

As described in [Camille Utterback's](http://camilleutterback.com/projects/text-rain/): "In the Text Rain installation participants stand or move in front of a large projection screen. On the screen they see a mirrored video projection of themselves in black and white, combined with a color animation of falling letters. Like rain or snow, the letters appears to land on participants’ heads and arms. The letters respond to the participants’ motions and can be caught, lifted, and then let fall again. The falling text will ‘land’ on anything darker than a certain threshold, and ‘fall’ whenever that obstacle is removed. If a participant accumulates enough letters along their outstretched arms, or along the silhouette of any dark object, they can sometimes catch an entire word, or even a phrase. The falling letters are not random, but form lines of a poem about bodies and language. ‘Reading’ the phrases in the Text Rain installation becomes a physical as well as a cerebral endeavor."

We created an Array of the Letter class that we defined. In that Letter class, the constructor initializes the following:
- RandomInt so that the letter is randomly placed across the screen (width)
- randomLetterInt so that a random letter is picked from the letters string we created
- velocityInt so that the letter falls randomly based on the time at which the letter was initialized.

We also made sure that image is gray scaled appropriately and threshold scaled when using the spacebar. We also made it possible to change the threshold value by pressing the up/down key. The initial threshold count is 100. The threshold is the brightness value of the pixel.

We also flipped the video image so it behaves like a mirror. This was done by utilizing the functions in the Transform category in Processing.

We picked the characters to display at random from a poem called "Talk, you" by Evan Zimroth. This was the poem used in the video as well.

We made the characters disappear if it reaches the bottom of the screen or if it has been a long time since initialization.

Enjoy our code!
