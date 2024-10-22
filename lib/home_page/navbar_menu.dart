import 'dart:io';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rabbi_tv_app/home_page/homeScreenContent.dart';
import 'package:rabbi_tv_app/live/live_videos.dart';
import 'package:rabbi_tv_app/more_menu/more_menu.dart';

import '../models/cor_palete.dart';


class NavBarMenu extends StatefulWidget {
  const NavBarMenu({Key? key}) : super(key: key);

  @override
  State<NavBarMenu> createState() => _NavBarMenuState();
}

class _NavBarMenuState extends State<NavBarMenu> {
  int selectedIndex=0;
  @override
  int _index=0;
  Widget build(BuildContext context) {
    late Widget _child;
    switch(_index){
      case 0:
        _child=HomeScreenContent();
        break;
      case 1:
        _child=LiveVideos();
        break;
      case 2:
        _child=MoreMenu();
        break;

    }
    return Scaffold(
      bottomNavigationBar: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          height: 80,
          elevation: 0,
          onDestinationSelected: (index) {
            setState(() {
              _index=index;
              print(selectedIndex);
            });
          },
          selectedIndex: _index,
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.live_tv), label: 'Live'),
            NavigationDestination(icon: Icon(Iconsax.setting_34), label: 'Menu'),
          ],
        ),
      ),
      body: WillPopScope(
          child: _child,
        onWillPop: () =>handlwIllPop(context),
      )
    );
  }
  Future<bool> handlwIllPop(BuildContext context) async{
    print('back is pressed');
    Platform.isIOS ?exit(0):SystemNavigator.pop();
    return true;
  }
}


