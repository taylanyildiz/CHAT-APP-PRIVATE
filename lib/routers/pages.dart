import 'package:chat_app_ui/bindings/add_binding.dart';
import 'package:chat_app_ui/bindings/camera_binding.dart';
import 'package:chat_app_ui/bindings/message_detail_binding.dart';
import 'package:chat_app_ui/screens/call_screen.dart';

import '/bindings/bindings.dart';
import '/routers/routers.dart';
import '/screens/screens.dart';
import 'package:get/get.dart';

class Pages {
  Pages._();

  static final pages = <GetPage>[
    GetPage(
      name: Routers.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routers.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routers.REGISTER,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),

    // Nav screens
    GetPage(
      name: Routers.NAV,
      page: () => NavScreen(),
      binding: NavBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routers.CALLING,
      page: () => CallScreen(),
      binding: CallBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routers.ADD,
      page: () => AddScreen(),
      binding: AddBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routers.CAMERA,
      page: () => FileScreen(),
      binding: CameraBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routers.MESSAGE,
      page: () => MessageScreen(),
      binding: MessageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routers.SETTING,
      page: () => SettingScreen(),
      binding: SettingBinding(),
      transition: Transition.fadeIn,
    ),

    // detail
    GetPage(
      name: Routers.MSG_DETAIL,
      page: () => MessageDetailScreen(),
      binding: MessageDetailBinding(),
      transition: Transition.downToUp,
    ),
  ];
}
