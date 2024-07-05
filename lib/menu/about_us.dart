import 'package:flutter/material.dart';
import 'package:rabbi_tv_app/about_us/about_rabbi.dart';
import 'package:rabbi_tv_app/about_us/about_rabbiteam.dart';
import 'package:rabbi_tv_app/about_us/about_rabbitv.dart';

import '../models/cor_palete.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Color _aboutRabbiBG=Colors.white;
  Color _aboutRabbiText=Colors.black;
  Color _aboutRabbiAppBG=Colors.white.withOpacity(0.3);
  Color _aboutRabbiAppText=Colors.white;
  Color _aboutRabbiTeamBG=Colors.white.withOpacity(0.3);
  Color _aboutRabbiTeamText=Colors.white;
  Widget _bodyChild= AboutRabbi();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (
            BuildContext context, bool innerBoxIsScrolled) {
          return [SliverAppBar(
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Pallette.backgroundColor,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('About Us', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                ],
              ),
            ),
          )];
        },
        body: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              height: 40,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                           _aboutRabbiBG=Colors.white;
                           _aboutRabbiText=Colors.black;
                           _aboutRabbiAppBG=Colors.white.withOpacity(0.3);
                           _aboutRabbiAppText=Colors.white;
                           _aboutRabbiTeamBG=Colors.white.withOpacity(0.3);
                           _aboutRabbiTeamText=Colors.white;
                           _bodyChild=AboutRabbi();
                        });
                      },
                      child: Container(
                        height: 38,
                        width: 140,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: _aboutRabbiBG,
                            borderRadius: BorderRadius.circular(26)
                        ),
                        child: Text(
                          'Rabbi',
                          style: TextStyle(color: _aboutRabbiText, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _aboutRabbiBG=Colors.white.withOpacity(0.3);
                          _aboutRabbiText=Colors.white;
                          _aboutRabbiAppBG=Colors.white;
                          _aboutRabbiAppText=Colors.black;
                          _aboutRabbiTeamBG=Colors.white.withOpacity(0.3);
                          _aboutRabbiTeamText=Colors.white;
                          _bodyChild=AboutRabbiTV();
                        });
                      },
                      child: Container(
                        height: 38,
                        width: 140,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: _aboutRabbiAppBG,
                            borderRadius: BorderRadius.circular(26)
                        ),
                        child: Text(
                          'Rabbi TV',
                          style: TextStyle(color: _aboutRabbiAppText, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          _aboutRabbiBG=Colors.white.withOpacity(0.3);
                          _aboutRabbiText=Colors.white;
                          _aboutRabbiAppBG=Colors.white.withOpacity(0.3);
                          _aboutRabbiAppText=Colors.white;
                          _aboutRabbiTeamBG=Colors.white;
                          _aboutRabbiTeamText=Colors.black;
                          _bodyChild=AboutRabbiTeam();
                        });
                      },
                      child: Container(
                        height: 38,
                        width: 140,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: _aboutRabbiTeamBG,
                            borderRadius: BorderRadius.circular(26)
                        ),
                        child: Text(
                          'Rabbi Team',
                          style: TextStyle(color: _aboutRabbiTeamText, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: _bodyChild)
          ],
        ),
      ),
    );
  }
}
