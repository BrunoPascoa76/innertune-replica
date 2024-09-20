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
            height: 30.0,
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
          //TODO: add "quando adicioada row"
          //TODO: add playlists
        ]
      ),
    );
  }
}

Widget playlistFilter(String name){
  return Padding(
    padding: EdgeInsets.only(left: 12),
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
        padding: WidgetStatePropertyAll(EdgeInsets.only(left:15,right:15))
      ),
      child: Text(name,style: TextStyle(fontSize: 15)),
    )
  );
}