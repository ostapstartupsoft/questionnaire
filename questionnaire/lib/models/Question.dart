
class Question {

     // MARK: - Appearance Properties

    final String id;
    final String value;
    final String imageName; // it is local Image Name for now.

    // MARK: - Initialization
    
    Question(this.id, this.value, this.imageName);

    // MARK: - Appearance Static

    static Question fromMap(Map map) => new Question(map['id'], map['value'], map['imageName']);
}