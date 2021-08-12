import 'dart:typed_data';

class Users {
  Users({
    this.id,
    this.name,
    this.phone,
    this.password,
    this.profileImage,
    this.lastSeen,
    this.isOnline,
  });

  int? id;
  String? name;
  String? phone;
  String? password;
  Uint8List? profileImage;
  DateTime? lastSeen;
  bool? isOnline;

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['user_id'],
      name: json['user_name'],
      phone: json['user_phone'],
      password: json['user_password'],
      profileImage: json['user_image'],
      isOnline: json['isOnline'] == 1,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        'user_name': name,
        'user_phone': phone,
        'user_password': password,
        'isOnline': isOnline,
      };

  @override
  int get hashCode => name.hashCode ^ phone.hashCode;

  @override
  operator ==(Object other) =>
      identical(this, other) ||
      other is Users && this.name == other.name && this.phone == other.phone;
}
