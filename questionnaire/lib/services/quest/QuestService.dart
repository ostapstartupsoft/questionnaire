
import 'package:questionnaire/models/Choice.dart';
import 'package:questionnaire/models/Quest.dart';
import 'package:questionnaire/models/Question.dart';
import 'package:questionnaire/services/firebase/firebaseService.dart';

class QuestService {
    
    // MARK: - Private properties

  final _firebaseService = FirebaseService();

    // MARK: - Appearance

  Future<List<Quest>> fetchQuests() async {
    final decodedResponce = await _firebaseService.fetchQuests();

    var questions = _fetchQuestions(fromMap: decodedResponce['questionnaire']['questions']);
    var choices = _fetchChoices(fromMap: decodedResponce['questionnaire']['choices']);

    final quests = List<Quest>();
    for (int i = 0; i < questions.length; i++) {
      var choise = choices.firstWhere((cho) => cho.questionId == questions[i].id);
      if (choise != null) {
        quests.add(Quest(questions[i], choise));
      }
    }
    
    return quests;
  }

  // MARK: - Private 

  List<Question> _fetchQuestions({fromMap: Map}) {
    return fromMap.cast<Map<String, dynamic>>()
        .map((obj) => Question.fromMap(obj))
        .toList()
        .cast<Question>();
  }

  List<Choice> _fetchChoices({fromMap: Map}) {
      return fromMap.cast<Map<String, dynamic>>()
        .map((obj) => Choice.fromMap(obj))
        .toList()
        .cast<Choice>();
  }
}