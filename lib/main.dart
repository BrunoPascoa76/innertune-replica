import 'package:flutter/material.dart';
import 'package:innertune_replica/entities/playlist.dart';
import 'package:innertune_replica/entities/song.dart';
import 'package:provider/provider.dart';
import 'package:innertune_replica/widgets/navigationbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Innertune Replica',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.dark()
        ),
        home: NavigationBarWidget(),
      ),
    );
  }
}
class MyAppState extends ChangeNotifier {
  //hard-coded because the app is static
  List<Song> songs=[Song("Love-Colored Master Spark","Touhou Project",15*60+1,"https://i.ytimg.com/vi/7RBJ4NMOBV0/maxresdefault.jpg"),Song("Lunatic Eyes ~ Invisible Full Moon","Touhou Project",5*60+7,"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5oB7pvVwBFS_gFwfnSYfPCGLkhNcftLycnQ&s"),Song("Night of Nights","Touhou Project",3*60+12,"https://i.ytimg.com/vi/vS_a8Edde8k/hqdefault.jpg?sqp=-oaymwEmCOADEOgC8quKqQMa8AEB-AH-BIAC4AOKAgwIABABGHIgSihBMA8=&rs=AOn4CLC6VDiMKULhtIXR58D7XEx-ExkiiA"),Song("Kick Back pero es versión Salsa (Full)","Tricker",3*60+44,"https://i.ytimg.com/vi/5mfDzBeeBSI/maxresdefault.jpg")];
  List<Playlist> playlists=[];

  MyAppState(){
    playlists.addAll([Playlist("Touhou", [songs[0],songs[1],songs[2]]),Playlist("Misc", [songs[3]])]);
  } 
} 