
abstract class QuestsBlockEvent {}

class QuestsFetchAllEvent implements QuestsBlockEvent {}

class QuestsNextQuestEvent implements QuestsBlockEvent {}

class QuestsOptionsEvent implements QuestsBlockEvent {
  final Map answer;

  QuestsOptionsEvent(this.answer);
}