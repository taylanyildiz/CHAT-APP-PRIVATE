import 'dart:convert';
import '/models/model.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureDbService extends GetxController {
  final _storage = FlutterSecureStorage();

  /// Current User saved
  Users? currentUser;

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  void updateCurrentUser(Users user) async {
    final currentUser = json.encode(user.toJson());
    await _storage.write(
      key: 'currentUser',
      value: currentUser,
    );
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = await _storage.read(key: 'currentUser');
    if (user != null) currentUser = Users.fromJson(json.decode(user));
    update();
  }

  void removeCurrentUser() async {
    if (currentUser != null) {
      await _storage.delete(key: 'currentUser');
      currentUser = null;
      update();
    }
  }
}
