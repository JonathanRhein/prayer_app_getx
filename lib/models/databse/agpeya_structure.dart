class AgpeyaStructure {
  int id;
  String hour;
  String section;
  String name;
  int isEnabled;

  AgpeyaStructure({this.id, this.hour, this.section, this.name, this.isEnabled});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hour': hour,
      'section': section,
      'name': name,
      'isEnabled': isEnabled,
    };
  }

  @override
  String toString() {
    return '''AgpeyaPrayer{id: $id, hour: $hour, section: $section, 
              name: $name, isEnabled: $isEnabled}\n''';
  }
}
