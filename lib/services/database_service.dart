import '/models/model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataBaseService extends GetxController {
  final box = GetStorage();

  /// current user saved
  Users? currentUser;

  /// conversation user saved
  List<Users>? contactUser;

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  /// Current user update
  void updateCurrentUser(Users user) async {
    final currentUser = user.toJson();
    box.write('currentUser', currentUser);
    getCurrentUser();
  }

  void getCurrentUser() async {
    final currentUser = await box.read('currentUser');
    if (currentUser != null) this.currentUser = Users.fromJson(currentUser);
    update();
  }

  void removeCurrentUser() {
    box.remove('currentUser');
  }
}
