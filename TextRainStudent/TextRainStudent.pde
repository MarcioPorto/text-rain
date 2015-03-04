/**
    Comp 394 Spring '15 Assignment #1 Text Rain
    Charles Park
    Marcio Porto
**/


import processing.video.*;

// Global variables for handling video data and the input selection screen
String[] cameras;
Capture cam;
Movie mov;
PImage inputImage;
boolean inputMethodSelected = false;

PFont font;
//String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
ArrayList<Letter> raindrops = new ArrayList<Letter>();
int threshold = 100;
int pressed = 0;

String letters = "I like talking with you simply that conversing a turning-with or-around as inyour turning around to face me suddenly saying Come and I turn with you for a sometime hand under my under-things and you telling me what you would do where on what part of my body you might talk to me differently At your turning each part of my body turns to verb We are the opposite of tongue-tied as if there were such an antonym we are synonyms for limbs loosening of syntax and yet turn to nothing It’s just talk";


void setup() {
  size(1280, 720);
  smooth();
  inputImage = createImage(width, height, RGB);
  font = createFont("Chalkboard", 12, true);
  textFont(font,12);
  fill(0);
}


void draw() {
  // When the program first starts, draw a menu of different options for which camera to use for input
  // The input method is selected by pressing a key 0-9 on the keyboard
  if (!inputMethodSelected) {
    cameras = Capture.list();
    int y=40;
    text("O: Offline mode, test with TextRainInput.mov movie file instead of live camera feed.", 20, y);
    y += 40; 
    for (int i = 0; i < min(9,cameras.length); i++) {
      text(i+1 + ": " + cameras[i], 20, y);
      y += 40;
    }
    return;
  }


  // This part of the draw loop gets called after the input selection screen, during normal execution of the program.

  
  // STEP 1.  Load an image, either from a movie file or from a live camera feed. Store the result in the inputImage variable
  
  if ((cam != null) && (cam.available())) {
    cam.read();
    inputImage.copy(cam, 0,0,cam.width,cam.height, 0,0,inputImage.width,inputImage.height);
  }
  else if ((mov != null) && (mov.available())) {
    mov.read();
    inputImage.copy(mov, 0,0,mov.width,mov.height, 0,0,inputImage.width,inputImage.height);
  }


  // Fill in your code to implement the rest of TextRain here..

  // Tip: This code draws the current input image to the screen
  
  set(0, 0, inputImage);
  
  // Flips the video image so it behaves like a mirror.
  if ((cam != null)) {
    pushMatrix();
    scale(-1,1);
    translate(-cam.width,0);
    image(cam,0,0);
    popMatrix();
  }
  
  // Gray scale
  filter(GRAY);
  // Was spacebar pressed?
  if(pressed % 2 != 0){
    // Threshold scale.
    filter(THRESHOLD);
  }
  
  //Puts the threshold count at the bottom right of screen.
  fill(0,100,255);
  text("Threshold: " + threshold , width-83, height-5);
 
  
  //Initializing new raindrop
  Letter new_raindrop = new Letter();
  raindrops.add(new_raindrop);
  for(int i=0;i<raindrops.size();i++){
    //raindrops.get(i).update(); 
    color getColor = get(raindrops.get(i).x_position,raindrops.get(i).y_position+10);
    if(brightness(getColor) < threshold){
      raindrops.get(i).y_position-= 10;
      raindrops.get(i).update(); 
    }
    else{
    raindrops.get(i).update();
    //print(hex(getColor));
    }
    
    if(raindrops.get(i).y_position > height-15 || raindrops.get(i).timesUpdated > 400){
      raindrops.remove(i);
      i--;
    }
    
  }

}


void keyPressed() {
  if (!inputMethodSelected) {
    // If we haven't yet selected the input method, then check for 0 to 9 keypresses to select from the input menu
    if ((key >= '0') && (key <= '9')) { 
      int input = key - '0';
      if (input == 0) {
        println("Offline mode selected.");
        mov = new Movie(this, "TextRainInput.mov");
        mov.loop();
        inputMethodSelected = true;
      }
      else if ((input >= 1) && (input <= 9)) {
        println("Camera " + input + " selected.");           
        // The camera can be initialized directly using an element from the array returned by list():
        cam = new Capture(this, cameras[input-1]);
        cam.start();
        inputMethodSelected = true;
      }
    }
    return;
  }


  // This part of the keyPressed routine gets called after the input selection screen during normal execution of the program
  // Fill in your code to handle keypresses here..
  
  if (key == CODED) {
    if (keyCode == UP) {
      // up arrow key pressed
      threshold += 1;
    }
    else if (keyCode == DOWN) {
      // down arrow key pressed
      threshold -= 1;
    }
  }
  else if (key == ' ') {
    // space bar pressed
    pressed += 1;
    filter(THRESHOLD);
  } 
  
}

class Letter {
  float randomFloat;
  int randomInt;
  float randomLetterFloat;
  int randomLetterInt;
  //float velocityFloat;
  int velocityInt;
  int x_position;
  int y_position;
  int timesUpdated;
  
  
  Letter(){
    randomFloat = random(0,width);
    randomInt = round(randomFloat);
    randomLetterFloat = random(0,letters.length()-1);
    randomLetterInt = round(randomLetterFloat);
    //velocityFloat = random(0,3);
    //velocityInt = round(velocityFloat);
    velocityInt = (millis()%3)+1;
    y_position = 0;
    x_position = randomInt;
    timesUpdated = 0;
    
    text(letters.charAt(randomLetterInt), x_position, y_position);
    fill(0, 100, 255);

  }
  
  void update() {
    this.y_position += this.velocityInt;
    this.timesUpdated += 1;
    text(letters.charAt(this.randomLetterInt), this.x_position, this.y_position);
    
  }
  
  
}

