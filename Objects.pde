class Object {
  int tchk;
  char name, type;
  String data;
  Object (char n, char t, String idata, int chk) {
    name = n;
    type = t;
    data = idata;
    tchk = chk;
  }
  char name() {
    return name;
  }
  char type() {
    return type;
  }
  String data() {
    return data;
  }
  int tchk() {
    return tchk;
  }
  void t_add(int t) {
    tchk = t;
  }
  void c_add(String idata) {
    data = idata;
  }
  void search() {
    String[] o = splitTokens(data);
    if (type == point) {
      if (dist(float(tx), float(ty), int(o[0]), int(o[1])) <= 5) {
        tchk = 1;
      }
    }
  }
  void display() {
    String[] o = splitTokens(data);
    if (type == point) {
      point(int(o[0]), int(o[1]));
    }
  }
}

