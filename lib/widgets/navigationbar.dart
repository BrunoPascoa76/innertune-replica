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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    LibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icon(Icons.home),_selectedIndex==0),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icon(Icons.explore),_selectedIndex==1),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icon(Icons.library_music),_selectedIndex==2),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
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