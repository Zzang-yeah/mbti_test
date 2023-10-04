import 'dart:convert';

class Question {
  String? question;
  String? answerA;
  String? answerB;
  String? emooji;

  Question({
    this.question,
    this.answerA,
    this.answerB,
    this.emooji,
});

  factory Question.fromJson(Map<String, dynamic>json)=>Question(
    question: json["question"],
    answerA: json["answerA"],
    answerB: json["answerB"],
    emooji: json["emooji"],
  );

  String getQuestion(){
    //?? : 앞의 변수가 null일 경우 뒤의 것으로 대체한다
     return question??"";
  }
  String getAnswerA(){
    return answerA??"";
  }
  String getAnswerB(){
    return answerB??"";
  }
  String getEmooji(){
    return emooji??"";
  }
}

class Mbti{
  String? title;
  String? content;
  String? strength;
  String? weaksol;
  String? imooji;

  Mbti({
    this.title,
    this.content,
    this.strength,
    this.weaksol,
    this.imooji,
});

  factory Mbti.fromJson(Map<String,dynamic>json)=>Mbti(
    title: json["title"],
    content: json["content"],
    strength: json["strength"],
    weaksol: json['weaksol'],
    imooji: json['imooji'],
  );
}

//1~70번까지, mbti 16가지 전부 불러오기
class MbtiTest {
  //questions:list[Question(1번부터 70번까지 넣을 예정)]
  List<Question>? questions;
  //mbtis:dict[String,Mbti(16가지 타입 넣을 예정)]
  Map<String, Mbti>? mbtis;
  //MbtiTest 클래스는 questions,mbtis라는 변수를 갖는다
  //==MbtiTest({List<Question>,Map<String,Mbti>})
  MbtiTest({this.questions, this.mbtis});

  //factory==static 유사
  factory MbtiTest.fromJson(String jsonString){
    //Question형태의 리스트가 questions로 초기화해줬다!
    List<Question> questions=<Question>[];
    //<String,Mbti>형태의 딕셔너리가 mbtis라는 변수로 초기화해줬다!
    Map<String, Mbti> mbtis= <String,Mbti>{};
    //mbti.json의 q,MBTI를 받아옴
    Map<String, dynamic> jsonmap = Map.castFrom(json.decode(jsonString));

    Map<String,dynamic> questionmap = jsonmap['q'];
    for (int i=1;i<=70;i++) {
      questions.add(Question.fromJson(questionmap[i.toString()]));
    }
    Map<String,dynamic> mbtimap = jsonmap['MBTI'];
    mbtimap.forEach((key, value) {
      mbtis[key]=Mbti.fromJson(value);
    });

    return MbtiTest(questions: questions, mbtis: mbtis);
  }
}