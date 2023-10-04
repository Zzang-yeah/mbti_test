import 'package:flutter/material.dart';
import 'package:mbti_test/data/mbtijsonparser.dart';
import 'package:mbti_test/data/mbtiscore.dart';

class resultpage extends StatelessWidget {
  const resultpage({@required mainMbti, @required mbtiscore, super.key});

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
                    child: const Column(
                      children: [
                        SizedBox(height: 30),
                        Text('내 결과는?'),
                        SizedBox(height: 30),
                        Text(
                          '결과 간단 설명',
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          'MBTI',
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    child: const Column(
                      children: [
                        Icon(Icons.face_3, size: 160),
                        SizedBox(height: 50),
                        Text('결과 설명'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    child: (ElevatedButton(
                      onPressed: () {},
                      child: const Text('다시 테스트하기'),
                    )),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    child: Column(children: [
                      const Text('당신은 이런 결과일 수 있어요'),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('다른 결과도 보러가기'),
                      ),
                    ]),
                  ),
                ],
              ))),
    );
  }
}
