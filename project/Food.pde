class Food{
  float radius;
  PVector position;
  color colour;
  
  Food(){
    radius=5;
    position = new PVector(random(0+radius,width-radius),random(0+radius, height-radius));
    colour = color(random(255),random(255),random(255));
  }
  
  void display(){
    pushStyle();
    fill(colour);
    circle(position.x,position.y, 2*radius);
    popStyle();
  }
}
