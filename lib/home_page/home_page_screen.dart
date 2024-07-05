import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rabbi_tv_app/home_page/homeScreenContent.dart';
import 'package:rabbi_tv_app/home_page/navbar_menu.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rabbi_tv_app/update/update_app.dart';
import 'package:status_bar_control/status_bar_control.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    PackageInfo.fromPlatform().then((value) {
      print(value.version);
      setState(() {
        versionNumber=value.version;
      });// Value will be our all details we get from package info package
    });
    super.initState();
  }

  @override
  String versionNumber='';
  Widget build(BuildContext context) {

    Future<List<Live_feeds>> ReadJsonData() async {
      await StatusBarControl.setHidden(false, animation:StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/app_details.php";
      var response = await http.post(Uri.parse(url));
      print(response.body);
      final list = json.decode(response.body.toString()) as List<dynamic>;
      return list.map((e) => Live_feeds.fromJson(e)).toList();
    }

    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (_, data){
          if(data.hasData){
            var items=data.data as List<Live_feeds>;
            print('Version:' + items[0].app_version.toString());
            print('Flutter version'+versionNumber);
            if(items[0].app_version.toString()==versionNumber){
              return NavBarMenu();
            }
            else{
              return UpdateApp();
            }
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }


}

class Live_feeds {
  String? app_version;
  String? subtitle;
  String? video_id;
  String? date;
  String? month;
  String? desc;
  String? registration;
  String? notified;

  Live_feeds(this.app_version, this.subtitle, this.date, this.video_id, this.month, this.desc, this.notified, this.registration);

  Live_feeds.fromJson(Map<String, dynamic> json) {
    date = json['mag_date'];
    month = json['mag_month'];
    video_id = json['cover_img'];
    app_version = json['app_version'];
    subtitle = json['mag_subtitle'];
    desc = json['location'];
    notified = json['event_notifier'];
    registration = json['event_registration'];
  }

}