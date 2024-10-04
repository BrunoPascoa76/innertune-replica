import 'package:flutter/material.dart';
import 'package:innertune_replica/main.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<StatefulWidget> createState() =>
    _SongScreenStatus();
}
class _SongScreenStatus extends State<SongScreen>{
  @override
  Widget build(BuildContext context) {
    var appState=context.watch<MyAppState>();
    return Hero(tag: 'songOverlay', child:Scaffold(
      body:SafeArea(
        child: Dismissible(
          key: Key("songScreen"),
          direction: DismissDirection.down,
          onDismissed: (_)=>Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left:30,right:30,top:60),
            child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(appState.currentSong!.imageUrl,fit:BoxFit.fill)
                ),
              ),
              Padding(padding: EdgeInsets.only(top:40),child:TextScroll(appState.currentSong!.name,style:TextStyle(fontSize:22,fontWeight: FontWeight.bold))),
              Text(appState.currentSong!.artist,style:TextStyle(fontSize:18)),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:[
                  Row(children: [
                    IconButton.filled(onPressed:(){},icon: Icon(Icons.radio),style:IconButton.styleFrom(backgroundColor: Color.fromARGB(255,64,71,89),foregroundColor: Colors.white)),
                    IconButton.filled(onPressed:(){},icon: Icon(Icons.download_for_offline),style:IconButton.styleFrom(backgroundColor: Color.fromARGB(255,64,71,89),foregroundColor: Colors.white)),
                    IconButton.filled(onPressed:(){},icon: Icon(Icons.playlist_add),style:IconButton.styleFrom(backgroundColor: Color.fromARGB(255,64,71,89),foregroundColor: Colors.white)),
                    IconButton.filled(onPressed:(){},icon: Icon(Icons.dark_mode_outlined),style:IconButton.styleFrom(backgroundColor: Color.fromARGB(255,64,71,89),foregroundColor: Colors.white)),
                  ]),
                    IconButton.filled(onPressed:(){},icon: Icon(Icons.more_horiz),style:IconButton.styleFrom(backgroundColor: Color.fromARGB(255,64,71,89),foregroundColor: Colors.white)),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10,bottom:10),
                child: Divider(color:Color.fromARGB(255,64,71,89)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text("00:00"),
                Text(appState.currentSong!.convertToTimeString())
              ]),
              Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),
                IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous)),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(onPressed: (){
                      appState.isPlaying=!appState.isPlaying;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Color.fromARGB(255,64,71,89),
                      foregroundColor: Colors.white,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.zero
                    ),
                    child:appState.isPlaying?Icon(Icons.pause):Icon(Icons.play_arrow)
                  ),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.skip_next)),
                IconButton(onPressed: (){}, icon: Icon(Icons.lyrics)),
              ]),
              Expanded(child: Align(alignment: Alignment.bottomCenter,child:IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_up))))
            ]),
          ),
        ) 
      )
    ));
  }
}