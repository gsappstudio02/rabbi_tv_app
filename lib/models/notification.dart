import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:status_bar_control/status_bar_control.dart';
import 'cor_palete.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    Future<List<Live_feeds>> ReadJsonData() async {
      await StatusBarControl.setHidden(false, animation:StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/notifications.php";
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
                      Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                    ],
                  ),

                ],
              ),
            ),
          )];
        },
        body: FutureBuilder(
          future: ReadJsonData(),
          builder: (_,data){
            if(data.hasData){
              var items=data.data as List<Live_feeds>;
              return MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (_, index){
                      return Container(
                        alignment: Alignment.center,
                        height: 110,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network('https://img.youtube.com/vi/'+items[index].video_id.toString()+'/maxresdefault.jpg', width: 150, height: 80, fit: BoxFit.cover,),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width-200,
                                    child: Text(items[index].title.toString(),
                                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text(items[index].subtitle.toString(),
                                    style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500, overflow: TextOverflow.ellipsis),
                                    maxLines: 2,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }
            else{
              return MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: 6,
                    itemBuilder: (_, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ShimmerPro.text(scaffoldBackgroundColor: Pallette.backgroundColor),
                      );
                    },
                ),
              );
            }
          },
        )
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

  Live_feeds(this.title, this.subtitle, this.date, this.video_id, this.month, this.desc);

  Live_feeds.fromJson(Map<String, dynamic> json) {
    date = json['video_date'];
    month = json['video_author'];
    video_id = json['video_id'];
    title = json['video_title'];
    subtitle = json['video_subtitle'];
    desc = json['video_description'];
  }

}