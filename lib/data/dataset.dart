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
    question: json["qustion"],
    answerA: json["answerA"],
    answerB: json["answerB"],
    emooji: json["emooji"],
  );
}

class Mbti{
  String? title;
  String? content;
  String? strength;
  String? wealsol;
  String? imooji;

  Mbti({
    this.title,
    this.content,
    this.strength,
    this.wealsol,
    this.imooji,
});

  factory Mbti.fromJson(Map<String,dynamic>json)=>Mbti(
    title: json["title"],
    content: json["content"],
    strength: json["strength"],
    wealsol: json['weeksol'],
    imooji: json['imooji'],
  );
}

class MbtiTest {
  final List<Question>? questions;
  final Map<String, Mbti>? mbtis;
  MbtiTest({this.questions, this.mbtis});

  factory MbtiTest.fromJson(String jsonString){
    List<Question>? questions;
    final Map<String, Mbti>? mbtis;
    //mbti.json의 q,MBTI를 받아옴
    Map<String, dynamic> jsonmap = Map.castFrom(json.decode(jsonString));

    Map<String,dynamic> questionmap = jsonmap['q'];
    for (int i=1;i<=70;i++) {
      Question.fromJson(questionmap[i.toString()])
    }
    jsonmap['MBTI']
  }
}