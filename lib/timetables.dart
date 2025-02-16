import 'package:classprogress1/profile.dart';
import 'package:flutter/material.dart';

class TimetableApp extends StatelessWidget {
  const TimetableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    NotificationScreen(),
    TimetablePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_2_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profile(),
                ),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: const Color.fromARGB(255, 109, 58, 58),
        unselectedItemColor: const Color.fromARGB(179, 112, 58, 58),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Emploi du Temps',
          ),
        ],
      ),
    );
  }
}



class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Vos notifications s\'afficheront ici.')),
    );
  }
}

class TimetablePage extends StatelessWidget {
  final List<String> days = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven'];
  final List<String> hours = ['08:00', '10:00', '12:00', '14:00', '16:00'];
  final Map<String, String> subjects = {
    'Lun_08:00': 'Maths',
    'Mar_10:00': 'Physique',
    'Mer_12:00': 'Anglais',
    'Jeu_14:00': 'Info',
    'Ven_16:00': 'Sport',
  };

  TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Table(
              border: TableBorder.all(color: Colors.deepPurple),
              defaultColumnWidth: FixedColumnWidth(100),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.purple[300]),
                  children: [
                    tableCell('Heure', true),
                    ...days.map((day) => tableCell(day, true)),
                  ],
                ),
                ...hours.map((hour) => TableRow(
                      children: [
                        tableCell(hour, true),
                        ...days.map((day) {
                          String key = '${day}_$hour';
                          return tableCell(subjects[key] ?? '', false);
                        }),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tableCell(String text, bool isHeader) {
    return Container(
      padding: EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isHeader ? Colors.purple[200] : Colors.purple[50],
        border: Border.all(color: Colors.deepPurple),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontFamily: 'Roboto',
          color: Colors.deepPurple[900],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
