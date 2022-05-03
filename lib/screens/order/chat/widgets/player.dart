import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../constants/colors_textStyle.dart';
import '../constants/color_constants.dart';

class Player extends StatefulWidget {
 final bool islast;
 final String url;
 final String unique;


 Player({this.islast, this.url,this.unique});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool playing=false;
  Duration duration=Duration.zero;
  Duration position=Duration.zero;
  String path="";
  bool paused=false;



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    AudioPlayer.players.forEach((key, value) {value.stop();});
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      width: 200,
      decoration: BoxDecoration(color: ColorConstants.greyColor2, borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(bottom: widget.islast? 20 : 10, right: 10),

      child: Row(
        children: [

          InkWell(
            onTap: getAudio,
            child: Icon(playing?Icons.pause:Icons.play_arrow),
          ),
          Expanded(child:
          SliderTheme(
            data: SliderThemeData(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6)
            ),child: Slider(
            activeColor: redColor,
            min: 0,
            max:duration.inSeconds.toDouble() ,
            value: position.inSeconds.toDouble(),
              onChanged: (double value) {
                setState(() {
                  audioPlayer.seek(new Duration(seconds: value.toInt()));
                });
              }),
          ),)


        ],
      ),

    );
  }

  void getAudio() async {

final bytes = await readBytes(Uri.parse(widget.url));
final dir = await getApplicationDocumentsDirectory();
final file = File('${dir.path}/audio${widget.unique}.mp3');
await file.writeAsBytes(bytes);

    if (await file.exists()) {
      path=file.path;
      if (position.inSeconds.toDouble() == 0.0) {
        AudioPlayer.players.forEach((key, value) {
          value.stop();
        });
        setState(() {
          position = new Duration();
          playing = false;

        });
      }
      if (playing) {
        //pause

        var res = await audioPlayer.pause();

        if (res == 1) {
          setState(() {
            playing = false;
          });
        }
      } else {
        print("b 2alb l play bl plsyrt l path is :${path}");
        //play
        var res = await audioPlayer.play(path, isLocal: true);
        if (res == 1) {
          setState(() {
            playing = true;
          });
        }
      }
      audioPlayer.onDurationChanged.listen((Duration dd) {
        setState(() {
          duration = dd;
        });
      });
      audioPlayer.onAudioPositionChanged.listen((Duration dd) {
        setState(() {
          position = dd;
        });
      });
      audioPlayer.onPlayerCompletion.listen((value) {
        setState(() {
          position = new Duration();
          playing = false;
          paused=false;
        });
      });
      audioPlayer.onPlayerStateChanged.listen((event) {
        if (event == PlayerState.STOPPED) {
          // setState(() {
          position = new Duration();
          playing = false;
          // });
        }
      });
    } else {
      print("file dosent exist");
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Cannot Find Voice"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"))
            ],
          ));
    }
  }
}
