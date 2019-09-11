import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire/blocks/Quests/questsBlock.dart';
import 'package:questionnaire/modules/quiz/widgets/QuestButtonFootter.dart';
import 'package:questionnaire/modules/quiz/widgets/QuestsWidget.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final QuestsBlock _questBloc = QuestsBlock();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: new Scaffold(
        backgroundColor: Colors.white,
          body: new Column(children: <Widget>[
        new Expanded(child: QuestsWidget()),
        new QuestButtonFootter()
      ])),
      builder: (BuildContext context) => _questBloc,
    );
  }

  @override
  void dispose() {
    _questBloc.dispose();
    super.dispose();
  }
}
