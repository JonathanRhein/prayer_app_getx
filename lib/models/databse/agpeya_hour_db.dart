class AgpeyaHourDatabase {
  int id;
  String name;
  int isNotification;
  String notificationTime;
  String notificationInterval;

  AgpeyaHourDatabase(this.name, this.isNotification, this.notificationTime, this.notificationInterval);

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['hourName'] = name;
    map['isNotificationSet'] = isNotification;
    map['notificationTime'] = notificationTime;
    map['notificationInterval'] = notificationInterval;

    return map;
  }

  AgpeyaHourDatabase.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['hourName'];
    this.isNotification = map['isNotificationSet'];
    this.notificationTime = map['notificationTime'];
    this.notificationInterval = map['notificationInterval'];
  }
}