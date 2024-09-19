import 'package:flutter/material.dart';
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
}
