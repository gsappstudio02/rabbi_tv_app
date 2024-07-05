import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

import '../models/cor_palete.dart';

class SupportChannel extends StatefulWidget {
  const SupportChannel({Key? key}) : super(key: key);

  @override
  State<SupportChannel> createState() => _SupportChannelState();
}

class _SupportChannelState extends State<SupportChannel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:NestedScrollView(
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
                  Row(
                    children: [
                      Text('Help', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                    ],
                  ),

                ],
              ),
            ),
          )];
        },
        body: Tawk(
          directChatLink: 'https://tawk.to/chat/6669d8fc9a809f19fb3ce3f5/1i06nf7l5',
        ),
      )
    );
  }
}
