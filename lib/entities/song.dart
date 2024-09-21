import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class Song{
  String name;
  String artist;
  int duration;
  String imageUrl;


  Song(this.name,this.artist,this.duration,this.imageUrl);

  Widget getImage(){
    return Image.network(imageUrl,fit:BoxFit.cover);
  }
  
  String convertToTimeString(){
    int hours=duration ~/ 60;
    int minutes= duration%60;
    return "$hours:$minutes";
  }

  Widget generateListItem(){
    String timeString=convertToTimeString();
    return Padding(
      padding: const EdgeInsets.only(left:10,top:10,bottom:10),
      child: Row(children: [
        Image.network(imageUrl,width:50),
        Expanded(child:Padding(
          padding: const EdgeInsets.only(left:10),
          child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
            Padding(
              padding: const EdgeInsets.only(bottom:3),
              child: TextScroll(name,style: TextStyle(fontWeight: FontWeight.bold),velocity: Velocity(pixelsPerSecond: Offset(50, 0))),
            ),
            Row(children: [
              Icon(Icons.download_for_offline,size:15),
              Text("$artist • $timeString",overflow: TextOverflow.ellipsis)
            ])
          ]),
        )),
        Padding(
          padding: const EdgeInsets.only(left:10,right:20),
          child: Icon(Icons.more_vert),
        ),
        Icon(Icons.drag_handle)
      ]),
    );
  }
}