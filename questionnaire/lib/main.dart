import 'package:flutter/material.dart';
import 'modules/quiz/quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Questionnaire',
      home: new Quiz(),
    );
  }
}