import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'package:status_bar_control/status_bar_control.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/cor_palete.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    Future<List<Live_feeds>> ReadJsonData() async {
      await StatusBarControl.setHidden(false, animation:StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/events.php";
      var response = await http.post(Uri.parse(url));
      print(response.body);
      final list = json.decode(response.body.toString()) as List<dynamic>;
      return list.map((e) => Live_feeds.fromJson(e)).toList();
    }
    return Scaffold(
      body: NestedScrollView(
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
                      Text('Events', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                    ],
                  ),

                ],
              ),
            ),
          )];
        },
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (_, data){
            if(data.hasData){
              var items=data.data as List<Live_feeds>;
              return MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (_, index){
                      return Container(
                        height: 340,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(items[index].month.toString(),style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 18),),
                                      Text(items[index].date.toString(),style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w700, fontSize: 16),)
                                    ],
                                  ),
                                  SizedBox(width: 16,),
                                  GestureDetector(
                                    onTap: (){
                                      showImageViewer(
                                        context,
                                        Image.network(items[index].video_id.toString()).image,
                                        swipeDismissible: true,
                                        doubleTapZoomable: true,
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        items[index].video_id.toString(),
                                        height: 200,
                                        width: MediaQuery.of(context).size.width-100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 15,),
                              Padding(
                                  padding: const EdgeInsets.only(left: 58.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(items[index].title.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),),
                                      Text(items[index].subtitle.toString()+' | '+items[index].desc.toString(), style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14),),
                                      SizedBox(height: 10,),
                                      items[index].registration.toString().contains("http")?Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () async {
                                                print('pressed');
                                                var uri = Uri.parse(items[index].notified.toString());
                                                if (await canLaunchUrl(uri)){
                                                  await launchUrl(uri);
                                                } else {
                                                  // can't launch url
                                                }
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 48,
                                                //width: 130,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius: BorderRadius.circular(8)
                                                ),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Iconsax.notification5, size: 20,),
                                                    SizedBox(width: 5,),
                                                    Text('Get Notified', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () async {
                                                print('pressed');
                                                var uri = Uri.parse(items[1].registration.toString());
                                                if (await canLaunchUrl(uri)){
                                                  await launchUrl(uri);
                                                } else {
                                                  // can't launch url
                                                }
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 48,
                                                //width: 130,
                                                decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius: BorderRadius.circular(8)
                                                ),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Iconsax.paperclip_25, size: 20,),
                                                    SizedBox(width: 5,),
                                                    Text('Register', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ):Row(
                                        children: [Expanded(
                                          child: GestureDetector(
                                            onTap: () async {
                                              print('pressed');
                                              var uri = Uri.parse(items[index].notified.toString());
                                              if (await canLaunchUrl(uri)){
                                                await launchUrl(uri);
                                              } else {
                                                // can't launch url
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 48,
                                              //width: 130,
                                              decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.circular(8)
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Iconsax.notification5, size: 20,),
                                                  SizedBox(width: 5,),
                                                  Text('Get Notified', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )],
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                      );
                    }
                ),
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

}

class Live_feeds {
  String? title;
  String? subtitle;
  String? video_id;
  String? date;
  String? month;
  String? desc;
  String? registration;
  String? notified;

  Live_feeds(this.title, this.subtitle, this.date, this.video_id, this.month, this.desc, this.notified, this.registration);

  Live_feeds.fromJson(Map<String, dynamic> json) {
    date = json['mag_date'];
    month = json['mag_month'];
    video_id = json['cover_img'];
    title = json['mag_title'];
    subtitle = json['mag_subtitle'];
    desc = json['location'];
    notified = json['event_notifier'];
    registration = json['event_registration'];
  }

}