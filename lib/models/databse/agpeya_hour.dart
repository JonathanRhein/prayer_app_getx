class AgpeyaHour {
  int id;
  String name;
  int isNotification;
  String notificationTime;
  String notificationInterval;

  AgpeyaHour(
      {this.id,
      this.name,
      this.isNotification,
      this.notificationTime,
      this.notificationInterval});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isNotification': isNotification,
      'notificationTime': notificationTime,
      'notificationInterval': notificationInterval,
    };
  }

  @override
  String toString() {
    return '''AgpeyaPrayer{id: $id, name: $name, isNotification: $isNotification, 
    notificationTime: $notificationTime, notificationInterval: $notificationInterval}''';
  }
}
