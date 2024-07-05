import 'dart:io';

import 'package:flutter/material.dart';

class UpdateApp extends StatefulWidget {
  const UpdateApp({Key? key}) : super(key: key);

  @override
  State<UpdateApp> createState() => _UpdateAppState();
}

class _UpdateAppState extends State<UpdateApp> {
  @override
  Widget build(BuildContext context) {
    double width_size=MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        child: GestureDetector(

          onTap: (){
            if(Platform.isAndroid){
              print('Android');
            }
            else if(Platform.isIOS){
              print('IOS');
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
              'Update now',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('New Version!', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            Image.asset('assets/images/update_app.png'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('We added lots of new features and fixed some bugs to make your expereience as smooth as possible',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),),
            ),

          ],
        )
      ),
    );
  }
}
