// Tatsuya Hamada's graduation thesis.

ArrayList<Object> objects = new ArrayList<Object>();
int count = 0;
int tx;
int ty;
boolean tchk = true;

int i;
int i2;
int pkeyn;  
String datas;
Object newObject;

String[] objectNameString = {
  "point", "segmenta", "circle"
};
char[] objectName = {
  'a', 's', 'd'
};

void setup() {
  size(1000, 500);
  background(255);
  stroke(0);
  fill(0, 0);
  strokeWeight(5);
  ellipseMode(CENTER);
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
        tchk = true;
        newObject = new Object(count + 1, objects.get(0).type(), search(objects.get(0).datas(0), objects.get(0).datas(1)) + " " + objects.get(0).datas(2), 0);
        tchk = true;
        break;
      case 2:
        tchk = true;
        newObject = new Object(count + 1, objects.get(0).type(), search(objects.get(0).datas(0), objects.get(0).datas(1)) + " " + objects.get(0).datas(2), 0);
        tchk = true;
        break;
      }
      objects.add(count + 1, newObject);
      count++;
      for (i = 1; i < objects.size (); i++) {
        objects.get(i).checkSwitch(0);
      }
    } else {
      for (i = 1; i < objects.size (); i++) {
        if (objects.get(i).chk() == 1) {
          objects.get(i).d_add(objects.get(0).datas(0), objects.get(0).datas(1));
          tchk = true;
        }
        if (objects.get(i).type() != 0) {
          datas = objects.get(i).data();
          datas = datas.replaceAll("0", str(i2));
          objects.set(i, new Object(i, objects.get(i).type(), datas, 0));
        }
      }
    }
    Object newObject = new Object(0, 0, "-1 -1", 0);
    objects.set(0, newObject);
  }
  if (objects.size() > 0) {
    for (i = 0; i < objects.size (); i++) {
      println(i, objects.get(i).name(), objectNameString[objects.get(i).type()], objects.get(i).data());
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
        tchk = false;
        break;
      case 2:
        datas  = str(tx) + " " + str(ty) + " " + str(search(tx, ty));
        tchk = false;
        break;
      }
      if (chk) {
        objects.set(0, new Object(0, pkeyn, datas, 0));
      }
    }
    chk = false;
  } else {
    i2 = search(tx, ty);
    for (i = 0; i < objects.size (); i++) {
      if (objects.get(i).type() != 0) {
        datas = objects.get(i).data();
        datas = datas.replaceAll(str(i2), "0");
        objects.set(i, new Object(i, objects.get(i).type(), datas, 0));
      }
    }
  }
}
int search(int px, int py) {
  for (i = 1; i < objects.size (); i++) {
    if (tchk) {
      int[] token = int(splitTokens(objects.get(i).data()));
      switch(objects.get(i).type()) {
      case 0:
        if (dist(float(px), float(py), token[0], token[1]) <= 5) {
          objects.get(i).checkSwitch(1);
          tchk = false;
          i2 = i;
          i = objects.size();
        }
        break;
      }
    }
  }
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
        int endX = objects.get(token[2]).datas(0);
        int endY = objects.get(token[2]).datas(1);
        line(token[0], token[1], endX, endY);
        //      token[0]--;
        //      int startX = objects.get(token[0]).pointX();
        //      int startY = objects.get(token[0]).pointY();
        //      int endX = objects.get(token[1]).pointX();
        //      int endY = objects.get(token[1]).pointY();
        //      float a = (startY - endY) / (startX - endX);
        //      float b = startY - startX * a;
        //      line(-500, -500 * a + b, 500, 500 * a + b);
      } else {
        int startX = objects.get(token[0]).datas(0);
        int startY = objects.get(token[0]).datas(1);
        int endX = objects.get(token[1]).datas(0);
        int endY = objects.get(token[1]).datas(1);
        line(startX, startY, endX, endY);
      }
      break;
    case 2:
      strokeWeight(2);
      if (token.length == 3) {
        int centerX = objects.get(token[2]).datas(0);
        int centerY = objects.get(token[2]).datas(1);
        float r = dist(centerX, centerY, token[0], token[1]) * 2;
        ellipse(centerX, centerY, r, r);
        //      token[0]--;
        //      int startX = objects.get(token[0]).pointX();
        //      int startY = objects.get(token[0]).pointY();
        //      int endX = objects.get(token[1]).pointX();
        //      int endY = objects.get(token[1]).pointY();
        //      float a = (startY - endY) / (startX - endX);
        //      float b = startY - startX * a;
        //      line(-500, -500 * a + b, 500, 500 * a + b);
      } else {
        int edgeX = objects.get(token[0]).datas(0);
        int edgeY = objects.get(token[0]).datas(1);
        int centerX = objects.get(token[1]).datas(0);
        int centerY = objects.get(token[1]).datas(1);
        float r = dist(centerX, centerY, edgeX, edgeY) * 2;
        ellipse(centerX, centerY, r, r);
      }
      break;
    }
  }
}

