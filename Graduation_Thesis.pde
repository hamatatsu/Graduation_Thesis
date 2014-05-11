// Tatsuya Hamada's graduation thesis.

ArrayList<Object> objects = new ArrayList<Object>();
int count = 0;
int tx;
int ty;
boolean tchk;
int pkeyn;
String datas;

String[] objectNameString = {
  "point", "line", "circle"
};
char[] objectName = {
  'a', 's', 'd'
};

void setup() {
  size(1000, 500);
  background(255);
  stroke(0);
  strokeWeight(5);
  Object newObject = new Object(0, 0, "-1 -1", 0);
  objects.add(0, newObject);
}

void draw() {
  background(255);
  tx = mouseX;
  ty = mouseY;
  if (mousePressed) {
    objects.get(0).d_add(tx, ty);
    mousePushed();
  } 
  else {
    if (keyPressed && (objects.get(0).data() != "-1 -1")) {
      println(tchk);
      Object newObject = new Object(count + 1, objects.get(0).type(), objects.get(0).data(), 0);
      println(newObject);
      objects.add(count + 1, newObject);
      count++;
    }
    for (int i = 1; i < objects.size(); i++) {
      if (objects.get(i).chk() == 1) {
        objects.get(i).d_add(objects.get(0).pointX(), objects.get(0).pointY());
      }
    }

    Object newObject = new Object(0, 0, "-1 -1", 0);
    objects.set(0, newObject);
  }
  if (objects.size() > 0) {
    for (int i = 0; i < objects.size(); i++) {
      println(objects.get(i).name(), objectNameString[objects.get(i).type()], objects.get(i).data());
    }
    println();
  }
  display();
}

void mousePressed() {
  tx = mouseX;
  ty = mouseY;
  tchk = true;
  println("on");
}

void mouseReleased() {
  tx = mouseX;
  ty = mouseY;
  tchk = false;
  println("off");
}

void mousePushed() {
  boolean chk = false;
  if (keyPressed) {
    char pkey = key;
    for (int i = 0; i < 3; i++) {
      if (objectName[i] == pkey) {
        pkeyn = i;
        chk = true;
      }
    }
    if (chk) {
      switch(pkeyn) {
      case 0:
        datas = str(tx) + " " + str(ty);
        break;
      case 1:
        datas  = str(search(tx, ty)) + " " + str(0);
        break;
      }
      Object newObject = new Object(0, pkeyn, datas, 0);
      objects.set(0, newObject);
    }
    chk = false;
  }
  else {
    search(tx, ty);
  }
}
int search(int px, int py) {
  int i;
  for (i = 1; i < objects.size(); i++) {
    String[] token = splitTokens(objects.get(i).data());
    switch(objects.get(i).type()) {
    case 0:
      if (dist(float(px), float(py), int(token[0]), int(token[1])) <= 5) {
        objects.get(i).chkSwit(1);
      }
      break;
    }
  }
  return i;
}
void display() {
  for (int i = 0; i < objects.size(); i++) {
    int[] token = int(splitTokens(objects.get(i).data()));
    switch(objects.get(i).type()) {
    case 0:
      point(int(token[0]), int(token[1]));
      break;
    case 1:
      token[0]--;
      int startX = objects.get(token[0]).pointX();
      int startY = objects.get(token[0]).pointY();
      int endX = objects.get(token[1]).pointX();
      int endY = objects.get(token[1]).pointY();
      float a = (startY - endY) / (startX - endX);
      float b = startY - startX * a;
      line(-500, -500 * a + b, 500, 500 * a + b);
      break;
    }
  }
}

