import 'package:flutter/material.dart';
import 'package:innertune_replica/entities/album.dart';
import 'package:innertune_replica/main.dart';
import 'package:innertune_replica/widgets/playlistScreen.dart';
import 'package:innertune_replica/widgets/searchbar.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<StatefulWidget> createState() =>
    _ExploreScreenStatus();
}
class _ExploreScreenStatus extends State<ExploreScreen>{
  @override
  Widget build(BuildContext context) {
    var appState=context.watch<MyAppState>();
    return SingleChildScrollView(
      child: Column(children: [
        SearchBarWidget(),
        TextButton(
          onPressed: (){},
          style: TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 145, 176, 206)),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text("New release álbuns",style:TextStyle(fontWeight:FontWeight.bold,fontSize:22)),
            Icon(Icons.arrow_forward)
          ])
        ),
        Padding(
          padding: const EdgeInsets.only(top:10,bottom:35),
          child: SizedBox(
            height:160,
            child: ListView(
              shrinkWrap:true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: _getAlbumList(appState.releaseAlbums)
            ),
          ),
        ),
        TextButton(
          onPressed: (){},
          style: TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 145, 176, 206)),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text("Moods and Genres",style:TextStyle(fontWeight:FontWeight.bold,fontSize:22)),
            Icon(Icons.arrow_forward)
          ])
        ),
        //TODO: mood and genres list
      ])
    );
  }

  List<Widget> _getAlbumList(List<Album> albums){
    List<Widget> albumList=[];
    for(Album album in albums){
      albumList.add(
        Padding(
          padding: const EdgeInsets.only(left:10,right:15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width:120,
                child: AspectRatio(
                  aspectRatio:1,
                  child:Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: GestureDetector(
                            onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>const PlaylistScreen()));},
                            child: Image.network(album.coverImageUrl,fit:BoxFit.fill))
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow)),
                      )
                    ],
                  ),
                ),
              ),
              TextScroll(album.name,style:TextStyle(fontWeight: FontWeight.bold)),
              TextScroll(album.artist,style:TextStyle(fontSize:12))
            ],
          ),
        )
      );
    }
    return albumList;
  }
}