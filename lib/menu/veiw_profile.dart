import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rabbi_tv_app/registration/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_bar_control/status_bar_control.dart';
import '../models/cor_palete.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.mobNumber, required this.email, required this.name }) : super(key: key);
  final String mobNumber;
  final String email;
  final String name;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    Future<List<Live_feeds>> ReadJsonData() async {
      await StatusBarControl.setHidden(
          false, animation: StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/delete_account.php";
      var response = await http.post(Uri.parse(url), body: {
        "query": widget.mobNumber,
      });
      print(response.body);
      if(response.body.contains('deleted')){
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>OnboardingPage()));
      }
      final list = json.decode(response.body.toString()) as List<dynamic>;
      return list.map((e) => Live_feeds.fromJson(e)).toList();
    }
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
                  Text('Profile', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                ],
              ),
            ),
          )];
        },
        body: Column(
          children: [
            SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('assets/images/profile.jpg', height: 70, width: 70,),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('General', style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w800),),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        children: [
                          Icon(Iconsax.user),
                          SizedBox(width: 15,),
                          Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Divider(),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Icon(Icons.email_outlined),
                          SizedBox(width: 15,),
                          Text(widget.email,
                            maxLines: 1,
                            style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Divider(),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Icon(Iconsax.mobile),
                          SizedBox(width: 15,),
                          Text('+91 '+widget.mobNumber, style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('Account', style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w800),),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          logOut();
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>OnboardingPage()));
                        },
                        child: Row(
                          children: [
                            Icon(Iconsax.logout),
                            SizedBox(width: 15,),
                            Text('Logout', style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Divider(),
                      SizedBox(height: 15,),
                      GestureDetector(
                        onTap: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Row(
                                    children: [
                                      Image.asset('assets/images/delete.png', height: 40, width: 40,),
                                      Text('Delete Account', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18),),
                                    ],
                                  ),
                                  content: Text(
                                      "Are you sure to delete account, this is a permanent action and can't be undone",
                                    style: TextStyle(color: Colors.grey,fontSize: 14),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Confirm'),
                                      onPressed: () {
                                       //deleteAccount()
                                        ReadJsonData();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              }
                          );
                          //deleteAccount();
                        },
                        child: Row(
                          children: [
                            Icon(Iconsax.profile_delete4),
                            SizedBox(width: 15,),
                            Text('Delete Account', style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logOut() async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('MobNumber', "000");
  }

  void deleteAccount() {}
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