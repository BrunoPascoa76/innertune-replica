import 'package:flutter/material.dart';
import 'package:innertune_replica/entities/album.dart';
import 'package:innertune_replica/main.dart';
import 'package:innertune_replica/widgets/searchbar.dart';
import 'package:provider/provider.dart';

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
            Text("New release álbuns",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20)),
            Icon(Icons.arrow_forward)
          ])
        ),
        SizedBox(
          height: 100.0,
          child: ListView(
            shrinkWrap:true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: _getAlbumList(appState.newReleaseAlbums)
          ),
        ),
        //TODO: albums carroussel
        TextButton(
          onPressed: (){},
          style: TextButton.styleFrom(foregroundColor: Color.fromARGB(255, 145, 176, 206)),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text("Moods and Genres",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20)),
            Icon(Icons.arrow_forward)
          ])
        ),
        //TODO: mood and genres list
      ])
    );
  }

  List<Widget> getAlbumList(List<Album> albums){
    return []; //TODO: Implement this
  }
}