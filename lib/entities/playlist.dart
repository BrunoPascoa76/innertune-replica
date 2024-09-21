

import 'package:flutter/material.dart';
import 'package:innertune_replica/entities/song.dart';
import 'package:innertune_replica/widgets/playlistScreen.dart';

class Playlist {
  String name;
  List<Song> songs;

  Playlist(this.name,this.songs);

  Widget generateThumbnail(bool isClickable){
    return Padding(
      padding: EdgeInsets.only(left:10,bottom:15,right:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Stack(
                children:<Widget>[
                  SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxWidth-11,
                    child: _getImageList()
                  ),
                  ElevatedButton(
                    onPressed: isClickable? (){Navigator.push(context,MaterialPageRoute(builder: (context)=>const PlaylistScreen()));}:(){}, //when in the playlist details screen, it is not clickable/nothing happens
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      fixedSize: Size(constraints.maxWidth, constraints.maxWidth-11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: null
                  ),
                ]
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top:5),
            child:Text(style:TextStyle(fontWeight: FontWeight.bold,fontSize:15),name)
          )
        ]
      ),
    );  
  }

  Widget _getImageList(){
    if(songs.length==1){
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: songs[0].getImage()
      );
    }else if (songs.length<=3){
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: GridView.count(
          childAspectRatio: 1,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children: songs.map((s)=>s.getImage()).toList()
        )
      );
    }else{
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child:GridView.count(
          childAspectRatio: 1,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          children:songs.sublist(0,4).map((s)=>s.getImage()).toList()
        )
      );
    }
  }
}