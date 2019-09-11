
class Option {
    
    // MARK: - Appearance Properties

    final String id;
    final String value;

    // MARK: - Initialization
    
    Option(this.id, this.value);

    // MARK: - Appearance Static

    static Option fromMap(Map map) => new Option(map['id'], map['value']);
}