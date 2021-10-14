class Player {
  PVector position;//player position
  float radius;
  float speed;
  char character;

  Player() {
    radius = 12.5;
    position = new PVector(radius, radius);
    speed = 5;
  }

  void draw() {
    circle(position.x, position.y, 2*radius);
    move();

  }
  void move(){
    if (key == 'w') {
      position.set(position.x, constrain(position.y-speed, radius, height-radius));
      character = key;
    } else if (key == 's') {
      position.set(position.x, constrain(position.y+speed, radius, height-radius));
      character = key;
    } else if (key == 'a') {
      position.set(constrain(position.x-speed, radius, width-radius), position.y);
      character = key;
    } else if (key == 'd') {
      position.set(constrain(position.x+speed, radius, width-radius), position.y);
      character = key;
    }
    else{ key = character;}
  }
  
}
