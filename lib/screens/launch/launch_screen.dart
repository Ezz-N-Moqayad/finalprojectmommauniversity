import 'dart:async';
import 'package:flutter/material.dart';
import '../../firebase/fb_auth_controller.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  late StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _streamSubscription =
          FbAuthController().checkUserStatus(({required bool loggedIn}) {
        String route = loggedIn ? '/TabView' : '/Page_View';
        Navigator.pushReplacementNamed(context, route);
      });
    });
  }

  @override
  void dispose() {
    //الان اعرفت حالت المستخدم بعدها اعمل اغلاق الاتصال بيني وبينوووو

    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/launch.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 175,
              start: 75,
            ),
            child: Image.asset('images/textmomma.png'),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(top: 230, start: 150),
            child: Text(
              'FASHIONS',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
