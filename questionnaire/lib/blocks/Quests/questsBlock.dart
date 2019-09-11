import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:questionnaire/services/quest/QuestService.dart';

import 'Events/QuestsEvents.dart';
import 'States/QuestsStates.dart';

class QuestsBlock extends Bloc<QuestsBlockEvent, QuestsBlockState> {
  QuestsBlockState get initialState => QuestsEmptyState();

  @override
  Stream<QuestsBlockState> mapEventToState(QuestsBlockEvent event) async* {
    if (event is QuestsFetchAllEvent) {
      yield QuestsLoadingState();
      
      try {
        final quests = await QuestService().fetchQuests();
        yield QuestsLoadedState(quests: quests, currentQuest: 0, anwers: <Map>[]);
      } catch (_, stackTrace) {
        print('$_ $stackTrace');
        yield QeustsErrorState();
      }
    }

    if (event is QuestsNextQuestEvent) {
      if (currentState.quests != null) {
        yield QuestsPreNextState(quests: currentState.quests, currentQuest: currentState.currentQuest, anwers: currentState.anwers);
      }
    }

    if (event is QuestsOptionsEvent) {

      final nextQuest = currentState.currentQuest + 1;

      if (nextQuest < currentState.quests.length) {
        final answers = currentState.anwers;
        answers.add(event.answer);
       
        yield QuestsLoadedState(quests: currentState.quests, currentQuest: nextQuest, anwers:answers);
      } else {
        print("Current State = ${currentState.anwers}");
        // we have finished 
        yield QuestsFishedState();
      } 
    }
  }
}
