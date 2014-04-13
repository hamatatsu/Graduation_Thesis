// Tatsuya Hamada's graduation thesis.

class Object {
  char name;
  int type;
  String data;
  int tchk;
  Object (char pname, int ptype, String pdata, int ptchk) {
    name = pname;
    type = ptype;
    data = pdata;
    tchk = ptchk;
  }
  char name() {
    return name;
  }
  String type() {
    return objectNameString[type];
  }
  String data() {
    return data;
  }
  int tchk() {
    return tchk;
  }
  void d_add(int px, int py) {
    switch(type) {
    case 0:
      data = str(px) + " " + str(py);
    }
    tchk = 0;
  }
  void search() {
    String[] token = splitTokens(data);
    switch(type) {
    case 0:
      if (dist(float(tx), float(ty), int(token[0]), int(token[1])) <= 5) {
        tchk = 1;
      }
    }
  }
  void display() {
    String[] token = splitTokens(data);
    switch(type) {
    case 0:
      point(int(token[0]), int(token[1]));
    }
  }
}

