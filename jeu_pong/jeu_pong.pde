void setup() {
  fullScreen();
  background(0);
  stroke(255);
  strokeWeight(5);
}

class Balle {
  float x, y, w, h;
  float dx, dy;
  Balle() {
    x = 500;
    y = 500;
    w = 10;
    h = 10;
    dx = 2;
    dy = 2;
  }
  void dessiner() {
    ellipse(x, y, w, h);
  }
  void bouger() {
    x+=dx;
    y+=dy;
    if (x >= width || x<=0) {
      dx=-dx;
      augmenter_vitesse();
    }
    if (y >= height || y<=0) {
      dy=-dy;
      augmenter_vitesse();
    }
    if (x<=r1.x+r1.longueur && y > r1.y && y< r1.y+r1.largeur) {
      dx = -dx;
      dy = -dy;
    }
    dessiner();
  }
  void augmenter_vitesse() {
    dx = dx * 1.01;
    dy = dy * 1.01;
  }
}

class Raquette {
  int x, y, dy, longueur, largeur;
  Raquette() {
    x = 20;
    y = 300;
    dy = 2;
    longueur = 20;
    largeur = 100;
  }
  void dessiner() {
    rect(x, y, longueur, largeur);
  }
  void up_move() {
    if (y+largeur < height) {
      y+= dy;
    }
    else {
      y = 10;
    }
  }
  void down_move() {
    if (y > 0) {
      y-=dy;
    }
    else {
      y = height-largeur-10;
    }
  }
}

Balle balle = new Balle();
Raquette r1 = new Raquette();

void draw() {
  background(0);
  line(width/2, 0, width/2, height);
  balle.bouger();
  if (key == CODED) {
    if (keyCode == DOWN) {
      r1.up_move();
    }
    if(keyCode == UP) {
      r1.down_move();
    }
  }
  r1.dessiner();

}
