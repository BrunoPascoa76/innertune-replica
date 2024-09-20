import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget{
  const LibraryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //TODO: add search bar (separate file for reusability)
          //"filters" (for lack of a better term)
          SizedBox(
            height: 50.0,
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                playlistFilter("Playlists"),
                playlistFilter("Músicas"),
                playlistFilter("Álbuns"),
                playlistFilter("Artistas"),
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.only(top:10,bottom:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: (){},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Quando adicionada "),
                      Icon(Icons.arrow_downward)
                    ],
                  )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.grid_view)) 
              ]
          )
          ),
          GridView.count(
            childAspectRatio: 1,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: [
              iconPlaylist(Icons.favorite,"Liked"),
              iconPlaylist(Icons.download_for_offline, "Downloaded"),
              iconPlaylist(Icons.trending_up, "My Top 50")
            ]
          )
        ]
      ),
    );
  }
}

Widget playlistFilter(String name){
  return Padding(
    padding: EdgeInsets.only(left: 12,bottom:20),
    child: TextButton(
      onPressed: (){},
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((state) => Color.fromARGB(255, 189, 188, 188)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          side: BorderSide(
            color: Color.fromARGB(255, 156, 156, 156),
            width: 1
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        )),
        padding: WidgetStatePropertyAll(EdgeInsets.only(left:15,right:15,top:2,bottom:2))
      ),
      child: Text(name,style: TextStyle(fontSize: 15)),
    )
  );
}

Widget iconPlaylist(IconData icon,String text){
    return Padding(
      padding: EdgeInsets.only(left:10,bottom:15,right:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Color.fromARGB(255, 189, 188, 188),
                backgroundColor: Color.fromARGB(255,64,71,89),
                fixedSize: Size(constraints.maxWidth, constraints.maxWidth-11),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Icon(icon,size:80),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top:5),
            child:Text(style:TextStyle(fontWeight: FontWeight.bold,fontSize:15),text)
          )
        ]
      ),
    );  
}