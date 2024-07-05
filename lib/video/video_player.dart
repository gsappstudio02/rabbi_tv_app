import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rabbi_tv_app/models/cor_palete.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key, required this.title, required this.videoId, required this.subtitle}) : super(key: key);
  final String title;
  final String videoId;
  final String subtitle;
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller=YoutubePlayerController(
        initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        isLive: false,
        autoPlay: true,
        forceHD: true,
        controlsVisibleAtStart: true,
        hideThumbnail: false,
        mute: false,
        disableDragSeek: false,
        hideControls: false,
      ),
    );
    _controller.toggleFullScreenMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: WillPopScope(
        onWillPop:(){
          print('pressed');
          SystemChrome.setPreferredOrientations([

            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
          Navigator.pop(context);
          return Future(() => false);
        },
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(

            controller: _controller,
            topActions: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width-30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){

                          SystemChrome.setPreferredOrientations([

                            DeviceOrientation.portraitUp,
                            DeviceOrientation.portraitDown,
                          ]);
                          Navigator.pop(context);

                        }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,size: 26)),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(

                              width: MediaQuery.of(context).size.width-130,
                                child: Text(
                                  widget.title,style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                )),
                            SizedBox(height: 5,),
                            Text(widget.subtitle,style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),textAlign: TextAlign.start),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
            progressIndicatorColor: Pallette.backgroundColor,
            progressColors: const ProgressBarColors(
              playedColor: Colors.red,
              handleColor: Colors.amberAccent,

            ),
            onReady: () {
              //_controller.addListener(listener);
            },
          ), builder: (BuildContext , player ) {
            return Scaffold(
              body: player,
            );
        },
        ),
      ),
    );
  }
}
