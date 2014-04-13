// Tatsuya Hamada's graduation thesis.

ArrayList<Object> objects = new ArrayList<Object>();
int count = 0;
String datas;
int tx;
int ty;
int pkeyn;

String[] objectNameString = {
  "point", "line"
};
char[] objectName = {
  'a', 's'
};

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
    for (int i = 0; i < objects.size(); i++) {
      println(objects.get(i).name(), objects.get(i).type(), objects.get(i).data());
    }
  }
}
//
//void mouseDragged() {
//  int tx = mouseX;
//  int ty = mouseY;
//  int px, py;
//  for (int i = 0; i < objects.size(); i++) {
//    if (objects.get(i).tchk() == 1) {
//      objects.get(i).d_add(str(tx) + "," + str(ty));
//    }
//  }
//}
//
void mouseReleased() {
  tx = mouseX;
  ty = mouseY;
  for (int i = 0; i < objects.size(); i++) {
    if (objects.get(i).tchk() == 1) {
      objects.get(i).d_add(tx, ty);
    }
  }
}

void mousePressed() {
  tx = mouseX;
  ty = mouseY;
  boolean chk = false;
  if (keyPressed) {
    char pkey = key;
    for (int i = 0; i < 2; i++) {
      if (objectName[i] == pkey) {
        pkeyn = i;
        chk = true;
      }
    }
    if (chk) {
      Object newObject = new Object(char(count + 65), pkeyn, str(tx) + " " + str(ty), 0);
      objects.add(count, newObject);
      count++;
    }
    chk = false;
  }
  else {
    for (int i = 0; i < objects.size(); i++) {
      objects.get(i).search();
    }
  }
}

