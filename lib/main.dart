import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String title = 'Flutter Map';

//stateless
//material app
//scaffold

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title), 
          centerTitle: true,
        ),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onDestinationSelected: (int value) {},
          selectedIndex: 0,
        ),
      ),
    );
  }
}

class MyHomePageCysi extends StatefulWidget {
  const MyHomePageCysi({super.key});

  @override
  State<MyHomePageCysi> createState() => _MyHomePageCysiState();
}

class _MyHomePageCysiState extends State<MyHomePageCysi> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}