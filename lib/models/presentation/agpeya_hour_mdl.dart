class AgpeyaHour {
  int id;
  String name;
  String title;
  String titleLatin;
  String subtitle;
  String description;
  String latinNumber;
  String icon;
  String colorVibrant1;
  String colorVibrant2;
  String colorDark;
  String colorLight;
  int isNotificationSet;
  String notificationTime;
  String notificationInterval;

  AgpeyaHour({
    this.name,
    this.title,
    this.titleLatin,
    this.subtitle,
    this.description,
    this.latinNumber,
    this.icon,
    this.colorVibrant1,
    this.colorVibrant2,
    this.colorDark,
    this.colorLight,
    this.isNotificationSet,
    this.notificationTime,
    this.notificationInterval,
  });

  AgpeyaHour.fromMap(Map<String, dynamic> map) {
    name = map['hourName'];
    title = map['title'];
    titleLatin = map['titleLatin'];
    subtitle = map['subtitle'];
    description = map['description'];
    latinNumber = map['latinNumber'];
    icon = map['icon'];
    colorVibrant1 = map['colorVibrant1'];
    colorVibrant2 = map['colorVibrant2'];
    colorDark = map['colorDark'];
    colorLight = map['colorLight'];
    id = map['id'];
    isNotificationSet = map['isNotificationSet'];
    notificationTime = map['notificationTime'];
    notificationInterval = map['notificationInterval'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['hourName'] = name;
    map['title'] = this.title;
    map['titleLatin'] = this.titleLatin;
    map['subtitle'] = this.subtitle;
    map['description'] = this.description;
    map['latinNumber'] = this.latinNumber;
    map['icon'] = this.icon;
    map['colorVibrant1'] = this.colorVibrant1;
    map['colorVibrant2'] = this.colorVibrant2;
    map['colorDark'] = this.colorDark;
    map['colorLight'] = this.colorLight;
    map['isNotificationSet'] = isNotificationSet;
    map['notificationTime'] = notificationTime;
    map['notificationInterval'] = notificationInterval;
    return map;
  }
}
