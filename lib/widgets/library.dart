import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget{
  const LibraryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //TODO: add search bar
        //library "filters" (for lack of a better term)
        ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              TextButton(onPressed: (){},child:  Text("abc"))
            ],
          ),
        ]
    );
  }
}