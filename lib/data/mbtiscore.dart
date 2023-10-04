class Mbtiscore {
  int scoreE=0;
  int scoreI=0;

  int scoreS=0;
  int scoreN=0;

  int scoreT=0;
  int scoreF=0;

  int scoreJ=0;
  int scoreP=0;

  String getMbti(){
    String result="";
    result+= scoreE>=scoreI?"E":"I";
    result+= scoreS>=scoreN?"S":"N";
    result+= scoreT>=scoreF?"T":"F";
    result+= scoreJ>=scoreP?"J":"P";
    return result;
  }

  String getEtc(){
    //todo 트리방식사용해라~
    String result="";
    return result;
  }
}