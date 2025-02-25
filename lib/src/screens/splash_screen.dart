import 'package:flutter/material.dart';
import 'package:zarityhealth/src/screens/blog_list_screen.dart';

import '../widgets/custom_appname.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BlogListScreen()));
    });

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: CustomAppName(fontSize: 50)
      ),
    );
  }
}
