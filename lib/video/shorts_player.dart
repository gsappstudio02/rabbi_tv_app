import 'package:flutter/material.dart';
import 'package:reels_viewer/reels_viewer.dart';


class ShortsPlayer extends StatefulWidget {
  const ShortsPlayer({Key? key}) : super(key: key);

  @override
  State<ShortsPlayer> createState() => _ShortsPlayerState();
}

class _ShortsPlayerState extends State<ShortsPlayer> {
  @override
  Widget build(BuildContext context) {
    List<ReelModel> reelsList = [
      ReelModel(
        'https://res.cloudinary.com/gssappstudio/video/upload/v1717945314/ep1.mp4',
        'Rabbi',
      ),ReelModel(
        'https://res.cloudinary.com/gssappstudio/video/upload/v1717945464/ep2.mp4',
        'Rabbi',
      ),ReelModel(
        'https://res.cloudinary.com/gssappstudio/video/upload/v1717945499/ep3.mp4',
        'Rabbi',
      ),
    ];
    return ReelsViewer(
        reelsList: reelsList,
      appbarTitle: 'Short Reels',

    );
  }
}

