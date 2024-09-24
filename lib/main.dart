import 'package:flutter/material.dart';
import 'package:innertune_replica/entities/album.dart';
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
  //all the static components are declared here for readability
  List<Song> songs=[Song("Love-Colored Master Spark","Touhou Project",15*60+1,"https://i.ytimg.com/vi/7RBJ4NMOBV0/maxresdefault.jpg"),Song("Lunatic Eyes ~ Invisible Full Moon","Touhou Project",5*60+7,"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5oB7pvVwBFS_gFwfnSYfPCGLkhNcftLycnQ&s"),Song("Night of Nights","Touhou Project",3*60+12,"https://i.ytimg.com/vi/vS_a8Edde8k/hqdefault.jpg?sqp=-oaymwEmCOADEOgC8quKqQMa8AEB-AH-BIAC4AOKAgwIABABGHIgSihBMA8=&rs=AOn4CLC6VDiMKULhtIXR58D7XEx-ExkiiA"),Song("Kick Back pero es versión Salsa (Full)","Tricker",3*60+44,"https://i.ytimg.com/vi/5mfDzBeeBSI/maxresdefault.jpg")];
  List<Playlist> playlists=[];
  List<Album> releaseAlbums=[];
  var selectedPlaylist;
  List<String> searchHistory=["All Night Long","The Red Inn","Man Who Saw Tomorrow, The","Yi Yi","Stolen (Stolen Lives)","Shrink Is In, The","Smart People","Psyhi vathia (a.k.a. Deep Soul)","City for Conquest","Within the Woods","Cane Toads: The Conquest","Eddie Izzard: Glorious","Moolaadé","Appointment in Tokyo","Number One with a Bullet","Flu Bird","Track of the Cat","Carried Away","Forbidden Kingdom, The","Stones in Exile","First Shot","Salla: Selling the Silence","Man Called Peter, A","Last Polka, The","Caltiki the Undying Monster","Amor brujo, El (Love Bewitched, A)","Band's Visit, The (Bikur Ha-Tizmoret)","All the Rage (It's the Rage)","With a Friend Like Harry... (Harry, un ami qui vous veut du bien)","Bloody Sunday","Never Sleep Again: The Elm Street Legacy","Metro Manila","Open Season 3","The Loyal 47 Ronin","Forest of Bliss","Phantom of the Paradise","Nocturna Artificialia","Prey for Rock & Roll","Supermarket Woman (Sûpâ no onna)","Children of Noisy Village, The (a.k.a Children of Bullerby Village, The) (Alla vi barn i Bullerbyn)","At the River I Stand","Dream Team, The","Bone Collector, The","Separation, The (Séparation, La)","Milk Money","Four Musketeers, The","Freeway II: Confessions of a Trickbaby","Sentimental Swordsman, The (To ching chien ko wu ching chien)","Wild and Wonderful Whites of West Virginia, The","Great Day in the Morning","Today's Special","Kicking & Screaming","Sol ","Dara Ó Briain Talks Funny: Live in London","Conquest","Gay Bed and Breakfast of Terror, The","Without a Paddle","Family Business","Gregory Crewdson: Brief Encounters","Zuzu Angel","M","Jackass 3.5","Pride and Glory","Bill Burr: Let It Go","La Luna","29th Street","Treasure Planet","Judy Moody and the Not Bummer Summer","Dead Leaves","Congress, The","I Drink Your Blood","Meth","Summer in February","Putzel","Gitmek: My Marlon and Brando (Gitmek: Benim Marlon ve Brandom)","Speed Zone! (a.k.a. Cannonball Run III)","GasLand","Lover's Knot","Aya of Yop City","Tangled","Combat dans L'Ile, Le (Fire and Ice)","Lotta 2: Lotta flyttar hemifrån","Orders Signed in White","Manhunt","North","Stealing Rembrandt (Rembrandt)","Irma la Douce","Case for Christ, The","Port of Flowers","One Week","Breaker! Breaker!","Bobcat Goldthwait: You Don't Look the Same Either","Freaked","Lenny","Magic Trip","King of the Ants","Chizuko's Younger Sister (Futari)","Hard Luck","Fantomas (Fantômas - À l'ombre de la guillotine)","Extreme Ops"];

  MyAppState(){
    playlists.addAll([Playlist("Touhou", [songs[0],songs[1],songs[2]]),Playlist("Misc", [songs[3]])]);
    selectedPlaylist=playlists[0];
  } 
} 