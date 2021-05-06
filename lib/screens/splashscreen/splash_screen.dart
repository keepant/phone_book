import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:phone_book/data/local_storage/preferences.dart';
import 'package:phone_book/screens/auth/login_screen.dart';
import 'package:phone_book/screens/home_screen.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Future<Timer> _init() async {
    return Timer(Duration(seconds: 3), _onDoneLoading);
  }

  void _onDoneLoading() async {
    final _prefs = await Preferences.init();

    if (_prefs.token == '0') {
      Get.off(() => LoginScreen());
    } else {
      Get.off(() => HomeScreen());
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Phone Book',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 31.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Save your important people',
              style: TextStyle(
                fontSize: 14.0,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
