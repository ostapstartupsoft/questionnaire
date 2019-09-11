import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire/blocks/Quests/Events/QuestsEvents.dart';
import 'package:questionnaire/blocks/Quests/States/QuestsStates.dart';
import 'package:questionnaire/blocks/Quests/questsBlock.dart';
import 'package:questionnaire/models/Quest.dart';
import 'package:questionnaire/modules/quiz/widgets/QuizCardWidget.dart';

class QuestsWidget extends StatefulWidget {

  @override
  _QuestsWidgetState createState() => _QuestsWidgetState();
}

class _QuestsWidgetState extends State<QuestsWidget> {

  QuestListView questsList;

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new BlocBuilder(
            bloc: BlocProvider.of<QuestsBlock>(context),
            builder: (context, QuestsBlockState state) {
              if (state is QuestsEmptyState) {
                BlocProvider.of<QuestsBlock>(context)
                    .dispatch(QuestsFetchAllEvent());
                return new Container(color: Colors.orange[50]);
              }
              if (state is QuestsPreNextState) {
                if (questsList != null) {
                   BlocProvider.of<QuestsBlock>(context).dispatch(QuestsOptionsEvent(questsList.questionsMap));
                }
              }

              if (state is QuestsLoadingState) {}

              if (state is QuestsFishedState) {
                return new Container(child: new Center(child: new Text("Quiz is over")));
              }

              if (state is QuestsLoadedState) {
                final quest = state.quests[state.currentQuest];
                questsList = new QuestListView(quest: quest);
                
                return questsList;
              }

              return new Container(color: Colors.white);
            }));
  }
}

class QuestListView extends StatefulWidget {
  final Quest quest;

  var questionsMap = new Map();

  QuestListView({Key key, this.quest}) : super(key: key);
  
  @override
  _QuestListViewState createState() => _QuestListViewState();
}

class _QuestListViewState extends State<QuestListView> {

  // MARK: - Life cycle

  @override
  Widget build(BuildContext context) {
    _convertOptionsToQuestionsMap();

          return new ListView.builder(
            
              itemCount: widget.quest.choice.options.length + 2 /* 2 - image + title */,
              itemBuilder: (context, int position) {
                // image
                if (position == 0) {
                  return QuizImageCard(
                      imageName: widget.quest.question.imageName);
                }
                // text
                if (position == 1) {
                  return QuizTitleCard(title: widget.quest.question.value);
                }

                final card = QuizCard(
                  key: UniqueKey(),
                  question: widget.quest.choice.options[position - 2].value,
                  questionPosition: position - 2,
                );

                card.onTap = (index, selected) {
                  widget.questionsMap[index] = selected;
                };

                return card;
              });
  }

  // MARK: - Private

  void _convertOptionsToQuestionsMap() {
    widget.quest.choice.options
        .asMap()
        .forEach((index, value) => widget.questionsMap[index] = false);
  }
}
