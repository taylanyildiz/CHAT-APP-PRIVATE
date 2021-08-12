import 'dart:developer';

import 'package:chat_app_ui/services/restful_service.dart';

import '/bindings/bindings.dart';
import 'package:get_storage/get_storage.dart';
import '/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/custom_colors.dart';
import 'localization/localization.dart';
import 'routers/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  void initState() {
    super.initState();
    log('initState');
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    log('dispose');
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      // removed app
      log('detached');
    }
    if (state == AppLifecycleState.inactive) {
      // background app
      log('inactive');
    }
    if (state == AppLifecycleState.paused) {
      // background app
      log('paused');
    }
    if (state == AppLifecycleState.resumed) {
      // build again app
      // refres token
      log('resume');
      Get.find<RestfulService>().takeRefreshToken();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat UI',
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.scaffold,
        primaryColor: CustomColors.options,
      ),
      locale: Get.locale ?? Locale('en'),
      translations: Localization(),
      initialRoute: Routers.SPLASH,
      initialBinding: SplashBinding(),
      getPages: Pages.pages,
    );
  }
}
