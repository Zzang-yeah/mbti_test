import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbti_test/resultPage/resultpage.dart';
import 'package:mbti_test/data/mbtijsonparser.dart';
import 'package:mbti_test/data/mbtiscore.dart';


class ResultButton extends StatelessWidget {
  final AsyncMemoizer uibefore = AsyncMemoizer();
  MbtiTest mbtijson = MbtiTest();
  final Mbtiscore score;

  ResultButton({ super.key, required this.score});

  List<String> mbtiList = [
    'ENFJ',
    'ENTJ',
    'ENFP',
    'ENTP',
    'ESTP',
    'ESFP',
    'ESTJ',
    'ESFJ',
    'INFJ',
    'INFP',
    'INTJ',
    'INTP',
    'ISFJ',
    'ISFP',
    'ISTJ',
    'ISTP'
  ];

  Future<dynamic> beforeui() {
    //Mbti.json파일을 불러오기
    return this.uibefore.runOnce(() async {
      //then : 해당 함수가 종료가 되었을 때 매개변수로 들어온 함수를 실행
      return await rootBundle.loadString('assets/mbti.json').then((value) {
        mbtijson = MbtiTest.fromJson(value);
        return "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: beforeui(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
          //로딩중일때
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Spacer();
            default:
              return SafeArea(
                child: Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '다른 mbti 결과를\n확인해보시겠어요?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: mbtiList.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 20.0, // 주축(수직) 간격
                              crossAxisSpacing: 16.0, // 교차축(수평) 간격
                              childAspectRatio: 2 / 1, // 각 그리드 아이템의 가로 세로 비율
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return ElevatedButton(
                                onPressed: () {
                                  Mbti clickedString = mbtijson
                                      .mbtis![mbtiList[index]]!;
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          ResultPage(mbtiName: mbtiList[index],mbti: clickedString,
                                              score: score)));
                                },
                                style:
                                ElevatedButton.styleFrom(
                                    minimumSize: Size(100, 50)),
                                child: Text(mbtiList[index]),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );
          }
        }
    );
  }
}
