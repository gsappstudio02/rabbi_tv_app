import 'package:flutter/material.dart';
import 'package:rabbi_tv_app/e_magazine/e-magazines_viewall.dart';
import 'package:rabbi_tv_app/e_magazine/magazines_details.dart';
import 'package:rabbi_tv_app/models/cor_palete.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer_pro/shimmer_pro.dart';
import 'package:status_bar_control/status_bar_control.dart';

class EMagazines extends StatefulWidget {
  const EMagazines({Key? key}) : super(key: key);

  @override
  State<EMagazines> createState() => _EMagazinesState();
}

class _EMagazinesState extends State<EMagazines> {
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
    return Container(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('E-Magazines', style: TextStyle(color: Pallette.textColor, fontWeight: FontWeight.w700, fontSize: 14),),
                  GestureDetector(
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (builder)=>ViewAll(contentType: widget.titleOfContent,)));
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>EMagazinesViewAll()));
                      },
                      child: Text('View all', style: TextStyle(color: Pallette.linkColor, fontWeight: FontWeight.w700, fontSize: 14),)),
                ],
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
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
                                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>MagazinesDetails(
                                    cover_img: items[index].video_id.toString(),
                                    author: items[index].author.toString(),
                                    title: items[index].title.toString(),
                                    subtitle: items[index].subtitle.toString(),
                                    pdf_url: items[index].pdf_url.toString(),
                                  )));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(items[index].video_id.toString(),
                                    width: 160,
                                    height: 190, fit: BoxFit.cover,),
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
                                width: MediaQuery.of(context).size.width/2.2,
                                height: MediaQuery.of(context).size.height/8.5,),
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