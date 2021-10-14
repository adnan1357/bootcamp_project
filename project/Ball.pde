class Ball {
  PVector position; //ball coordinates
  PVector velocity = new PVector(); //ball velocity
  float speed; //ball speed
  float randValue; //random value for randomBool
  float radius; //ball radius
  color[] colour;
  color ballColour;

  Ball() {
    position = new PVector (random(radius+50, width-radius*1.5), random(radius+50, height-radius*1.5));
    radius = 15;
    speed = 10;
    colour = new color[2];
    colour[0] = #712929;
    colour[1] = #2E2971;
    
    randValue = round(random(0, 1));
    if (randValue == 0) {
      randValue = -1;
    }
  }

  void display() {
    pushStyle();
    fill(colour[ballColour]);
    circle(position.x, position.y, 2*radius);
    popStyle();
  }

  void ballVelocity() {
    float x = random(-speed, speed);
    float y = randValue * (sqrt(sq(speed)-sq(x)));
    velocity.set(x, y);
  }

  void ballMove() {
    position.x += velocity.x;
    position.y += velocity.y;
  }

  void ballRebound() {
    if (position.x <radius || position.x > width-radius) {
      if (position.x < radius){
        position.set(radius, position.y);
      }
      else if (position.x > width-radius){
        position.set(width-radius,position.y);
      }
      velocity.set(-velocity.x, velocity.y);
      blop.play();
    }
    if (position.y <0+radius || position.y > height-radius) {
      if (position.y < radius){
        position.set(position.x, radius);
      }
      else if (position.x > height-radius){
        position.set(position.x,height-radius);
      }
      velocity.set(velocity.x, -velocity.y);
      blop.play();
    }
  }
}
