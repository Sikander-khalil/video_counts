import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {

  final String id;

  const VideoPlayer({super.key, required this.id});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {

  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(

      autoPlay: true,
      mute: true,

    ),


    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(

        title: Text("Video_player"),

      ),

      body: YoutubePlayer(

        controller: _controller,
        showVideoProgressIndicator: true,
       onReady: () {
         print("Player is Ready");
      },

      ),



    );
  }
}
