import 'package:flutter/material.dart';
import 'package:innertune_replica/main.dart';
import 'package:innertune_replica/widgets/songOverlay.dart';
import 'package:provider/provider.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<StatefulWidget> createState() =>
    _PlaylistScreenStatus();
}
class _PlaylistScreenStatus extends State<PlaylistScreen>{
  @override
  Widget build(BuildContext context) {
    var appState=context.watch<MyAppState>();
    String playlistName=appState.selectedPlaylist!.name;
    int numberOfSongs=appState.selectedPlaylist!.songs.length;
    String totalDuration=appState.selectedPlaylist!.totalDuration();
    return Scaffold(
      body:SafeArea(
        child: SongOverlay(SingleChildScrollView(
          child:Column(children: [
            //back arrow:
            Align(alignment:Alignment.centerLeft,child:IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color:Colors.white))), 
            //row with thumbnail:
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Row(children: [
                //thumbnail:
                Expanded(flex:7,child:appState.selectedPlaylist!.generateThumbnail(false)),
                Expanded(flex:6,child:Column(children: [
                  Align(alignment:Alignment.centerLeft,child: Text(playlistName,style:TextStyle(fontWeight: FontWeight.bold,fontSize:22))),
                  Padding(
                    padding: const EdgeInsets.only(top:1),
                    child: Align(alignment:Alignment.centerLeft,child:Text("$numberOfSongs músicas")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:2),
                    child: Align(alignment:Alignment.centerLeft,child:Text(totalDuration)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:6),
                    child: Row(children:[ //edit, download, add to playlist buttons
                      IconButton(onPressed:(){},icon:Icon(Icons.edit),color:Colors.white),
                      IconButton(onPressed:(){},icon:Icon(Icons.download_for_offline),color:Colors.white),
                      IconButton(onPressed:(){},icon:Icon(Icons.queue_music),color:Colors.white),
                    ]),
                  )
                ]))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Row(children: [
                    Expanded(flex:10,child: ElevatedButton.icon(onPressed: (){},icon:Icon(Icons.play_arrow),label:Text("Tocar"),style:ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255,173,198,255),
                      foregroundColor: Color.fromARGB(255,15,45,95)
                    ))),
                    Spacer(flex:1),
                    Expanded(flex:10,child: ElevatedButton.icon(onPressed: (){},icon:Icon(Icons.shuffle),label:Text("Aleatório"),style:ElevatedButton.styleFrom(
                      side: BorderSide(color: Color.fromARGB(255,173,198,255),width: 1),
                      foregroundColor: Color.fromARGB(255,173,198,255)
                    )))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                Expanded(flex:10,child:TextButton(onPressed: (){}, child: Text("Custom order"))),
                Spacer(flex:10),
                IconButton(onPressed: (){}, icon: Icon(Icons.select_all,color:Colors.white)),
                Spacer(flex:1),
                IconButton(onPressed: (){}, icon: Icon(Icons.lock_open,color:Colors.white))
                ]),
            ),
            Column(children: appState.selectedPlaylist!.generateSongList())
          ])
        ))
      )
    );
  }
}