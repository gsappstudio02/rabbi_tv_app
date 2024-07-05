import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:status_bar_control/status_bar_control.dart';
import '../models/cor_palete.dart';
import 'magazines_details.dart';

class EMagazinesViewAll extends StatefulWidget {
  const EMagazinesViewAll({Key? key}) : super(key: key);

  @override
  State<EMagazinesViewAll> createState() => _EMagazinesViewAllState();
}

class _EMagazinesViewAllState extends State<EMagazinesViewAll> {
  @override
  Widget build(BuildContext context) {
    Future<List<Live_feeds>> ReadJsonData() async {
      await StatusBarControl.setHidden(false, animation:StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/e_magazine.php";
      var response = await http.get(Uri.parse(url));
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
                  Text('E-Magazines', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                ],
              ),
            ),
          )];
        },
        body:FutureBuilder(
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
                            childAspectRatio: 0.9
                        ),
                        itemCount: items.length,
                        itemBuilder: (_, index){
                          return Padding(
                            padding: const EdgeInsets.only( right: 20),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>MagazinesDetails(
                                  cover_img: items[index].video_id.toString(),
                                  author: items[index].author.toString(),
                                  title: items[index].title.toString(),
                                  subtitle: items[index].subtitle.toString(),
                                  pdf_url: items[index].pdf_url.toString(),
                                )));
                                //Navigator.push(context, MaterialPageRoute(builder: (builder)=>VideoDetails(videoId: widget.contenList[index])));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0, bottom: 15),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(items[index].video_id.toString(),
                                    width: MediaQuery.of(context).size.width/3,
                                    height: MediaQuery.of(context).size.height/8.0, fit: BoxFit.cover,),
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
  String? magdate;
  String? pdf_url;
  String? author;

  Live_feeds(this.title, this.subtitle, this.date, this.video_id, this.month, this.magdate, this.pdf_url, this.author);

  Live_feeds.fromJson(Map<String, dynamic> json) {
    date = json['video_date'];
    month = json['mag_month'];
    video_id = json['cover_img'];
    title = json['mag_title'];
    subtitle = json['mag_subtitle'];
    magdate = json['mag_date'];
    pdf_url = json['pdf_url'];
    author = json['mag_author'];

  }

}