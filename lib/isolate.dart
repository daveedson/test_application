// ignore_for_file: avoid_print, unused_element, unused_local_variable, unnecessary_new

import 'dart:async';
import 'dart:io';
import 'dart:isolate';

///this is where we are going to be creating a new thread to run the method for creating a new born.









  Future<dynamic> initIsolate()async{
      //create new instance of completer..
    Completer completer = new  Completer<SendPort>();

    ReceivePort receivePort = ReceivePort();

    receivePort.listen((message) {
      if(message is SendPort){
        SendPort mainIsolateStream  = message;
        completer.complete(mainIsolateStream);
      }else{
        print("[mainIsolateStream]   $message");
      }
    });

  await Isolate.spawn(myIsolate, receivePort.sendPort);
      return completer.future;
  }



 void myIsolate(SendPort sendPort) {
  ReceivePort receivePort = ReceivePort();

  sendPort.send(receivePort.sendPort);

  receivePort.listen((message) {
    print("[receivePort]    $message");
    exit(0);
  });
  sendPort.send("This is my new Isolate()");

}


void main() async {
 SendPort sendPort = await initIsolate();
 sendPort.send(["hello","world"]);
}

   
  
