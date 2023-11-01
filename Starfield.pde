Particle[] stars = new Particle[50];

void setup() {
  size(1000,1000);
  background(0);
  for (int i = 0; i < 6; i++){
    stars[i] = new OddballParticle();
  }
  for (int i = 6; i < stars.length; i++){
    stars[i] = new Particle();
  }
}

void draw(){
  for (int i = 0; i < stars.length; i++){
    stars[i].move();
    stars[i].show();
  }
}

class Particle{
  double myX, myY, myAngle, mySpeed;
  int color1, color2, color3;
  Particle() {
    myX = 500;
    myY = 500;
    color1 = (int)(Math.random()*250);
    color2 = (int)(Math.random()*250);
    color3 = (int)(Math.random()*250);
    myAngle = (float)(Math.random()*6.28);
    mySpeed = (float)((Math.random()*15)-7);
  }
  
  void move(){
    myX += cos((float)(myAngle * mySpeed));
    myY += sin((float)(myAngle * mySpeed));
    fill(0, 0, 0);
    ellipse((int)myX, (int)myY, 20, 20);
    if((myX > 1000) || (myX < 0)){
      myX = 500;
      myY = 500;
    }
    else if((myY > 1000) || (myY < 0)){
      myX = 500;
      myY = 500;
    }
  }
  
  void show(){
    noStroke();
    fill(color1, color2, color3);
    ellipse((int)myX, (int)myY, 15, 15);
  }
}

class OddballParticle extends Particle {
  int myColor;
  OddballParticle() {
    myX = 900;
    myY = (int)(Math.random()* 800);
    myColor = 250;
  }
  
  void move() {
    myX += 1;
    myY -= 2;
    if (myX > 1050){
      myX = 0;
    }
    else if (myY < -5){
      myY = 1000;
    }
    fill(0);
    ellipse((int)myX, (int)myY, 15, 15);
  }
  
  void show() {
    noStroke();
    fill(0, 0, myColor);
    ellipse((int)myX, (int)myY, 10, 10);
  }
}
