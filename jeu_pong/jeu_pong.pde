void setup() {
  fullScreen();
  background(0);
  stroke(255);
  strokeWeight(5);
  smooth();
}

class Balle {
  float x, y, w, h;
  float dx, dy;
  Balle() {
    x = width/2;
    y = height/2;
    w = 5;
    h = 5;
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
    if (x>=r2.x && y > r2.y && y< r2.y+r2.largeur) {
      dx = -dx;
      dy = -dy;
    }
    if (x>r2.x+r2.longueur) {
      c.joueur++;
      x = width/2;
      y = height/2;
    }
    if (x<r1.x){
      c.ord++;
      x = width/2;
      y = height/2;
    }
    dessiner();
  }
  void augmenter_vitesse() {
    float augm = 1.2;
    dx = dx * augm;
    dy = dy * augm;
  }
}

class Raquette {
  int x, y, dy, longueur, largeur;
  Raquette(int nx, int ny) {
    x = nx;
    y = ny;
    dy = 5;
    longueur = 5;
    largeur = 100;
  }
  void dessiner() {
    rect(x, y, longueur, largeur);
  }
  void up_move() {
    if (y+largeur < height) {
      y+= dy;
    } else {
      y = 10;
    }
  }
  void down_move() {
    if (y > 0) {
      y-=dy;
    } else {
      y = height-largeur-10;
    }
  }
  void changey_mouse() {
    y = mouseY;
    dessiner();
  }
}

class Compteur {
  int ord, joueur;
  Compteur() {
    ord = 0;
    joueur = 0;
  }
  void dessiner() {
    rect(width/2-100, 0, 200, 50);
    fill(255);
    text(joueur, width/2-60, 42);
    text(ord, width/2+40, 42);
    PFont police = loadFont("Arial-BoldMT-48.vlw");
    textFont(police, 48);
  }
}


Balle balle = new Balle();
Raquette r1 = new Raquette(20, 300);
Raquette r2 = new Raquette(1500, 300);
Compteur c = new Compteur();

void draw() {
  background(0);
  c.dessiner();
  noFill();
  ellipse(width/2, height/2, 500, 500);

  line(width/2, 0, width/2, height);
  balle.bouger();
  r1.changey_mouse();
  if (balle.dy>0 && r2.y>balle.y) {
    r2.up_move();
  } else if (balle.dy<0 && r2.y<balle.y) {
    r2.down_move();
  } else {
    r2.up_move();
  }
  r2.dessiner();
}
