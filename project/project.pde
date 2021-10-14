ArrayList<Ball> Balls = new ArrayList<Ball>();
ArrayList<Food> Foods = new ArrayList<Food>();
float ballNum; //amount of balls
int score;
Menu menu;
Player player;
import processing.sound.*;
SoundFile blop;

void setup() {
  size(700, 700);
  player = new Player();
  menu = new Menu();
  menu.inPlay = false;
  blop = new SoundFile(this, "blop.wav");
}

void draw() {
  if (menu.inPlay) {
    background(#D8C3C3);
    player.draw();
    if (frameCount % 60 == 0) {
      Foods.add(new Food());
    }

    for (Food food : Foods) {
      food.display();
    }
    for (Ball ball : Balls) {
      ball.display();
      ball.ballRebound();
      ball.ballMove();
    }
    bounce();
    eat();
    collide();
  } else {
    menu.display();
  }
}

void bounce() {
  for (int i = 0; i <Balls.size(); i++) {
    for (int x = 0; x <Balls.size(); x++) {
      if (x == i) {
      } else {
        if (dist(Balls.get(i).position.x, Balls.get(i).position.y, Balls.get(x).position.x, Balls.get(x).position.y)<Balls.get(i).radius+Balls.get(x).radius) {
          Balls.get(i).velocity.set(-Balls.get(i).velocity.x, -Balls.get(i).velocity.y);
        }
      }
    }
  }
}
void mouseClicked() {
  if (!menu.inPlay) {
    if (mouseX > (width/2-50) && mouseX<(width/2+50) && mouseY >(height/2-20) && mouseY <(height/2+20)) {
      if (menu.mode == 2) {
        ballNum = 3;
      } else {
        ballNum = 2;
      }
      for (int i=0; i<ballNum; i++) {
        Balls.add(new Ball());
        if (menu.mode > 0) {
          Balls.get(i).speed = 15;
        }
      }
      for (int i=0; i<Balls.size(); i++) {
        Balls.get(i).ballVelocity();
      }
      menu.inPlay = true;
    } else if (mouseX > (width/2-50) && mouseX<(width/2+50) && mouseY >(height/2+30) && mouseY <(height/2+70)) {
      menu.mode ++;
      if (menu.mode>2) {
        menu.mode=0;
      }
    }
  }
}

void eat() {
  for (int i = 0; i <Balls.size(); i++) {
    for (int x = 0; x <Foods.size(); x++) {
      if (dist(Balls.get(i).position.x, Balls.get(i).position.y, Foods.get(x).position.x, Foods.get(x).position.y)<Balls.get(i).radius+Foods.get(x).radius) {
        Foods.remove(x);
      }
    }
  }

  for (int x = 0; x <Foods.size(); x++) {
    if (dist(player.position.x, player.position.y, Foods.get(x).position.x, Foods.get(x).position.y)<player.radius+Foods.get(x).radius) {
      score +=1;
      Foods.remove(x);
    }
  }
}

void collide() {
  for (int i = 0; i <Balls.size(); i++) {
    if (dist(player.position.x, player.position.y, Balls.get(i).position.x, Balls.get(i).position.y)<player.radius+Balls.get(i).radius) {
      textAlign(CENTER);
      frameRate(0);
      fill (0, 100);
      rect(0, 0, width, height);
      fill(255);
      text("GAME OVER", width/2, height/2);
      text("SCORE: "+score, width/2, height/2+20);
    }
  }
}
