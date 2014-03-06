int tx, ty;
int count = 65;
ArrayList<Object> objects = new ArrayList<Object>();

char point = 'a';

void setup() {
  size(1000, 500);
  background(255);
  stroke(0);
  strokeWeight(5);
}

void draw() {
  background(255);
  for (int i = 0; i < objects.size(); i++) {
    objects.get(i).display();
  }
  if (objects.size()!=0) {
//    println(objects.get(0).name(), objects.get(0).type(), objects.get(0).data());
  }
}

void mouseDragged() {
  tx=mouseX;
  ty=mouseY;
  for (int i = 0; i < objects.size(); i++) {
    if (objects.get(i).tchk() == 1) {
      objects.get(i).c_add(str(tx) + " " + str(ty));
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < objects.size(); i++) {
    objects.get(i).t_add(0);
  }
}

void mousePressed() {
  tx=mouseX;
  ty=mouseY;
  if (keyPressed) {
    if (key == point) {
      objects.add(new Object(char(count), point, str(tx) + " " + str(ty), 0));
    }
  }
  else {
    for (int i = 0; i < objects.size(); i++) {
      objects.get(i).search();
    }
  }
}

