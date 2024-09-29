import 'package:flutter/material.dart';
import 'package:innertune_replica/main.dart';
import 'package:innertune_replica/widgets/searchbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() =>
    _HomeScreenStatus();
}
class _HomeScreenStatus extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    var appState=context.watch<MyAppState>();
    return SingleChildScrollView(
      child: Column(children: [
        SearchBarWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize:MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: (){},
                  style: IconButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,34,38,49),
                  ),
                  splashRadius: 200,
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.history),
                  )),
                Text("History")
              ]
            ),
            Column(
              mainAxisSize:MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: (){},
                  style: IconButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,34,38,49),
                  ),
                  splashRadius: 200,
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.trending_up),
                  )),
                Text("Stats")
              ]
            ),
            Column(
              mainAxisSize:MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: (){},
                  style: IconButton.styleFrom(
                    backgroundColor: Color.fromARGB(255,34,38,49),
                  ),
                  splashRadius: 200,
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.person),
                  )),
                Text("Account")
              ]
            ),
          ]
        )
        //TODO: QuickPicks header
        //TODO: QuickPicks carroussel
      ]
      )
    );
  }
}