import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:rabbi_tv_app/live/live_video_player.dart';
import 'package:rabbi_tv_app/models/cor_palete.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:status_bar_control/status_bar_control.dart';

class LiveVideos extends StatefulWidget {
  const LiveVideos({Key? key}) : super(key: key);

  @override
  State<LiveVideos> createState() => _LiveVideosState();
}

class _LiveVideosState extends State<LiveVideos> {
  @override
  Widget build(BuildContext context) {
    Future<List<Live_feeds>> ReadJsonData() async {
      await StatusBarControl.setHidden(false, animation:StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/live_feed.php";
      var response = await http.get(Uri.parse(url));
      print(response.body);
      final list = json.decode(response.body.toString()) as List<dynamic>;
      return list.map((e) => Live_feeds.fromJson(e)).toList();
    }
    return NestedScrollView(
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
                  Row(
                    children: [
                      Icon(Icons.live_tv, color: Colors.red, size: 30,),
                      SizedBox(width: 8,),
                      Text('Live', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                    ],
                  ),
                  
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
            print(items);
            if (items.length>0){
              return SingleChildScrollView(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (_, index){
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            height: 290,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Column(
                                      children: [
                                        Text(items[index].month.toString(), style: TextStyle(color: Colors.grey, fontSize: 12),),
                                        Text(items[index].date.toString(), style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w900)),
                                      ],
                                    ),
                                    SizedBox(width: 20,),
                                    Expanded(child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>LiveVideoPlayer(
                                          videoId: items[index].video_id.toString(),
                                          subtitle: items[index].subtitle.toString(),
                                          title: items[index].title.toString(),)));
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network('https://img.youtube.com/vi/'+items[index].video_id.toString()+'/maxresdefault.jpg',
                                          height: MediaQuery.of(context).size.height/4.4, fit: BoxFit.cover,),
                                      ),
                                    )),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 55.0),
                                  child: Text(
                                    items[index].title.toString(),
                                    style: TextStyle(color: Pallette.textColor, fontSize: 18, fontWeight: FontWeight.w800,),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 55.0),
                                  child: Text(
                                    items[index].subtitle.toString(),
                                    style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500,),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
              );
            }
            else{
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/lotties/live_schedule.json', height: 300, width: 300),
                      Text('There is no live programm now, we will notify when we are live',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16), textAlign: TextAlign.center,)
                    ],
                  ),
                ),
                
              );
            }
          }
          else{
            return MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: 3,
                  itemBuilder: (_, index){
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      height: MediaQuery.of(context).size.height/3.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShimmerPro.sized(
                              scaffoldBackgroundColor: Pallette.backgroundColor,
                              height: MediaQuery.of(context).size.height/4.4,
                              width: MediaQuery.of(context).size.width-40),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: ShimmerPro.text(scaffoldBackgroundColor: Pallette.backgroundColor),
                          ),
                        ],
                      ),
                    ),
                  );
                  }),
            );
          }
        },
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

  Live_feeds(this.title, this.subtitle, this.date, this.video_id, this.month);

  Live_feeds.fromJson(Map<String, dynamic> json) {
    date = json['video_date'];
    month = json['video_month'];
    video_id = json['video_id'];
    title = json['video_title'];
    subtitle = json['video_subtitle'];
  }

}