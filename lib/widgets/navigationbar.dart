import 'package:flutter/material.dart';
import 'package:innertune_replica/widgets/exploreScreen.dart';
import 'package:innertune_replica/widgets/homeScreen.dart';
import 'package:innertune_replica/widgets/library.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<StatefulWidget> createState() =>
    _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<NavigationBarWidget>{
  int _selectedIndex = 0;
   
  final _pageOptions= <Widget>[
    HomeScreen(),
    ExploreScreen(),
    LibraryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex=index;
          });
        },
        indicatorColor: Color.fromARGB(255,64,71,89),
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home,color:Colors.white), label: "Início"),
          NavigationDestination(icon: Icon(Icons.explore,color:Colors.white), label: "Explore"),
          NavigationDestination(icon: Icon(Icons.library_music,color:Colors.white), label: "Library"),
        ]),
        body: SafeArea(
          child:_pageOptions[_selectedIndex]
        )
    );
  }
}