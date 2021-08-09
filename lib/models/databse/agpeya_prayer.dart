class AgpeyaPrayer {
  int id;
  String name;
  String isBiblical;
  int isMarian;

  AgpeyaPrayer({this.id, this.name, this.isBiblical, this.isMarian});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isBiblical': isBiblical,
      'isMarian': isMarian,
    };
  }

  @override
  String toString() {
    return '''AgpeyaPrayer{id: $id, name: $name, isBiblical: $isBiblical, 
              isMarian: $isMarian}\n''';
  }
}
