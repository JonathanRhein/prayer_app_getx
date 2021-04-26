class AgpeyaPrayerDatabase {
  int id;
  String hour;
  String section;
  String name;
  int isEnabled;

  AgpeyaPrayerDatabase(this.hour, this.section, this.name, this.isEnabled);


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['hour'] = hour;
    map['prayerSection'] = section;
    map['prayerName'] = name;
    map['isEnabled'] = isEnabled;

    return map;
  }

  AgpeyaPrayerDatabase.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.hour = map['hour'];
    this.section = map['prayerSection'];
    this.name = map['prayerName'];
    this.isEnabled = map['isEnabled'];
  }
}