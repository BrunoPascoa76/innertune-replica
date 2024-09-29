import 'package:flutter/material.dart';
import 'package:innertune_replica/entities/song.dart';
import 'package:innertune_replica/main.dart';
import 'package:innertune_replica/widgets/searchbar.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() =>
    _HomeScreenStatus();
}
class _HomeScreenStatus extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    var appState=context.watch<MyAppState>();
    return SingleChildScrollView(
      child: Column(children: [
        SearchBarWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize:MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: (){},
                  style: IconButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,34,38,49),
                  ),
                  splashRadius: 200,
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.history),
                  )),
                Text("History")
              ]
            ),
            Column(
              mainAxisSize:MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: (){},
                  style: IconButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,34,38,49),
                  ),
                  splashRadius: 200,
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.trending_up),
                  )),
                Text("Stats")
              ]
            ),
            Column(
              mainAxisSize:MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: (){},
                  style: IconButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,34,38,49),
                  ),
                  splashRadius: 200,
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.person),
                  )),
                Text("Account")
              ]
            ),
          ]
        ),
        Padding(
          padding: const EdgeInsets.only(top:30,left:10),
          child: Align(alignment:Alignment.centerLeft,child: Text("Quick Picks",style:TextStyle(fontWeight:FontWeight.bold,fontSize:22,color:Color.fromARGB(255, 145, 176, 206)))),
        ),
        Padding(
          padding: const EdgeInsets.only(top:12),
          child: SizedBox(
            height:225,
            width:double.infinity,
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              crossAxisCount: 4,
              childAspectRatio: .17/1,
              children: _getQuickPicks(appState.quickPicks)
            ),
          ),
        )
      ]
      )
    );
  }

  List<Widget> _getQuickPicks(List<Song> songs){
    List<Widget> lst=[];
    for(Song song in songs){
      lst.add(SizedBox(
        width: 100,
        child: Row(children: [
          SizedBox(
            height:50,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(song.imageUrl,fit:BoxFit.fill)
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:10),
              child: Column(children: [
                Align(alignment:Alignment.centerLeft,child: TextScroll(song.name,style:TextStyle(fontWeight: FontWeight.bold))),
                Padding(
                  padding: const EdgeInsets.only(top:5),
                  child: Align(alignment:Alignment.centerLeft,child: TextScroll(song.artist,style:TextStyle(fontSize:12,color:Color.fromARGB(255,211,	211,	211)))),
                )
              ]),
            ),
          ),
          Align(alignment:Alignment.centerRight,child:IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)))
        ]),
      ));
    }
    return lst;
  }
}