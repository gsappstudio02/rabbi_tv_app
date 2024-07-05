import 'package:flutter/material.dart';
import 'package:rabbi_tv_app/models/cor_palete.dart';
import 'package:rabbi_tv_app/models/view_all.dart';
import 'package:rabbi_tv_app/video/video_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:status_bar_control/status_bar_control.dart';

class PromiseWord extends StatefulWidget {
  const PromiseWord({Key? key, required this.titleOfContent, required this.contenList, required this.category}) : super(key: key);

  final String titleOfContent;
  final String category;
  final List<String> contenList;
  @override
  State<PromiseWord> createState() => _PromiseWordState();
}

class _PromiseWordState extends State<PromiseWord> {
  @override
  Widget build(BuildContext context) {
    Future<List<Live_feeds>> ReadJsonData() async {
      await StatusBarControl.setHidden(false, animation:StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/videos_master.php";
      var response = await http.post(Uri.parse(url), body: {
        "video_category": widget.category,

      });
      print(response.body);
      final list = json.decode(response.body.toString()) as List<dynamic>;
      return list.map((e) => Live_feeds.fromJson(e)).toList();
    }
    return Container(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.titleOfContent, style: TextStyle(color: Pallette.textColor, fontWeight: FontWeight.w700, fontSize: 14),),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>ViewAll(contentType: widget.titleOfContent, category: widget.category,)));
                      },
                      child: Text('View all', style: TextStyle(color: Pallette.linkColor, fontWeight: FontWeight.w700, fontSize: 14),)),
                ],
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 130,
                child: FutureBuilder(
                  future: ReadJsonData(),
                  builder: (BuildContext context, data){
                    if(data.hasData){
                      var items=data.data as List<Live_feeds>;
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder:(_, index){
                            return Padding(
                              padding: const EdgeInsets.only( right: 20),
                              child: GestureDetector(
                                onTap: () async {
                                  print(MediaQuery.of(context).size.height);
                                  print(MediaQuery.of(context).size.width);
                                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>
                                      VideoDetails(
                                        videoId: items[index].video_id.toString(),
                                        contenList: widget.contenList,
                                        title: items[index].title.toString(),
                                        dates: items[index].date.toString(),
                                        descriptions: items[index].desc.toString(),
                                        author: items[index].month.toString(),
                                        duration: 500.toString(), category: widget.category,)));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network('https://img.youtube.com/vi/'+items[index].video_id.toString()+'/maxresdefault.jpg',
                                    width: 230,
                                    fit: BoxFit.cover,),
                                ),
                              ),
                            );
                          }
                      );
                    }
                    else{
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder:(_, index){
                            return Padding(
                              padding: const EdgeInsets.only( right: 5),
                              child: ShimmerPro.sized(
                                scaffoldBackgroundColor: Pallette.backgroundColor,
                                width: 170,
                                height: 100),
                            );
                          }
                      );
                    }
                  },
                ),
              )
            ],
          ),
        )
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