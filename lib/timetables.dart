import 'package:flutter/material.dart';

class TimetableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
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

  void _logout() {
    print("Déconnexion...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 30, // Augmente la taille ici
            ),
            onPressed: _logout,
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Bienvenue sur l\'accueil!')),
    );
  }
}

class NotificationScreen extends StatelessWidget {
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
                    ...days.map((day) => tableCell(day, true)).toList(),
                  ],
                ),
                ...hours.map((hour) => TableRow(
                      children: [
                        tableCell(hour, true),
                        ...days.map((day) {
                          String key = '${day}_$hour';
                          return tableCell(subjects[key] ?? '', false);
                        }).toList(),
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
