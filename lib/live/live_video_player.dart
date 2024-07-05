import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/cor_palete.dart';

class LiveVideoPlayer extends StatefulWidget {
  const LiveVideoPlayer({Key? key,required this.videoId, required this.subtitle, required this.title}) : super(key: key);
 final String videoId;
 final String title;
 final String subtitle;
  @override
  State<LiveVideoPlayer> createState() => _LiveVideoPlayerState();
}

class _LiveVideoPlayerState extends State<LiveVideoPlayer> {
  late YoutubePlayerController _controller;
  double _currentSliderPosition = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
          autoPlay: true,
          isLive: true,
          forceHD: true,
          controlsVisibleAtStart: true,
          hideThumbnail: false,
          mute: false,
          disableDragSeek: false,
          hideControls: false,
          showLiveFullscreenButton: true),
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
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              SystemChrome.setPreferredOrientations([
                                DeviceOrientation.portraitUp,
                                DeviceOrientation.portraitDown,
                              ]);
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios,
                                color: Colors.white, size: 26)),
                        SizedBox(
                          width: 10,
                        ),
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
                            SizedBox(
                              height: 5,
                            ),
                            Text(widget.subtitle,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
            bottomActions: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    width: 14.0,
                  ),
                  CurrentPosition(),
                  Expanded(
                    child: Padding(
                      child: Slider(
                        value: _currentSliderPosition,
                        onChanged: (value) {
                          _controller.seekTo(
                            Duration(
                              seconds:12,
                            ),
                          );
                        },
                        activeColor: Colors.red,
                        inactiveColor: Colors.transparent,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _controller.seekTo(_controller.metadata.duration),
                    child: Material(
                      color: Colors.red,
                      child: const Text(
                        ' LIVE ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),

                ],
              )
            ],
            progressIndicatorColor: Pallette.backgroundColor,
            progressColors: const ProgressBarColors(
              playedColor: Color.fromRGBO(24, 24, 32, 1),
              handleColor: Colors.amberAccent,
            ),
            onReady: () {
              //_controller.addListener(listener);
            },
          ),
          builder: (BuildContext, player) {
            return Scaffold(
              body: player,
            );
          },
        ),
      ),
    );
  }
}
