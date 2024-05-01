class UserEntity {
  String id;
  double weight;
  int waterAmount;
  int cups;
  DateTime notificationStartTime;
  DateTime notificationEndTime;
  int notificationInterval;

  UserEntity({
    required this.id,
    required this.weight,
    required this.waterAmount,
    required this.cups,
    required this.notificationStartTime,
    required this.notificationEndTime,
    required this.notificationInterval,
  });

  factory UserEntity.fromSnapshot(snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserEntity(
      id: snapshot.id,
      weight: data['weight'],
      waterAmount: data['waterAmount'],
      cups: data['cups'],
      notificationStartTime: data['notificationStartTime'],
      notificationEndTime: data['notificationEndTime'],
      notificationInterval: data['notificationInterval'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'waterAmount': waterAmount,
      'cups': cups,
      'notificationStartTime': notificationStartTime,
      'notificationEndTime': notificationEndTime,
      'notificationInterval': notificationInterval,
    };
  }
}
