import 'package:flutter/material.dart';
import 'package:mbti_test/questionPage/questions.dart';

class startPage extends StatelessWidget {
  const startPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: '당신의 ',style: TextStyle(color: Colors.black)),
                  TextSpan(text: 'MBTI', style: TextStyle(color: Colors.blue)),
                  TextSpan(text: '는?',style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              '내 엠비티아이는 뭘까?\n간단한 테스트를 통해 알아보자!',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 36,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.black,
                    fixedSize: Size(360, 66)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => QuestionPage())));
                },
                child: Text(
                  '시작하기',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }
}
