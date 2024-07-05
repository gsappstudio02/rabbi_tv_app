import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rabbi_tv_app/home_page/home_page_screen.dart';

class SplashScreenCustopm extends StatefulWidget {
  const SplashScreenCustopm({Key? key}) : super(key: key);

  @override
  State<SplashScreenCustopm> createState() => _SplashScreenCustopmState();
}

class _SplashScreenCustopmState extends State<SplashScreenCustopm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context)
    );
  }
  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomePageScreen()
    )
    );
  }
  initScreen(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Rabbi.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 60),),
            SizedBox(height: 8,),
            Text('Your true Teacher', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
          ],
        ),
      ),
    );
  }
}

