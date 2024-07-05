import 'package:flutter/material.dart';
import 'package:rabbi_tv_app/models/data_as_list.dart';
import 'package:rabbi_tv_app/video/shorts_player.dart';

import '../models/cor_palete.dart';

class YoutubeShorts extends StatefulWidget {
  const YoutubeShorts({Key? key}) : super(key: key);

  @override
  State<YoutubeShorts> createState() => _YoutubeShortsState();
}

class _YoutubeShortsState extends State<YoutubeShorts> {
  @override
  Widget build(BuildContext context) {
    double width_size= MediaQuery.of(context).size.width;
    double height_size= MediaQuery.of(context).size.height;
    return Container(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Short Reels', style: TextStyle(color: Pallette.textColor, fontWeight: FontWeight.w700, fontSize: 14),),
                ],
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: height_size/5+10,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder:(_, index){
                      return Padding(
                        padding: const EdgeInsets.only( right: 20),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>ShortsPlayer()));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'https://img.youtube.com/vi/'+promiseWordList[index]+'/maxresdefault.jpg',
                              height: height_size/5,
                              width: width_size/4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }
                )
              )
            ],
          ),
        )
    );
  }
}
