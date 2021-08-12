import 'dart:typed_data';

class Users {
  Users({
    this.id,
    this.name,
    this.phone,
    this.password,
    this.profileImage,
    this.isOnline,
    this.isDeleted,
    this.lastSeen,
    this.updatedAt,
    this.createdAt,
  });

  int? id;
  String? name;
  String? phone;
  String? password;
  Uint8List? profileImage;
  bool? isOnline;
  bool? isDeleted;
  DateTime? lastSeen;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['user_id'],
      name: json['user_name'],
      phone: json['user_phone'],
      password: json['user_password'],
      profileImage: json['user_image'],
      isOnline: json['isOnline'] == 1,
      isDeleted: json['isDeleted'] == 1,
      // lastSeen: Utils.fromTimestamp(json['last_seen']).toDate(),
      // updatedAt: Utils.fromTimestamp(json['updated_at']).toDate(),
      // createdAt: Utils.fromTimestamp(json['created_at']).toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        'user_name': name,
        'user_phone': phone,
        'user_password': password,
        'isOnline': isOnline,
        // 'last_seen': lastSeen,
        // 'updated_at': updatedAt,
        // 'created_at': createdAt,
      };

  @override
  int get hashCode => name.hashCode ^ phone.hashCode;

  @override
  operator ==(Object other) =>
      identical(this, other) ||
      other is Users && this.name == other.name && this.phone == other.phone;
}
