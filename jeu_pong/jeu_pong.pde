class Balle {
  float x, y, w, h;
  float dx, dy;
  Balle() {
    w = 5;
    h = 5;
    dx = 2;
    dy = 2;
  }
  void set(float nx, float ny) {
    x = nx;
    y = ny;
  }
  void dessiner() {
    ellipse(x, y, w, h);
  }
  void bouger() {
    x+=dx;
    y+=dy;
    int vitesse_max = 5;
    if (x >= width-w-dx || x<=w*2+dx) {
      if (dx < vitesse_max) {
        dx=-(dx*random(0.5, 2));
      } else {
        dx =- dx/dx;
      }
    }
    if (y >= height-w|| y<=0) {
      if (dy < vitesse_max) {
        dy=-(dy*random(0.5, 2));
      } else {
        dy = -dy/dy;
      }
    }
    if (x<=r1.x+r1.longueur+w && y >=r1.y && y<= r1.y+r1.largeur) {
      if (dx< vitesse_max) {
        dx = -(dx*random(0.5, 2));
      } else {
        dx =- dx/dx;
      }
      if (dy < vitesse_max) {
        dy = -(dy*random(0.5, 2));
      } else {
        dy = -dy/dy;
      }
    }
    if (x>=r2.x-w-dx && y >= r2.y && y<=r2.y+r2.largeur) {
      if (dx< vitesse_max) {
        dx = -(dx*random(0.5, 2));
      } else {
        dx =- dx/dx;
      }
      if (dy < vitesse_max) {
        dy = -(dy*random(0.5, 2));
      } else {
        dy = -dy/dy;
      }
    }
    //ajout des points
    if (x>r2.x+r2.longueur) {
      c.joueur++;
      x = width/2;
      y = height/2;
    }
    if (x<r1.x) {
      c.ord++;
      x = width/2;
      y = height/2;
    }
    dessiner();
  }
}


class Raquette {
  float x, y, dy, longueur, largeur;
  Raquette() {
    dy = 5;
    longueur = 5;
    largeur = 100;
  }
  void set(float nx, float ny) {
    x = nx;
    y = ny;
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
Raquette r1 = new Raquette();
Raquette r2 = new Raquette();
Compteur c = new Compteur();
void setup() {
  fullScreen();
  background(0);
  stroke(255);
  strokeWeight(5);
  smooth();
  balle.set(width/2, height/2);
  r1.set(20, 300);
  r2.set(width -20, 300);
}

void draw() {
  background(0);
  c.dessiner();
  noFill();
  ellipse(width/2, height/2, 500, 500);
  line(width/2, 0, width/2, height);
  //balle.dessiner();
  balle.bouger();
  //a revoir (reaction de l'ordinateur face à la balle)
  /*
  r1.changey_mouse();
   if (balle.dy>0 && r2.y>balle.y) {
   r2.up_move();
   } else if (balle.dy<0 && r2.y<balle.y) {
   r2.down_move();
   } else {
   r2.up_move();
   }
   r2.dessiner();
   */
  if (keyPressed) {
    if (key == 'z') {
      r1.down_move();
    }
    if (key == 's') {
      r1.up_move();
    }
    if (key == 'p') {
      r2.down_move();
    }
    if (key == 'm') {
      r2.up_move();
    }
  }
  /*
  if (key == CODED) {
   if (keyCode==UP) {
   r2.down_move();
   }
   if (keyCode==DOWN) {
   r2.up_move();
   }*/
  r1.dessiner();
  r2.dessiner();
  //}
}
