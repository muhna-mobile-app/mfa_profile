import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:mfa_profile/app/presentation/pages/profile_page.dart';

class ProfileApp implements MicroApp {
  static GlobalKey<NavigatorState>? navigatorGlobal;

  @override
  void init({required GlobalKey<NavigatorState> navigator}) {
    navigatorGlobal = navigator;
  }

  @override
  String get microAppName => 'ProfileApp';

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '/profile': (context, args) => const ProfilePage(),
      };
}
