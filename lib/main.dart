import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:rabbi_tv_app/home_page/home_page_screen.dart';
import 'package:rabbi_tv_app/models/cor_palete.dart';
import 'package:rabbi_tv_app/registration/onboarding_page.dart';
import 'package:rabbi_tv_app/update/update_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("ff18fee0-876e-47aa-b38a-16d50f56192e");
  OneSignal.Notifications.requestPermission(true).then((accepted) => print(accepted));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Widget _child=OnboardingPage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGO();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    whereToGO();
  }
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallette.backgroundColor
      ),
      home: _child
    );
  }

  Future<void> whereToGO() async{
    var sharedPref= await SharedPreferences.getInstance();
    var isLogged=sharedPref.getString('MobNumber')??"000";

    print(isLogged);
    if(isLogged=="000"){
      setState(() {
        _child=OnboardingPage();
      });
    }
    else{
      print('starts');
      setState(() {
        _child=HomePageScreen();
        //_child=NetworkError();
      });
    }

  }
}

