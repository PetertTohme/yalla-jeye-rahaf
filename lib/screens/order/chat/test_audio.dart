import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path/path.dart';
import 'package:yallajeye/Services/record_audio.dart';
import 'package:audioplayers/audioplayers.dart';

class TestAudio extends StatefulWidget {
  const TestAudio({Key key}) : super(key: key);

  @override
  State<TestAudio> createState() => _TestAudioState();
}

class _TestAudioState extends State<TestAudio> {
  SoundRecord record=SoundRecord();
  FlutterSoundPlayer audio=FlutterSoundPlayer();


  @override
  void initState() {
    record.init();
    audio.openPlayer();
    super.initState();
  }
  @override
  void dispose() {
    record.dispose();
    audio.closePlayer();
    audio=null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test audio"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: ()async{
                await record.startRecordTest();

              },
              child: Text("Record"),
            ),
            ElevatedButton(
              onPressed: ()async{
                await record.stopRecord();

              },
              child: Text("Stop"),
            ),

            ElevatedButton(
              onPressed: ()async{
                await audio.startPlayer(fromURI: "audio_2.aac");
              },
              child: Text("Play"),
            ),
          ],
        ),
      ),
    );
  }
}
