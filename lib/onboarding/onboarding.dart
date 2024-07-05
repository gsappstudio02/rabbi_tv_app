import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';

class AppOnboardingPage extends StatefulWidget {
  const AppOnboardingPage({Key? key}) : super(key: key);

  @override
  State<AppOnboardingPage> createState() => _AppOnboardingPageState();
}

class _AppOnboardingPageState extends State<AppOnboardingPage> {
  late CachedVideoPlayerPlusController controller;
  @override
  void initState() {
    super.initState();
    controller = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(
        'https://res.cloudinary.com/gssappstudio/video/upload/v1719506531/onboarding_izrai6.mp4',
      ),
      httpHeaders: {
        'Connection': 'keep-alive',
      },
      invalidateCacheIfOlderThan: const Duration(minutes: 10),
    )..initialize().then((value) async {
      await controller.setLooping(true);
      controller.play();
      setState(() {});
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: CachedVideoPlayerPlus(controller, ),
            )
                : const CircularProgressIndicator.adaptive(),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black.withOpacity(0.5),
          )
        ],
      )
    );
  }
}
