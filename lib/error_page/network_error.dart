import 'package:flutter/material.dart';
import 'package:rabbi_tv_app/main.dart';
import 'package:rabbi_tv_app/models/cor_palete.dart';

class NetworkError extends StatefulWidget {
  const NetworkError({Key? key}) : super(key: key);

  @override
  State<NetworkError> createState() => _NetworkErrorState();
}

class _NetworkErrorState extends State<NetworkError> {
  @override
  Widget build(BuildContext context) {
    double height_size=MediaQuery.of(context).size.height;
    double width_size=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
          children:
      [
        Image.asset('assets/images/ln1.png', height: height_size, width: width_size, fit: BoxFit.cover,),
        Positioned(
          bottom: 100,
          left: 80,
          right: 80,
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>MyApp()));
            },
            child: Container(
              alignment: Alignment.center,
              height: 55,
              width: 150,
              decoration: BoxDecoration(
                color: Pallette.backgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: Offset(0,1)
                  )
                ]
              ),
              child: Text('Retry'),
            ),
          ),
        )
      ]),
    );
  }
}
