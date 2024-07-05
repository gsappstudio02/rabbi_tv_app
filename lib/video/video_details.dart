import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rabbi_tv_app/models/cor_palete.dart';
import 'package:rabbi_tv_app/video/video_player.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:status_bar_control/status_bar_control.dart';

class VideoDetails extends StatefulWidget {
  const VideoDetails({Key? key,
    required this.videoId,
    required this.contenList,
    required this.title,
    required this.dates,
    required this.descriptions,
    required this.duration,
    required this.author,
    required this.category,
  }) : super(key: key);
  final List<String> contenList;
  final String videoId;
  final String title;
  final String duration;
  final String descriptions;
  final String dates;
  final String author;
  final String category;
  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Future<List<Live_feeds>> ReadJsonData() async {
      print(widget.category);
      await StatusBarControl.setHidden(false, animation:StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/custom_videos.php";
      var response = await http.post(Uri.parse(url), body: {
        "video_category": widget.category,
        "video_id": widget.videoId,

      });
      print(response.body);
      final list = json.decode(response.body.toString()) as List<dynamic>;
      return list.map((e) => Live_feeds.fromJson(e)).toList();
    }
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  child: Image.network('https://img.youtube.com/vi/'+widget.videoId+'/maxresdefault.jpg',
                    width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                Positioned(
                  right: 10,
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Iconsax.close_circle5)))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 7,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 6),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width-40,
                      child: Text(widget.title,
                        style: TextStyle(color: Pallette.textColor, fontSize: 18, fontWeight: FontWeight.w700),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 6),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width-40,
                      child: Row(
                        children: [
                          Text(widget.dates,
                            style: TextStyle(color: Pallette.textColor, fontSize: 12, fontWeight: FontWeight.w500),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 3,),
                          Icon(Icons.remove_red_eye_outlined, size: 18,),
                          SizedBox(width: 10,),
                          Text(Duration(seconds: int.parse(widget.duration)).inMinutes.toString()+' Min',
                            style: TextStyle(color: Pallette.textColor, fontSize: 12, fontWeight: FontWeight.w500),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(width: 3,),
                          Icon(Icons.hd_outlined, size: 18,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 6),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>VideoPlayer(title: widget.title, videoId: widget.videoId, subtitle: widget.category,)));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45,
                          width: MediaQuery.of(context).size.width-40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white.withOpacity(1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow_rounded, color: Colors.black,),
                              Text('Play', style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 6),
                    child: Text(widget.descriptions,
                      style: TextStyle(color: Pallette.textColor, fontSize: 12, fontWeight: FontWeight.w500),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 6),
                    child: Text(widget.author,
                      style: TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w500),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 6),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width-40,
                      child: Text('More like this',
                        style: TextStyle(color: Pallette.textColor, fontSize: 18, fontWeight: FontWeight.w700),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder(
                        future:ReadJsonData(),
                        builder: (_, data){

                          if(data.hasData){
                            var items=data.data as List<Live_feeds>;
                            print('items are'+ items.length.toString());
                            if(items.length > 0){
                              return GridView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.8
                                  ),
                                  itemCount: items.length<=6?items.length:6,
                                  itemBuilder: (_, index){
                                    return Padding(
                                      padding: const EdgeInsets.only( right: 20),
                                      child: GestureDetector(
                                        onTap: (){
                                          //Navigator.push(context, MaterialPageRoute(builder: (builder)=>VideoDetails(videoId: widget.contenList[index])));
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
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0, bottom: 15),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.network('https://img.youtube.com/vi/'+items[index].video_id.toString()+'/maxresdefault.jpg', width: 180,height: 100, fit: BoxFit.cover,),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                            else{
                              print('missing');
                              return GridView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.8
                                  ),
                                  itemCount: items.length<=6?items.length:6,
                                  itemBuilder: (_, index){
                                    return Padding(
                                      padding: const EdgeInsets.only( right: 20),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0, bottom: 15),
                                        child: ShimmerPro.sized(
                                            scaffoldBackgroundColor: Pallette.backgroundColor, width: 180,height: 100),
                                      ),
                                    );
                                  });
                            }
                          }
                          else {
                            print('nulli');
                            return GridView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.8
                                ),
                                itemCount: 6,
                                itemBuilder: (_, index){
                                  return Padding(
                                    padding: const EdgeInsets.only( right: 20),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0, bottom: 15),
                                      child: ShimmerPro.sized(
                                          scaffoldBackgroundColor: Pallette.backgroundColor, width: 180,height: 100),
                                    ),
                                  );
                                });
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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