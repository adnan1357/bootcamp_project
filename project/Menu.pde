class Menu {
  boolean inPlay = false;
  PImage image;
  String[] difficulty = new String[3];
  int mode = 0;
  
  Menu(){
    difficulty[0] = "EASY";
    difficulty[1] = "MEDIUM";
    difficulty[2] = "HARD";
    textAlign(CENTER);
  }
  
  void display() {
    imageMode(CENTER);
    image = loadImage("icon.png");

    pushStyle();
    fill(0);
    rect(0, 0, width, height);
    play();
    popStyle();
  }

  void play() {
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2, 100, 40);
    rect(width/2, height/2+50, 100, 40);
    fill(0);
    text("PLAY", width/2, height/2+5);
    pushStyle();
    textSize(10);
    text("DIFFICULTY: "+difficulty[mode], width/2, height/2+55);
    popStyle();
    if(mouseX > (width/2-50) && mouseX<(width/2+50) && mouseY >(height/2-20) && mouseY <(height/2+20)){
      //noCursor();
      pushMatrix();
      translate(width/2,height/2);
      scale(0.5);
      //image(image, mouseX, mouseY);
      popMatrix();
    }
    else{cursor();}
  }
  
}
