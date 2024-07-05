import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rabbi_tv_app/menu/about_us.dart';
import 'package:rabbi_tv_app/menu/contact_page.dart';
import 'package:rabbi_tv_app/menu/events.dart';
import 'package:rabbi_tv_app/menu/faq_page.dart';
import 'package:rabbi_tv_app/menu/privacy_policy.dart';
import 'package:rabbi_tv_app/menu/rems_conditions.dart';
import 'package:rabbi_tv_app/menu/support_channel.dart';
import 'package:rabbi_tv_app/menu/veiw_profile.dart';
import 'package:rabbi_tv_app/menu/why_this_platform.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_bar_control/status_bar_control.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/cor_palete.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MoreMenu extends StatefulWidget {
  const MoreMenu({Key? key}) : super(key: key);

  @override
  State<MoreMenu> createState() => _MoreMenuState();
}

class _MoreMenuState extends State<MoreMenu> {
  String mobNumber='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMobNumber();
  }
  @override
  Widget build(BuildContext context) {

    Future<List<Live_feeds>> ReadJsonData() async {
      await StatusBarControl.setHidden(
          false, animation: StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/view_profile.php";
      var response = await http.post(Uri.parse(url), body: {
        "mob_number": mobNumber,
      });
      print(response.body);
      final list = json.decode(response.body.toString()) as List<dynamic>;
      return list.map((e) => Live_feeds.fromJson(e)).toList();
    }
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (
            BuildContext context, bool innerBoxIsScrolled) {
          return [SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Pallette.backgroundColor,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('More Menu', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                    ],
                  ),

                ],
              ),
            ),
          )];
        },
        body: Padding(
          padding: EdgeInsets.only(top: 8, left: 15),
          child: FutureBuilder(
            future: ReadJsonData(),
            builder: (_, data){
              if(data.hasData){
                var items=data.data as List<Live_feeds>;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>ProfilePage(mobNumber: mobNumber, email: items[0].email.toString(), name: items[0].name.toString(),)));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset('assets/images/profile.jpg', height: 70, width: 70,),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(items[0].name.toString(), style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),),
                                  Text('+91 '+mobNumber, style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w800),),
                                ],
                              ),
                              Expanded(child: SizedBox(width: 20,)),
                              Expanded(child: Icon(Icons.keyboard_arrow_right))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>SupportChannel()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Iconsax.support, size: 25,),
                              SizedBox(width: 8,),
                              Text('Get Help', style: TextStyle(color: Pallette.textColor, fontSize: 16, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>AboutUs()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Iconsax.information, size: 25,),
                              SizedBox(width: 8,),
                              Text('About Us', style: TextStyle(color: Pallette.textColor, fontSize: 16, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>WhyThisPlatform()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Iconsax.message_question, size: 25,),
                              SizedBox(width: 8,),
                              Text('Why this platform', style: TextStyle(color: Pallette.textColor, fontSize: 16, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>EventsPage()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Iconsax.calendar_2, size: 25,),
                              SizedBox(width: 8,),
                              Text('Events', style: TextStyle(color: Pallette.textColor, fontSize: 16, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>ContactPage()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Iconsax.message, size: 25,),
                              SizedBox(width: 8,),
                              Text('Contact', style: TextStyle(color: Pallette.textColor, fontSize: 16, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>FAQPage()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Iconsax.book_1, size: 25,),
                              SizedBox(width: 8,),
                              Text('FAQ', style: TextStyle(color: Pallette.textColor, fontSize: 16, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>PrivacyPolicy()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Iconsax.security_safe, size: 25,),
                              SizedBox(width: 8,),
                              Text('Privacy Policy', style: TextStyle(color: Pallette.textColor, fontSize: 16, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>TermsAndConditions()));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Iconsax.book, size: 25,),
                              SizedBox(width: 8,),
                              Text('Terms and Conditons', style: TextStyle(color: Pallette.textColor, fontSize: 16, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                        child: GestureDetector(
                          onTap: () async {
                            await launchUrl(Uri.parse('https://2ly.link/1ybMI'));
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Iconsax.coin, size: 25,),
                              SizedBox(width: 8,),
                              Text('Support', style: TextStyle(color: Pallette.textColor, fontSize: 16, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                );
              }
              else{
                return Center(child: CircularProgressIndicator());
              }
            },
          )
          
        )
      ),
    );
  }

  Future<void> getMobNumber() async {
    var sharedPref= await SharedPreferences.getInstance();
    mobNumber=sharedPref.getString('MobNumber')!;
  }
}
class Live_feeds {
  String? name;
  String? email;

  Live_feeds(this.name, this.email);

  Live_feeds.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];

  }

}