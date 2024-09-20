import 'package:flutter/material.dart';

class Song{
  String name;
  String artist;
  int duration;
  String imageUrl;


  Song(this.name,this.artist,this.duration,this.imageUrl);

  Widget getImage(){
    return Image.network(imageUrl,fit:BoxFit.cover);
  }
}