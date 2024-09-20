import 'package:flutter/material.dart';
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
    Text("aaaa"),
    Text("bbbb"),
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
          NavigationDestination(icon: Icon(Icons.home), label: "Início"),
          NavigationDestination(icon: Icon(Icons.explore), label: "Explore"),
          NavigationDestination(icon: Icon(Icons.library_music), label: "Library"),
        ]),
        body: SafeArea(
          child:_pageOptions[_selectedIndex]
        )
    );
  }

  Widget _buildIcon(Icon icon, bool isSelected) {
    return Container(
      width: 55,
      height: 35,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
        color: isSelected ? const Color.fromARGB(255,64,71,89) : Colors.transparent, // Customize outline color
      ),
      child: icon,
    );
  }
}