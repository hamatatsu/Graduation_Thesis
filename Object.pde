class Object {
  int name;
  int type;
  String data;
  int chk;
  Object (int pname, int ptype, String pdata, int pchk) {
    name = pname;
    type = ptype;
    data = pdata;
    chk = pchk;
  }
  int name() {
    return name;
  }
  int type() {
    return type;
  }
  String data() {
    return data;
  }
  int chk() {
    return chk;
  }
  int datas(int pdatas) {
    int[] token = int(splitTokens(data));
    return token[pdatas];
  }
  void checkSwitch(int sw) {
    chk = sw;
  }
  void d_add(int px, int py) {
    data = str(px) + " " + str(py);
    chk = 0;
  }
}

