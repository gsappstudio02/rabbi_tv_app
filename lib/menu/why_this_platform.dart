import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../models/cor_palete.dart';

class WhyThisPlatform extends StatefulWidget {
  const WhyThisPlatform({Key? key}) : super(key: key);

  @override
  State<WhyThisPlatform> createState() => _WhyThisPlatformState();
}

class _WhyThisPlatformState extends State<WhyThisPlatform> {
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
                  Text('Why this platform', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                ],
              ),
            ),
          )];
        },
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width-30,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(08, 20, 30, 1),
                          Color.fromRGBO(55, 70, 93, 1),

                        ]
                    ),
                    boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(2,2)
                    )],
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(height: 15,),
              Text("Rabbi TV, is an initiative to spread gospel around the world through the far reaching digital media platform. Rabbi TV is a platform to stream exclusive christian contents 24x7, the gospel of Jesus Christ is shared in multiple language and we are planning to spread across multiple languages too. Rabbi TV is birthed from the vision of Bro. Vimlaraj and team with the sole purpose of taking gospel to the ends of the earth and thereby preparing the nations for the presence of Jesus Christ. We are available in multiple platforms such as Android, IOS and soon will be available for Android TV, any upcoming digital formats. Rabbi TV delicately ventures in search of every soul everywhere, doing the work of missionary of Jesus Christ. Rabbi TV© all rights reserved. ",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
            ],
          ),
        ),
      ),
    );
  }
}
