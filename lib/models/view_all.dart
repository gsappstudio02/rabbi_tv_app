import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:status_bar_control/status_bar_control.dart';
import '../video/video_details.dart';
import 'cor_palete.dart';
import 'package:rabbi_tv_app/models/data_as_list.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({Key? key, required this.contentType, required this.category }) : super(key: key);
 final String contentType;
 final String category;
  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
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
                  Text(widget.contentType, style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                ],
              ),
            ),
          )];
        },
          body: FutureBuilder(
              future: ReadJsonData(),
              builder: (BuildContext context, data){
                if(data.hasData){
                  var items=data.data as List<Live_feeds>;
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.8
                          ),
                          itemCount: items.length,
                          itemBuilder: (_, index){
                            return Padding(
                              padding: const EdgeInsets.only( right: 20),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>
                                      VideoDetails(
                                        videoId: items[index].video_id.toString(),
                                        contenList: promiseWordList,
                                        title: items[index].title.toString(),
                                        dates: items[index].date.toString(),
                                        descriptions: items[index].desc.toString(),
                                        author: items[index].month.toString(),
                                        duration: 500.toString(), category: widget.category,)));
                                  //Navigator.push(context, MaterialPageRoute(builder: (builder)=>VideoDetails(videoId: widget.contenList[index])));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0, bottom: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network('https://img.youtube.com/vi/'+items[index].video_id.toString()+'/maxresdefault.jpg',
                                      width: 180,height: 100, fit: BoxFit.cover,),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                }
                else{
                  return MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: GridView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.6
                        ),
                        itemCount: 10,
                        itemBuilder: (_, index){
                          return Padding(
                            padding: const EdgeInsets.only( right: 20),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, bottom: 15),
                              child: ShimmerPro.sized(
                                  scaffoldBackgroundColor: Pallette.backgroundColor, width: 180,height: 100),
                            ),
                          );
                        }),
                  );
                }
              }
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