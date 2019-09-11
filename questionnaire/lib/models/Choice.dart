import 'Option.dart';

class Choice {

    // MARK: - Properties
    final String questionId;
    final bool multichoise;
    final List<Option> options;

    // MARK: - Init

    Choice({this.questionId, this.multichoise, this.options});

    // MARK - Appearance 

    static Choice fromMap(Map map) {
         var options = map['options']
        .cast<Map<String, dynamic>>()
        .map((obj) => Option.fromMap(obj))
        .toList()
        .cast<Option>();
        
      return Choice(
        questionId: map['question'],
        multichoise: map['multichoise'],
        options: options
        );
    }
}