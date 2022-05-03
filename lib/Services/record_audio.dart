
import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
String fileTest="audio_example3.aac";

class SoundRecord{
  FlutterSoundRecorder _audioRecorder;

  Future init() async{
    _audioRecorder=FlutterSoundRecorder();
     await _audioRecorder.openRecorder();
  }

  void dispose(){
    _audioRecorder.closeRecorder();
    _audioRecorder = null;
  }

  Future startRecord(String filePath) async{
print(filePath);
    await _audioRecorder.startRecorder(toFile: filePath,codec: Codec.mp3);
  }
  Future startRecordTest()async{
    await _audioRecorder.startRecorder(toFile:fileTest);
  }

  Future stopRecord() async{

    await _audioRecorder.stopRecorder();

  }

}