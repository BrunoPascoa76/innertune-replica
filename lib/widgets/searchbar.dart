import 'package:flutter/material.dart';
import 'package:innertune_replica/widgets/searchScreen.dart';

class SearchBarWidget extends StatelessWidget{
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:10,right:10,bottom:20),
      child: Stack(children: [
        Hero(tag:"search screen", child:ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 189, 188, 188),
            backgroundColor: Color.fromARGB(255, 41, 45, 56),
            minimumSize: Size.zero,
            padding: EdgeInsets.only(top:12,bottom:12,left:10,right:10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          onPressed: (){Navigator.push(context, _SearchBarRoute(builder: (context)=>const SearchScreen()));},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [Icon(Icons.search,color:Colors.white),Padding(padding:EdgeInsets.only(left:10),child:Text("Pesquisar"))]),
            ],
          ))
        ),
        Align(alignment: Alignment.centerRight,child:IconButton(onPressed:(){},icon:Icon(color:Colors.white,Icons.settings_outlined))),
      ])
    );
  }
}

class _SearchBarRoute extends MaterialPageRoute {
  _SearchBarRoute({required super.builder});

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);
}
