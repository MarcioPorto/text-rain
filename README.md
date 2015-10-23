## Text Rain

Charles Park
Marcio Porto

COMP 394
Interactive Graphics
Homework 1 - Text Rain

========================================================================

We created an Array of the Letter class that we defined. In that Letter class, the constructor initializes the following:

	-RandomInt so that the letter is randomly placed across the screen (width)
	-randomLetterInt so that a random letter is picked from the letters string we created
	-velocityInt so that the letter falls randomly based on the time at which the letter was initialized.

We also made sure that image is gray scaled appropriately and threshold scaled when using the spacebar. We also made it possible to change the threshold value by pressing the up/down key. The initial threshold count is 100. The threshold is the brightness value of the pixel.

We also flipped the video image so it behaves like a mirror. This was done by utilizing the functions in the Transform category in Processing.

We picked the characters to display at random from a poem called "Talk, you" by Evan Zimroth. This was the poem used in the video as well.

We made the characters disappear if it reaches the bottom of the screen or if it has been a long time since initialization.

Enjoy our code!
