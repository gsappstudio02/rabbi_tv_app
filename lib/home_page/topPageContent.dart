import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:status_bar_control/status_bar_control.dart';
import '../models/cor_palete.dart';
import '../models/view_all.dart';
import '../video/video_player.dart';

class TopPageContent extends StatefulWidget {
  const TopPageContent({Key? key}) : super(key: key);

  @override
  State<TopPageContent> createState() => _TopPageContentState();
}

class _TopPageContentState extends State<TopPageContent> {
  @override
  Widget build(BuildContext context) {
    Future<List<Live_feeds>> ReadJsonData() async {
      await StatusBarControl.setHidden(false,
          animation: StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/top_page_content.php";
      var response = await http.post(
        Uri.parse(url),
      );
      print(response.body);
      final list = json.decode(response.body.toString()) as List<dynamic>;
      return list.map((e) => Live_feeds.fromJson(e)).toList();
    }

    double widthSize = MediaQuery.of(context).size.width;
    double heightSize = MediaQuery.of(context).size.height;
    return Center(
        child: FutureBuilder(
      future: ReadJsonData(),
      builder: (_, data) {
        if (data.hasData) {
          var items = data.data as List<Live_feeds>;
          return Container(
            height: heightSize / 2,
            width: widthSize - 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(2, 2))
                ]),
            child: Stack(alignment: Alignment.center, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                      items[0].cover_img.toString(),
                  height: heightSize / 2,
                  width: widthSize - 80,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: heightSize / 2,
                width: widthSize - 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(1)
                        ])),
              ),
              Positioned(
                bottom: 20,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          items[0].subtitle.toString(),
                          style: TextStyle(
                              color: Pallette.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '|',
                          style: TextStyle(
                              color: Pallette.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          items[0].month.toString(),
                          style: TextStyle(
                              color: Pallette.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => VideoPlayer(
                                          title: items[0].title.toString(),
                                          videoId: items[0].video_id.toString(),
                                          subtitle:
                                              items[0].subtitle.toString(),
                                        )));
                          },
                          child: Container(
                            height: 38,
                            width: widthSize * 0.33,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 2))
                                ],
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                Text(
                                  'Play',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>ViewAll(
                              contentType: items[0].desc.toString(),
                              category: items[0].desc.toString(),
                            )));
                          },
                          child: Container(
                            height: 38,
                            width: widthSize * 0.33,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(0, 2))
                                ],
                                borderRadius: BorderRadius.circular(4)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.video_library,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                Text(
                                  ' Episodes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          );
        }
        else {
          return ShimmerPro.sized(scaffoldBackgroundColor: Pallette.backgroundColor, height: heightSize / 2,
            width: widthSize - 80,);
        }
      },
    ));
  }
}

class Live_feeds {
  String? title;
  String? subtitle;
  String? video_id;
  String? date;
  String? month;
  String? desc;
  String? cover_img;

  Live_feeds(this.title, this.subtitle, this.date, this.video_id, this.month,
      this.desc, this.cover_img);

  Live_feeds.fromJson(Map<String, dynamic> json) {
    date = json['video_date'];
    month = json['video_author'];
    video_id = json['video_id'];
    title = json['video_title'];
    subtitle = json['video_subtitle'];
    desc = json['category'];
    cover_img = json['cover_img'];
  }
}
