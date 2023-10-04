import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mbti_test/data/mbtijsonparser.dart';
import 'package:mbti_test/data/mbtiscore.dart';
import 'package:mbti_test/resultPage/widget.dart';
import 'package:mbti_test/startPage/startPage.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({ super.key, required this.mbtiName, required this.mbti, required this.score});

  final String mbtiName;
  final Mbti mbti;
  final Mbtiscore score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.blue[600],
          body: Container(
              margin: const EdgeInsets.only(top: 100),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                borderRadius:
                BorderRadius.vertical(top: Radius.elliptical(200, 100)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Text('내 결과는?'),
                        SizedBox(height: 30),
                        Text(
                          mbti.title!,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          mbtiName,
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    child: Column(
                      children: [
                        //SvgPicture.string(mbti.imooji!),
                        Icon(Icons.face_3, size: 160),
                        SizedBox(height: 50),
                        Text(mbti.content!,textAlign: TextAlign.center,),
                        Text(mbti.strength!,textAlign: TextAlign.center,),
                        Text(mbti.weaksol!,textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    child: (ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => startPage()));
                      },
                      child: const Text('다시 테스트하기'),
                    )),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    child: Column(children: [
                      Text('당신은 ${score.getEtc().toString()} 결과일 수 있어요'),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ResultButton(score:score)));
                        },
                        child: const Text('다른 결과도 보러가기'),
                      ),
                    ]),
                  ),
                ],
              )),
    );
  }
}
