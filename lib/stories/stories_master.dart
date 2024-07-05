import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rabbi_tv_app/stories/stories_ui.dart';
import 'package:shimmer_pro/shimmer_pro.dart';
import 'dart:convert';

import 'package:status_bar_control/status_bar_control.dart';

import '../models/cor_palete.dart';

class StoryMaster extends StatefulWidget {
  const StoryMaster({Key? key}) : super(key: key);

  @override
  State<StoryMaster> createState() => _StoryMasterState();
}

class _StoryMasterState extends State<StoryMaster> {
  @override
  Widget build(BuildContext context) {
    Future<List<Story_feeds>> ReadStoryData() async {
      await StatusBarControl.setHidden(false, animation:StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/story_master.php";
      var response = await http.post(Uri.parse(url));
      print(response.body);
      final list = json.decode(response.body.toString()) as List<dynamic>;
      return list.map((e) => Story_feeds.fromJson(e)).toList();
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: FutureBuilder(
        future: ReadStoryData(),
        builder: (_, data){
          if(data.hasData){
            var items=data.data as List<Story_feeds>;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
                itemBuilder: (_, index){
                  return StoriesUI(higlightsName: items[index].highlights_name.toString(), cover_img: items[index].category_id.toString(),);
                }
            );
          }
          else{
            return ShimmerPro.generated(
              scaffoldBackgroundColor: Pallette.backgroundColor,
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ],
              ),

            );
          }
        },
      ),
    );
  }
}
class Story_feeds {
  String? category_id;
  String? highlights_name;


  Story_feeds(this.category_id, this.highlights_name,);

  Story_feeds.fromJson(Map<String, dynamic> json) {
    category_id = json['cover_img'];
    highlights_name = json['highlights_name'];

  }

}