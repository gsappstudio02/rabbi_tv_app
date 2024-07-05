import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rabbi_tv_app/home_page/home_page_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_bar_control/status_bar_control.dart';


class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key, required this.mob_nuumber}) : super(key: key);
  final String mob_nuumber;
  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  TextEditingController _name=TextEditingController();
  TextEditingController _email=TextEditingController();
  bool rememberMe = false;
  Future<List<Live_feeds>> ReadJsonData() async {
    await StatusBarControl.setHidden(
        false, animation: StatusBarAnimation.SLIDE);
    var url = "https://www.aaradhna.app/rabbi_app/create_account.php";
    var response = await http.post(Uri.parse(url), body: {
      "mob_number": widget.mob_nuumber,
      "name": _name.text,
      "email": _email.text,
      "newsletter": rememberMe.toString()
    });
    print(response.body);
    if(response.body.contains('successfully')){
      upDateMobNumber();
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomePageScreen()));
    }
    final list = json.decode(response.body.toString()) as List<dynamic>;
    return list.map((e) => Live_feeds.fromJson(e)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: GestureDetector(
          onTap: () {
            //print(enteredOTP);
            if (_name == "" || _email =="") {
              Fluttertoast.showToast(
                  msg: "Please enter all details",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  //backgroundColor: primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }

            else {
              Fluttertoast.showToast(
                  msg: "valid OTP",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  //backgroundColor: primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
              //upDateMobNumber();
              ReadJsonData();
            }
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green
            ),
            width: MediaQuery
                .of(context)
                .size
                .width * .9,
            height: 55,
            child: Text('Submit', style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18),),
          ),
        ),
      ),
      body: Center(
        //create profile
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                  child: Text('Almost\nThere...', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: _name,
                decoration: InputDecoration(
                  label: Text("Name"),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: new BorderSide(
                    ),
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: InputDecoration(
                  label: Text("Email"),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: new BorderSide(
                    ),
                  )
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                    value: rememberMe,
                    activeColor: Colors.green,
                    onChanged: (value){
                      setState(() {
                        rememberMe=value!;
                      });
                      print(rememberMe);
                    }),
                Text('Subscribe to our newsletter', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),)
              ],
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
  Future<void> upDateMobNumber() async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('MobNumber', widget.mob_nuumber);
    print(sharedPref.getString('MobNumber'));
  }
}

class Live_feeds {
  String? count;

  Live_feeds(this.count);

  Live_feeds.fromJson(Map<String, dynamic> json) {
    count = json['count(*)'];

  }

}