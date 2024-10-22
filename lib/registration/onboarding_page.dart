import 'dart:math';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rabbi_tv_app/appwritemodel/appwrite_model.dart';
import 'package:rabbi_tv_app/menu/privacy_policy.dart';
import 'package:rabbi_tv_app/menu/rems_conditions.dart';
import 'package:rabbi_tv_app/registration/verify_mobnumber.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page/home_page_screen.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  TextEditingController mobileNumber=TextEditingController();
  final Random _random =
  Random(); // Create a Random object for generating random numbers
  int _randomNumber = 0;

  // Method ffor generating a random 4 digit number
  void generateRandomNumber() {
    setState(() {
      _randomNumber =
          1000 + _random.nextInt(9000); // Generates a random 4-digit number
    },);
  }
  @override
  Widget build(BuildContext context) {
    double height_size=MediaQuery.of(context).size.height;
    double width_size=MediaQuery.of(context).size.width;
    String country_code="+91";
    String user_id='';

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: GestureDetector(
          onTap: (){
            if(mobileNumber.text==""){
              Fluttertoast.showToast(
                  msg: "Please enter your mobile number",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  //backgroundColor: primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
            else if(mobileNumber.text.length<10){
              Fluttertoast.showToast(
                  msg: "Please enter valid mobile number",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  //backgroundColor: primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
            else{
              print(mobileNumber.text);
              print(country_code+mobileNumber.text);
              sendOTPToVerify(mobile: country_code+mobileNumber.text);
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>VerifyOTP(mobNumber: country_code+mobileNumber.text, numberOTP: _randomNumber.toString(), mobile_with_no_code: mobileNumber.text,)));
            }
          },
          child: Container(
            alignment: Alignment.center,
            height: 58,
            width: width_size-60,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  print('Edison is a pagal admi');
                  var sharedPref= await SharedPreferences.getInstance();
                  sharedPref.setBool('GuestUser', true);
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomePageScreen()));
                },
                child: Text('Skip', style: TextStyle(
                  color: Colors.white,
                  fontFamily: '',
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(width: 20,)
            ],
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/mobile.png', width: MediaQuery.of(context).size.width*.6,),
              SizedBox(height: 15,),
              Text('Phone Verification', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('We need to verify your mobile number before getting started.', style: TextStyle(fontSize: 14, ),textAlign: TextAlign.center,),
              SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        initialSelection: 'IN',
                        showCountryOnly: true,
                        backgroundColor: Colors.transparent,
                        alignLeft: false,
                        showFlag: true,
                        flagWidth: 30,
                        padding: EdgeInsets.only(left: 1),
                        onChanged: (value){
                          print(value);
                          setState(() {
                            country_code=value.toString();
                          });
                          print(country_code);
                        },
                        boxDecoration: BoxDecoration(
                        ),
                      ),
                      Text('|', style: TextStyle(fontSize: 33, color: Colors.grey),),
                      SizedBox(width: 10,),
                      Expanded(
                          child: TextFormField(
                              controller: mobileNumber,
                              decoration: InputDecoration(border: InputBorder.none, hintText: 'Phone', hintStyle: TextStyle(color: Colors.grey)),
                              keyboardType: TextInputType.phone,

                          )
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              RichText(
                maxLines: 2,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "By continuing, you agree to our ",
                        style: TextStyle(color: Colors.white, fontSize: 16, overflow: TextOverflow.ellipsis,),
                      ),
                      TextSpan(
                        text: "Terms and \nConditions",
                        style: TextStyle(color: Colors.blue, fontSize: 16, overflow: TextOverflow.ellipsis,),
                        recognizer: TapGestureRecognizer()..onTap = ()  {
                          // Single tapped.
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>TermsAndConditions()));
                        },
                      ),
                      TextSpan(
                        text: " & ",
                        style: TextStyle(color: Colors.white, fontSize: 16, overflow: TextOverflow.ellipsis,),
                      ),
                      TextSpan(
                        text: "Privacy policy",
                        style: TextStyle(color: Colors.blue, fontSize: 16, overflow: TextOverflow.ellipsis,),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          // Single tapped.
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>PrivacyPolicy()));
                        },
                      ),
                    ]
                  ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 80,),
            ],
          ),
        ),
      ),
    );
  }
}
