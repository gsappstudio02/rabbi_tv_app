import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rabbi_tv_app/menu/faq_page.dart';
import 'package:status_bar_control/status_bar_control.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/cor_palete.dart';
import 'package:http/http.dart' as http;

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  TextEditingController mobileNumber=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController message=TextEditingController();
  Widget _child=Text(
    'Send',
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
  );
  @override
  Widget build(BuildContext context) {

    Future<void> sendEmail() async {
      await StatusBarControl.setHidden(
          false, animation: StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/contact_us_email.php";
      var response = await http.post(Uri.parse(url), body: {
        "msg": "Name : ${name.text}\nEmail: ${email.text}\nMobile:${mobileNumber.text}\nMessage: ${message.text}",
      });

      print(response.body);
      Fluttertoast.showToast(
          msg: "Sent successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          //backgroundColor: primaryColor,
          textColor: Colors.white,
          fontSize: 16.0
      );
      setState(() {
        name.clear();
        email.clear();
        mobileNumber.clear();
        message.clear();
        _child=Text(
          'Send',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
        );
      });
    }
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: GestureDetector(
          onTap: (){

            if(name.text=="" || email.text=="" || message.text==""){
              print(email.text);
              Fluttertoast.showToast(
                  msg: "Please provide all required details",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  //backgroundColor: primaryColor,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }

            else{

              setState(() {
                _child=CircularProgressIndicator(color: Colors.white,);
              });
              print('object');
              sendEmail();


            }
          },
          child: Container(
            alignment: Alignment.center,
            height: 58,
            width: MediaQuery.of(context).size.width-60,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)
            ),
            child: _child
          ),
        ),
      ),
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
                  Text('Contact US', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                ],
              ),
            ),
          )];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () async {
                      print('tapped');
                      await launchUrl(Uri.parse('mailto:kennedygeorge1505@gmail.com'));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.email_outlined, color: Colors.green, size: 25,),
                          SizedBox(height: 8,),
                          Text('Email Us', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: () async {
                      print('tapped');
                      await launchUrl(Uri.parse('https://www.youtube.com/'));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.web, color: Colors.green, size: 25,),
                          SizedBox(height: 8,),
                          Text('Visit Website', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>FAQPage()));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Iconsax.search_normal, color: Colors.green, size: 25,),
                          SizedBox(height: 5,),
                          Text('Search FAQ', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
          
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text('Fill out the below form to raise a request...',
                      style:TextStyle(color: Colors.white, fontSize: 14) ,),
                  ),
                ],
              ),
              //Name Input
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
                      SizedBox(width: 10),
                      Icon(Iconsax.user, color: Colors.grey,),
                      SizedBox(width: 10,),
                      Text('|', style: TextStyle(fontSize: 33, color: Colors.grey),),
                      SizedBox(width: 10,),
                      Expanded(
                          child: TextFormField(
                              controller: name,
                              decoration: InputDecoration(border: InputBorder.none, hintText: 'Name*', hintStyle: TextStyle(color: Colors.grey)),
                              keyboardType: TextInputType.name,
          
                          )
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
                      SizedBox(width: 10),
                      Icon(Icons.email_outlined, color: Colors.grey,),
                      SizedBox(width: 10,),
                      Text('|', style: TextStyle(fontSize: 33, color: Colors.grey),),
                      SizedBox(width: 10,),
                      Expanded(
                          child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(border: InputBorder.none, hintText: 'Email*', hintStyle: TextStyle(color: Colors.grey)),
                              keyboardType: TextInputType.emailAddress,
          
                          )
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
                      SizedBox(width: 10),
                      Icon(Iconsax.call, color: Colors.grey,),
                      SizedBox(width: 10,),
                      Text('|', style: TextStyle(fontSize: 33, color: Colors.grey),),
                      SizedBox(width: 10,),
                      Expanded(
                          child: TextFormField(
                            controller: mobileNumber,
                              decoration: InputDecoration(border: InputBorder.none, hintText: 'Mobile', hintStyle: TextStyle(color: Colors.grey)),
                              keyboardType: TextInputType.phone,
                              onChanged: (value){
                                if(value.length>=10){
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ]
          
                          )
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
                      SizedBox(width: 10),
                      Icon(Iconsax.message, color: Colors.grey,),
                      SizedBox(width: 10,),
                      Text('|', style: TextStyle(fontSize: 33, color: Colors.grey),),
                      SizedBox(width: 10,),
                      Expanded(
                          child: TextFormField(
                            controller: message,
                            decoration: InputDecoration(border: InputBorder.none, hintText: 'Message*', hintStyle: TextStyle(color: Colors.grey)),
                            keyboardType: TextInputType.multiline,
          
                          )
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendEmailMessage() {}
}
