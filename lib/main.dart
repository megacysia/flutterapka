import 'package:flutter/material.dart'; // podstawowe widgety Fluttera
import 'package:table_calendar/table_calendar.dart'; // kalendarz

void main() {
  runApp(const MyApp()); // uruchamia główny widget MyApp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // konstruktor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CysiowaApkaDemo', // tytuł aplikacji
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFF69B4)), // różowy
        useMaterial3: true, // nowoczesny Material Design
      ),
      home: const MyHomePage(title: 'moja apka'), // strona główna
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title; // tytuł strony

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // tworzy stan
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _focusedDay = DateTime.now(); // aktualny miesiąc
  DateTime? _selectedDay; // zaznaczony dzień

  @override
  Widget build(BuildContext context) {
    // Scaffold – szkielet aplikacji
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFFFF69B4), // różowy pasek
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFFF69B4)),
              child: Text(
                'Menu apki',
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
                Navigator.pop(context); // zamyka Drawer
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // scroll pionowy całej strony
        child: Column(
          children: [
            // poprzedni miesiąc
            Opacity(
              opacity: 0.3,
              child: TableCalendar(
                firstDay: DateTime(2000, 1, 1),
                lastDay: DateTime(2100, 12, 31),
                focusedDay: DateTime(_focusedDay.year, _focusedDay.month - 1, 1), 
                // zawsze miesiąc poprzedni względem głównego kalendarza
                calendarFormat: CalendarFormat.month,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(),
                  selectedDecoration: BoxDecoration(),
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
              ),
            ),
            const SizedBox(height: 10),

            // główny kalendarz – steruje mini-kalendarzami
            TableCalendar(
              firstDay: DateTime(2000, 1, 1),
              lastDay: DateTime(2100, 12, 31),
              focusedDay: _focusedDay, // główny miesiąc
              calendarFormat: CalendarFormat.month,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // aktualizuje wszystkie kalendarze
                });
              },
              onPageChanged: (focusedDay) {
                // wywołuje się przy przewinięciu miesiąca
                setState(() {
                  _focusedDay = focusedDay; // synchronizuje mini-kalendarze
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.pink[400],
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.pink[700],
                  shape: BoxShape.circle,
                ),
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
            ),
            const SizedBox(height: 10),

            // następny miesiąc
            Opacity(
              opacity: 0.3,
              child: TableCalendar(
                firstDay: DateTime(2000, 1, 1),
                lastDay: DateTime(2100, 12, 31),
                focusedDay: DateTime(_focusedDay.year, _focusedDay.month + 1, 1), 
                // miesiąc następny względem głównego kalendarza
                calendarFormat: CalendarFormat.month,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(),
                  selectedDecoration: BoxDecoration(),
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
              ),
            ),
          ],
        ),
      ),
    );
  }
}