import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stories/flutter_stories.dart';
import 'package:http/http.dart' as http;
import 'package:iconsax/iconsax.dart';
import 'package:rabbi_tv_app/models/cor_palete.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:status_bar_control/status_bar_control.dart';
import 'package:status_view/status_view.dart';

class StoriesUI extends StatefulWidget {
  const StoriesUI({Key? key, required this.higlightsName, required this.cover_img}) : super(key: key);
  final String higlightsName;
  final String cover_img;
  @override
  State<StoriesUI> createState() => _StoriesUIState();
}

class _StoriesUIState extends State<StoriesUI> {
  final _momentDuration = const Duration(seconds: 5);
  int cat_id=1;
  @override
  Widget build(BuildContext context) {
    Future<List<Live_feeds>> ReadJsonData() async {
      await StatusBarControl.setHidden(false, animation:StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/story_content.php";
      var response = await http.post(Uri.parse(url), body:{
        "story_category":widget.higlightsName,
      });
      print(response.body);
      final list = json.decode(response.body.toString()) as List<dynamic>;
      return list.map((e) => Live_feeds.fromJson(e)).toList();
    }

    return SizedBox(
      child: FutureBuilder(
          future: ReadJsonData(),
          builder:(_, data){

            if(data.hasData){
              var items=data.data as List<Live_feeds>;
              return Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        showCupertinoDialog(
                            context: context,
                            builder: (_){
                              return CupertinoPageScaffold(
                                  child: Story(
                                    momentBuilder: (BuildContext context, int index) {
                                      return Image.network(items[index].video_id.toString());
                                    },
                                    momentDurationGetter: (int? index) => _momentDuration,
                                    momentCount: items.length,
                                    fullscreen: true,
                                    onFlashForward: Navigator.of(context).pop,
                                    onFlashBack: Navigator.of(context).pop,

                                  )
                              );
                            });
                      },
                      child: StatusView(
                        radius: 30,
                        spacing: 15,
                        strokeWidth: 2,
                        indexOfSeenStatus: items.length,
                        numberOfStatus: items.length,
                        padding: 4,
                        centerImageUrl: widget.cover_img,
                        seenColor: Colors.grey,
                        unSeenColor: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: 70,
                      child: Text(widget.higlightsName,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12, overflow: TextOverflow.ellipsis),
                        maxLines: 1,textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              );
            }
            else{
              return ShimmerPro.generated(
                scaffoldBackgroundColor: Colors.transparent,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50)
                  ),
                ),
                
              );
            }
          }
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
    video_id = json['story_img'];
    title = json['video_title'];
    subtitle = json['video_subtitle'];
    desc = json['video_description'];
  }

}
class Story_feeds {
  String? category_id;
  String? highlights_name;


  Story_feeds(this.category_id, this.highlights_name,);

  Story_feeds.fromJson(Map<String, dynamic> json) {
    category_id = json['category_id'];
    highlights_name = json['highlights_name'];

  }

}