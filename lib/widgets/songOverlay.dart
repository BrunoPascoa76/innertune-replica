import 'package:flutter/material.dart';
import 'package:innertune_replica/main.dart';
import 'package:innertune_replica/widgets/songScreen.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

class SongOverlay extends StatefulWidget{
  Widget child;
  
  SongOverlay(this.child);

  @override
  State<StatefulWidget> createState() => _SongOverlayState();
}

class _SongOverlayState extends State<SongOverlay>{
  @override
  Widget build(BuildContext context) {
    MyAppState appState=context.watch<MyAppState>();
    return Stack(
      children: [
        widget.child,
        if (appState.currentSong!=null) Hero(
          tag:'songOverlay',
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 76,
              child: Dismissible(
                key: Key("songOverlay"),
                direction: DismissDirection.down,
                onDismissed: (direction){setState((){appState.currentSong=null;});},
                child: ElevatedButton(
                  onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>const SongScreen()));},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(top:10),
                    backgroundColor: Color.fromARGB(255,34,38,49),
                    foregroundColor: Colors.white,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                      )
                    )
                  ),
                  child: Column(
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left:10),
                          child: SizedBox(
                            width:50,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(appState.currentSong!.imageUrl,fit:BoxFit.fill)
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:5,right:10),
                          child: SizedBox(
                            width:180,
                            child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [
                              TextScroll(appState.currentSong!.name),
                              TextScroll(appState.currentSong!.artist,style: TextStyle(fontSize:12,color:Color.fromARGB(255,211,	211,	211)))
                            ]),
                          ),
                        ),
                        IconButton(onPressed: (){appState.isPlaying=!appState.isPlaying;setState((){});}, icon: appState.isPlaying?Icon(Icons.pause):Icon(Icons.play_arrow)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.skip_next))
                      ]),
                      Row(children: [
                        Expanded(flex:10,child:Divider(color:Colors.white)),
                        Expanded(flex:appState.currentSong!.duration-10,child:Divider(color:Colors.grey))
                      ])
                    ],
                  )
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}