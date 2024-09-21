import 'package:flutter/material.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<StatefulWidget> createState() =>
    _PlaylistScreenStatus();
}
class _PlaylistScreenStatus extends State<PlaylistScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:SafeArea(child: Column(children: [
      IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color:Colors.white))
      //TODO: picture+playlist details
      //TODO: playlist buttons
      //TODO: sort,...
      //TODO: song list
    ])));
  }
}