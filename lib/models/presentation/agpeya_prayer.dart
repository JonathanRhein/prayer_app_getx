class AgpeyaPrayer {
  int id;
  String name;
  String hour;
  String section;
  int isEnabled;
  int isBiblical;
  int isMarian;

  AgpeyaPrayer(
      {this.id,
      this.name,
      this.hour,
      this.section,
      this.isEnabled,
      this.isBiblical,
      this.isMarian});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'hour': hour,
      'section': section,
      'isEnabled': isEnabled,
      'isBiblical': isBiblical,
      'isMarian': isMarian,
    };
  }

  @override
  String toString() {
    return '''AgpeyaPrayer{id: $id, name: $name, hour: $hour, section: $section,
              isEnabled: $isEnabled, isBiblical: $isBiblical, 
              isMarian: $isMarian}\n''';
  }
}
