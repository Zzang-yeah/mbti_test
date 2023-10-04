import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbti_test/data/mbtijsonparser.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mbti_test/data/mbtiscore.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() =>
      _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {

  final AsyncMemoizer uibefore = AsyncMemoizer();
  Mbtiscore mbtiscore = Mbtiscore();
  MbtiTest mbtijson = MbtiTest();
  double index = 0;
  int maxindex = 1;

  Future<dynamic> beforeui(){
    //Mbti.json파일을 불러오기
    return this.uibefore.runOnce(() async{
      //then : 해당 함수가 종료가 되었을 때 매개변수로 들어온 함수를 실행
      return await rootBundle.loadString('assets/mbti.json').then((value) {
        mbtijson = MbtiTest.fromJson(value);
        maxindex = mbtijson.questions!.length;
        return "";
      });
    });
  }

  //async:비동기로 해당 함수를 실행하겠다(함수 내부는 동기적)

  // Widget strtosvg(){
  //   String? svgData = mbtijson.questions?[index.toInt()].emooji;
  //   if (svgData != null) {
  //     return SvgPicture.string(svgData);
  //   } else {
  //     print("에러");
  //     return Spacer();
  //   }
  // }

  void Submit(){
    if ((index+1)==maxindex){
      Navigator.of(context).push(
          MaterialPageRoute(builder:
              (context){
            //resultpage의 생성자에 매개변수로 mbti class를 받음
            //mbtiTest.mbtis[mainmbti]=>MBTI클래스+mbtiscore(mainmbti+etcmbti)
            Mbti mainMbti = mbtijson.mbtis![mbtiscore.getMbti()]!;
            //todo 설명하기+밑의 주석 풀기
            return resultpage(mainMbti,mbtiscore);
          })
      );
    }
    else{
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      FutureBuilder(
          future: beforeui(),
          builder: (context,snapshot){
            switch (snapshot.connectionState){
              //로딩중일때
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Spacer();
              default:
                return Padding(padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        //프로그레스 바
                        LinearProgressIndicator(
                          value: (index+1)/maxindex,
                          backgroundColor : Colors.grey,
                          valueColor : new AlwaysStoppedAnimation<Color> (Colors.blueAccent),
                          semanticsLabel: 'Linear progress indicator',
                        ),
                        Text("<${index+1}/$maxindex>",
                            style: TextStyle(color:Colors.black)),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.string(mbtijson.questions![index.toInt()].getEmooji()),
                        Text(mbtijson.questions![index.toInt()].getQuestion(),
                            style: TextStyle(color:Colors.black)),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(onPressed: (){
                          int mod=(index.toInt()+1)%7;
                          if (mod==1){
                            mbtiscore.scoreE++;
                          }
                          else if (mod==2 || mod==3){
                            mbtiscore.scoreS++;
                          }
                          else if (mod==4 || mod==5){
                            mbtiscore.scoreT++;
                          }
                          else{
                            mbtiscore.scoreJ++;
                          }
                          Submit();
                        },
                          child:Text(mbtijson.questions![index.toInt()].getAnswerA()),
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.blueAccent,
                          ),
                        ),
                        ElevatedButton(onPressed: (){
                          int mod=(index.toInt()+1)%7;
                          if (mod==1){
                            mbtiscore.scoreI++;
                          }
                          else if (mod==2 || mod==3){
                            mbtiscore.scoreN++;
                          }
                          else if (mod==4 || mod==5){
                            mbtiscore.scoreF++;
                          }
                          else{
                            mbtiscore.scoreP++;
                          }
                          Submit();
                        },
                          child:Text(mbtijson.questions![index.toInt()].getAnswerB()),
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.blueAccent,
                          ),
                        ),
                      ],
                    )
                  ],
                )
                );
            }
      });
  }
}

