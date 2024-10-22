import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pinput/pinput.dart';
import 'package:rabbi_tv_app/appwritemodel/appwrite_model.dart';
import 'package:rabbi_tv_app/home_page/home_page_screen.dart';
import 'package:rabbi_tv_app/models/cor_palete.dart';
import 'package:rabbi_tv_app/registration/create_profile.dart';
import 'package:rabbi_tv_app/registration/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:status_bar_control/status_bar_control.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key, required this.mobNumber, required this.numberOTP, required this.mobile_with_no_code}) : super(key: key);
  final String mobNumber;
  final String numberOTP;
  final String mobile_with_no_code;

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  OtpTimerButtonController resendController = OtpTimerButtonController();
  late String resentOTP='0000000';
  bool verification= false;
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

  Future<List<Live_feeds>> ReadJsonData() async {
    await StatusBarControl.setHidden(
        false, animation: StatusBarAnimation.SLIDE);
    var url = "https://www.aaradhna.app/rabbi_app/check_account.php";
    var response = await http.post(Uri.parse(url), body: {
      "mob_number": widget.mobile_with_no_code,

    });
    print(response.body);
    if(response.body.contains('0')){
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>CreateProfile(mob_nuumber: widget.mobile_with_no_code,)));
    }
    else{
      upDateMobNumber();
      Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomePageScreen()));
    }
    final list = json.decode(response.body.toString()) as List<dynamic>;
    return list.map((e) => Live_feeds.fromJson(e)).toList();
  }

  @override
  String enteredOTP = '222200';

  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Pallette.backgroundColor),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: GestureDetector(
          onTap: () async{
            print(enteredOTP);
            print(widget.mobNumber.toString());

            if (enteredOTP == "") {
              Fluttertoast.showToast(
                  msg: "Please enter OTP",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  //backgroundColor: primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
            else{
              verification= await verifyOTP(secret: enteredOTP, mobile: widget.mobNumber, userId: widget.mobNumber.replaceAll("+", ""));
              if(verification){
                ReadJsonData();
              }
              else{
                Fluttertoast.showToast(
                    msg: "Invalid OTP",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    //backgroundColor: primaryColor,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }
            }

            // if ( ) {
            //   Fluttertoast.showToast(
            //       msg: "You entered invalid OTP",
            //       toastLength: Toast.LENGTH_SHORT,
            //       gravity: ToastGravity.BOTTOM,
            //       timeInSecForIosWeb: 1,
            //       //backgroundColor: primaryColor,
            //       textColor: Colors.white,
            //       fontSize: 16.0
            //   );
            // }
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
            child: Text('Verify', style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18),),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset('assets/images/mobile.png', width: MediaQuery
                    .of(context)
                    .size
                    .width * .6,),
                alignment: Alignment.center,
              ),
              SizedBox(height: 15,),
              Container(
                  alignment: Alignment.center,
                  child: Text('Phone Verification',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,)),
              SizedBox(height: 10,),
              Container(
                  alignment: Alignment.center,
                  child: Text('OTP has been sent to +91 ' + widget.mobNumber,
                    style: TextStyle(fontSize: 14,),
                    textAlign: TextAlign.center,)),
              SizedBox(height: 15,),

              //OTP Number Input

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) =>
                        setState(() {
                          enteredOTP = pin;
                        }),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (builder) => OnboardingPage()));
                      },
                      child: Text('Edit phone number?',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                        textAlign: TextAlign.start,)),
                  OtpTimerButton(
                    //height: 60,
                    onPressed: () {
                      //SendOTP mechanism
                      // generateRandomNumber();
                      // print(_randomNumber);
                      // String nxtScreenNumber = _randomNumber
                      //     .toString(); // Needs to be removed after OTP implement
                      // setState(() {
                      //   resentOTP = _randomNumber.toString();
                      // });
                      // print(resentOTP);
                      // Fluttertoast.showToast(
                      //     msg: "Please enter in next Screen: " +
                      //         nxtScreenNumber,
                      //     toastLength: Toast.LENGTH_SHORT,
                      //     gravity: ToastGravity.BOTTOM,
                      //     timeInSecForIosWeb: 1,
                      //     //backgroundColor: primaryColor,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0
                      // );
                      sendOTPToVerify(mobile: widget.mobNumber);
                    },
                    text: Text(
                      'Resend OTP',
                      style: TextStyle(fontSize: 16),
                    ),
                    buttonType: ButtonType.text_button,
                    backgroundColor: Colors.green,
                    duration: 60,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> upDateMobNumber() async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('MobNumber', widget.mobile_with_no_code);
    sharedPref.setBool('GuestUser', false);
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