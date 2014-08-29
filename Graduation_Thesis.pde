// Tatsuya Hamada's graduation thesis.

ArrayList<Object> objects = new ArrayList<Object>();
int count = 0;
int tx;
int ty;
boolean tchk = true;
boolean dchk = true;

int i;
int i2;
int pkeyn;  
String datas;
Object newObject;

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
  } else {
    if (keyPressed && (objects.get(0).data() != "-1 -1")) {
      switch(objects.get(0).type()) {
      case 0:
        newObject = new Object(count + 1, objects.get(0).type(), objects.get(0).data(), 0);
        break;
      case 1:
      println(tchk);
        tchk = true;
        dchk = false;
        newObject = new Object(count + 1, objects.get(0).type(), search(objects.get(0).pointX(), objects.get(0).pointY()) + " " + objects.get(0).datas(2), 0);
        dchk = true;
        break;
      }
      objects.add(count + 1, newObject);
      count++;
    }
    for (i = 1; i < objects.size (); i++) {
      if (objects.get(i).chk() == 1) {
        objects.get(i).d_add(objects.get(0).pointX(), objects.get(0).pointY());
        tchk = true;
      }
    }
    Object newObject = new Object(0, 0, "-1 -1", 0);
    objects.set(0, newObject);
  }
  if (objects.size() > 0) {
    for (i = 0; i < objects.size (); i++) {
//      println(i, objects.get(i).name(), objectNameString[objects.get(i).type()], objects.get(i).data());
    }
  }
  display();
}
void mousePushed() {
  boolean chk = false;
  if (keyPressed) {
    char pkey = key;
    for (i = 0; i < 3; i++) {
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
        datas  = str(tx) + " " + str(ty) + " " + str(search(tx, ty));
//        println(search(tx, ty));
        tchk = false;
        break;
      }
      if (chk) {
        objects.set(0, new Object(0, pkeyn, datas, 0));
      }
    }
    chk = false;
  } else {
    search(tx, ty);
  }
}
int search(int px, int py) {
  for (i = 1; i < objects.size (); i++) {
    if (tchk) {
      int[] token = int(splitTokens(objects.get(i).data()));
      switch(objects.get(i).type()) {
      case 0:
        if (dist(float(px), float(py), token[0], token[1]) <= 5) {
          if (dchk) {
            objects.get(i).chkSwit(1);
          }
          tchk = false;
          i2 = i;
          i = objects.size();
        }
        break;
      }
    }
  }
    println(i2);
  return i2;
}
void display() {
  for (i = 0; i < objects.size (); i++) {
    int[] token = int(splitTokens(objects.get(i).data()));
    switch(objects.get(i).type()) {
    case 0:
      strokeWeight(5);
      point(token[0], token[1]);
      break;
    case 1:
      strokeWeight(2);
      if (token.length == 3) {
        int endX = objects.get(token[2]).pointX();
        int endY = objects.get(token[2]).pointY();
        line(token[0], token[1], endX, endY);
        //      token[0]--;
        //      int startX = objects.get(token[0]).pointX();
        //      int startY = objects.get(token[0]).pointY();
        //      int endX = objects.get(token[1]).pointX();
        //      int endY = objects.get(token[1]).pointY();
        //      float a = (startY - endY) / (startX - endX);
        //      float b = startY - startX * a;
        //      line(-500, -500 * a + b, 500, 500 * a + b);
        break;
      } else {
        int startX = objects.get(token[0]).pointX();
        int startY = objects.get(token[0]).pointY();
        int endX = objects.get(token[1]).pointX();
        int endY = objects.get(token[1]).pointY();
        line(startX, startY, endX, endY);
      }
    }
  }
}

