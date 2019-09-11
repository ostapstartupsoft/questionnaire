
import 'package:flutter/foundation.dart';
import 'package:questionnaire/models/Quest.dart';

class QuestsBlockState {
  final List<Quest> quests;
  var currentQuest;
  List<Map> anwers;

  QuestsBlockState({this.quests, this.currentQuest, this.anwers});
  factory QuestsBlockState.initial() => QuestsBlockState(quests: null, currentQuest: 0, anwers: null);
}

class QuestsEmptyState extends QuestsBlockState {
}

class QuestsLoadingState extends QuestsBlockState {}

class QuestsLoadedState extends QuestsBlockState {
  final List<Quest> quests;
  var currentQuest;
  List<Map> anwers;

  QuestsLoadedState({@required this.quests, @required this.currentQuest, @required this.anwers}) : assert(quests != null);
}

class QuestsPreNextState extends QuestsBlockState {
  final List<Quest> quests;
  var currentQuest;
  List<Map> anwers;
  
  QuestsPreNextState({@required this.quests, @required this.currentQuest, @required this.anwers}) : assert(quests != null);
}

class QuestsFishedState extends QuestsBlockState {}
class QeustsErrorState extends QuestsBlockState {}