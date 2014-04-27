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
}

void draw() {
  background(255);
  if (tchk) {
    mousePushed();
  } 
  else {   
    tx = mouseX;
    ty = mouseY;
    for (int i = 0; i < objects.size(); i++) {
      if (objects.get(i).chk() == 1) {
        objects.get(i).d_add(tx, ty);
      }
    }
  }
  display();
  if (objects.size()!=0) {
    for (int i = 0; i < objects.size(); i++) {
      println(objects.get(i).name(), objectNameString[objects.get(i).type()], objects.get(i).data());
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
    for (int i = 0; i < 2; i++) {
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
        int ix = tx;
        int iy = ty;
        while (mousePressed == true) {
          
        }
        datas  = str(search(tx, ty)) + " " + str(search(ix, iy));
        break;
      }
      Object newObject = new Object(count, pkeyn, datas, 0);
      objects.add(count, newObject);
      count++;
    }
    chk = false;
  }
  else {
    search(tx, ty);
  }
}
int search(int px, int py) {
  int i;
  for (i = 0;i < objects.size(); i++) {
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

