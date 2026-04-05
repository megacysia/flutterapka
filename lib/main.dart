import 'package:flutter/material.dart'; //import bibliotek  - będziemy korzystać z flutter/material.dart, ktory zawiera wszystkie podstawowe widgety fluttera - bez tego nie  moznaby bylo uzywac scaffold, text, column, drawer itd

void main() { //no main to main, kazda apka w darcie sie zaczyna od main
  runApp(const MyApp()); //runapp mowi ,,uruchom apke  pokaz mi widget, który w nim podaje
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'moja apka'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // **Drawer – wysuwane menu z boku**
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Kalendarz'),
              onTap: () {
                Navigator.pop(context); // zamyka Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ustawienia'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // **Główna część aplikacji**
      body: Column(
        children: [
          Opacity(
            opacity: 0.3,
            child: Text("Poprzedni miesiąc"),
          ),
          Expanded(
            child: Center(
              child: Text(
                "AKTUALNY KALENDARZ",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Opacity(
            opacity: 0.3,
            child: Text("Następny miesiąc"),
          ),
        ],
      ),
    );
  }
}