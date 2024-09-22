import 'package:flutter/material.dart';
import 'package:innertune_replica/main.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<StatefulWidget> createState() =>
    _SearchScreenStatus();
}
class _SearchScreenStatus extends State<SearchScreen>{
  @override
  Widget build(BuildContext context) {
    var appState=context.watch<MyAppState>();
    return Hero(tag: "search screen", child: Scaffold(
      backgroundColor: Color.fromARGB(255,41,42,47),
      body:SafeArea(
        child: Column(children: [
          Row(children: [
            IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
            Expanded(child:TextField(decoration: InputDecoration(hintText: "Pesquisar no Youtube Music...",border:InputBorder.none,hintStyle: TextStyle(fontWeight: FontWeight.normal,color:Colors.grey)),autofocus:true)),
            IconButton(onPressed: (){}, icon: Icon(Icons.language))
          ]),
          Divider(color:Colors.grey),
          Expanded(child:ListView(children:_getSearchHistoryList(appState.searchHistory)))
        ])
    ))
    );
  }
  List<Widget> _getSearchHistoryList(List<String> searchHistory){
    List<Widget> searchHistoryList=[];
    for(String entry in searchHistory){
      searchHistoryList.add(Row(children: [
        Expanded(child:ElevatedButton(
          onPressed: (){},
          style:ElevatedButton.styleFrom(
            backgroundColor:Color.fromARGB(255,41,42,47),
            alignment: Alignment.centerLeft,
            shadowColor: Colors.transparent
          ),
          child:Row(children:[
            Icon(Icons.history,color: Colors.grey),
            Expanded(child:Padding(
              padding: EdgeInsets.only(left:10),
              child:Text(entry,style:TextStyle(color:Colors.white,fontWeight: FontWeight.normal,overflow: TextOverflow.ellipsis))
            )),
          ]),
        )),
        IconButton(onPressed: (){}, icon: Icon(Icons.close,color:Colors.grey)),
        IconButton(onPressed: (){}, icon: Icon(Icons.north_west,color:Colors.grey))
      ]));
    }
    return searchHistoryList;
  }
}