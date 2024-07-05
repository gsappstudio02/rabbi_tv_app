import 'package:flutter/material.dart';
import 'package:rabbi_tv_app/e_magazine/e-magazines_list.dart';
import 'package:rabbi_tv_app/e_magazine/e-magazines_viewall.dart';
import 'package:rabbi_tv_app/home_page/promise_word.dart';
import 'package:rabbi_tv_app/home_page/topPageContent.dart';
import 'package:rabbi_tv_app/models/data_as_list.dart';
import 'package:rabbi_tv_app/models/notification.dart';
import 'package:rabbi_tv_app/stories/stories_master.dart';
import 'package:status_bar_control/status_bar_control.dart';
import '../models/cor_palete.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  Widget build(BuildContext context) {
    Future<List<Live_feeds>> ReadJsonData() async {
      await StatusBarControl.setHidden(false, animation:StatusBarAnimation.SLIDE);
      var url = "https://www.aaradhna.app/rabbi_app/video_categories.php";
      var response = await http.post(Uri.parse(url));
      print(response.body);
      final list = json.decode(response.body.toString()) as List<dynamic>;
      return list.map((e) => Live_feeds.fromJson(e)).toList();
    }
    return NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (
            BuildContext context, bool innerBoxIsScrolled) {
          return [SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Pallette.backgroundColor,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Rabbi TV', style: TextStyle(fontWeight: FontWeight.bold, color: Pallette.textColor),),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>NotificationPage()));
                      }, icon: Icon(Icons.notifications, size: 30, color: Pallette.textColor,)),
                      //IconButton(onPressed: (){}, icon: Icon(Icons.notifications, size: 30, color: Pallette.textColor,)),
                    ],
                  ),

                ],
              ),
            ),
          )];
        },
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            TopPageContent(),
            SizedBox(height: 20,),
            StoryMaster(),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>EMagazinesViewAll()));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/images/read.jpeg', height: 100, width: MediaQuery.of(context).size.width-30, fit: BoxFit.cover,),
              ),
            ),
            //EMagazines(),
            FutureBuilder(
                future: ReadJsonData(),
                builder: (_,data){
                  if(data.hasData){
                    var items=data.data as List<Live_feeds>;
                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                          itemBuilder: (_,index){
                            return PromiseWord(
                              category: items[index].title.toString(),
                              contenList: songsList,
                              titleOfContent: items[index].title.toString(),
                            );
                          },
                        itemCount: items.length,
                      ),
                    );
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                }),
            //
            // PromiseWord(titleOfContent: 'Promise Word', contenList: promiseWordList, category: 'Promise Word',),
            // PromiseWord(titleOfContent: 'Special Sermons', contenList: specialSermonsList, category: 'Special Sermons',),
            // PromiseWord(titleOfContent: 'Songs', contenList: songsList, category: 'Songs',),
            // //YoutubeShorts()
            //
            // PromiseWord(titleOfContent: 'Testimonies', contenList: songsList, category: 'Testimonies',),
            // PromiseWord(titleOfContent: 'Short Films', contenList: songsList, category: 'Short Films',),
            // PromiseWord(titleOfContent: 'Kids', contenList: songsList, category: 'Kids',),
            // PromiseWord(titleOfContent: 'Others', contenList: songsList, category: 'Others',),

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
    title = json['v_category'];
    subtitle = json['video_subtitle'];
    desc = json['video_description'];
  }

}
