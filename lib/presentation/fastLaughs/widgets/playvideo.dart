import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
const videosList=[
  'https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4'
  'https://assets.mixkit.co/videos/preview/mixkit-animation-of-futuristic-devices-99786-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-watching-a-cartoon-while-having-a-snack-26208-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-crowds-of-people-cross-a-street-junction-4401-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-red-frog-on-a-log-1487-large.mp4',
];
class VideoPlay extends StatefulWidget {
  int index;
  VideoPlay({Key? key ,required this.index}) : super(key: key);

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late VideoPlayerController _videocontroller;
  @override
  void initState() {
    _videocontroller = VideoPlayerController.network(videosList[widget.index]);
    _videocontroller.initialize().then((value) {
      setState(() {
        _videocontroller.play();
      });
    });
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: _videocontroller.value.isInitialized?
      AspectRatio(aspectRatio: _videocontroller.value.aspectRatio,
      child: VideoPlayer(_videocontroller),
      )
      :Center(child: CircularProgressIndicator())
      
      
    );
    
  }
  
  @override
  void dispose() {
    _videocontroller.dispose();
    super.dispose();
  }
}