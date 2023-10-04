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

  List<String> getEtc(){
    //todo 트리방식사용해라~
    List<String> result=[];
    generatePermutations([["E","I"],["S","N"],["T","F"],["J","P"]], [[scoreE,scoreI],[scoreS,scoreN],[scoreT,scoreF],[scoreJ,scoreP]],result, 0, "");
    return result;
  }

  void generatePermutations(List<List<String>> lists,List<List<int>> scorelists, List<String> result, int depth, String current) {
    if (depth == lists.length) {
      result.add(current);
      return;
    }
    if (scorelists[depth][0]==scorelists[depth][1]) {
      for (int i = 0; i < lists[depth].length; i++) {
        generatePermutations(lists, scorelists, result, depth + 1, current + lists[depth][i]);
      }
    }
    else if(scorelists[depth][0]>scorelists[depth][1]){
      generatePermutations(lists, scorelists, result, depth + 1, current + lists[depth][0]);
    }
    else{
      generatePermutations(lists, scorelists, result, depth + 1, current + lists[depth][1]);
    }
  }
}