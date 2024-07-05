import 'package:flutter/material.dart';

import '../models/cor_palete.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  List<String> FAQTitle=[
    'What is Rabbi TV?',
    'What kind of resource I can access on Rabbi TV?',
    'Is Rabbi TV a free app?',
    'What makes Rabbi TV unique?',
    'How do I register in Rabbi TV?',
    'Is there any premium content in Rabbi TV?',
    'How can I raise copyright claim for any content on Rabbi TV?',

  ];
  List<String> FAQSubitle=[
    'Rabbi TV is an exclusive Christtian OTT platform with exclusive contents which can be access without any concern.',
    'In Rabbi TV you can access exclusive christian contents like Gospel Songs, Worship Series, Gospel Sermons and many more.',
    'Rabbi TV is completely a free app without any premium subscription for any of the content.',
    'Rabbi TV is a completely free app built with latest technology with the prime goal of sharing Gospel across.',
    'You can register using your basic details on mobile number, we use this information for your personalised experience.',
    'No, Rabbi TV does not hold any premium content.',
    'Incase of any copyright claim we request you to raise your concern by sending email to support@rabbitv.app with supporting documents.',

  ];
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
                  Text('FAQ', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                ],
              ),
            ),
          )];
        },
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
              itemCount: FAQTitle.length,
              itemBuilder: (_, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(

                    title: Text(FAQTitle[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),),
                    children: [
                      Text(FAQSubitle[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),),
                    ],
                  ),
                );
              }),
        )
      ),
    );
  }
}
