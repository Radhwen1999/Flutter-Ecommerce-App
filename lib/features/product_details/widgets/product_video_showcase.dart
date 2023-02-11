import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ProductVideoShowcase extends StatefulWidget {
  const ProductVideoShowcase({Key? key}) : super(key: key);

  @override
  State<ProductVideoShowcase> createState() => _ProductVideoShowcase();
}

class _ProductVideoShowcase extends State<ProductVideoShowcase> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/img/g22.mp4');
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setVolume(0);
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    _controller.setPlaybackSpeed(1.5);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(

          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
      ),
      height: 250,
      width: double.maxFinite,
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      ),
    );
  }
}