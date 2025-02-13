import 'package:classprogress1/listenotifications.dart';
import 'package:flutter/material.dart';
// Importe ta page Notification existante

class Modules extends StatefulWidget {
  const Modules({super.key});

  @override
  State<Modules> createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {
  final List<Map<String, String>> modules = [
    {
      "name": "Développement d'application mobile",
      "image": "asset/Images/flutter.jpg",
      "prof": "Mr Abdoul Karim Konate",
      "date": "Vendredi",
      "heure": "14h00 - 16h00",
      "salle": "107",
      "objectifs": "Maîtriser Flutter, créer des apps mobiles dynamiques."
    },
    {
      "name": "Méthodologie Agile",
      "image": "asset/Images/agile.jpg",
      "prof": "Mr Abdoul Karim Konate",
      "date": "Samedi",
      "heure": "10h15 - 12h15",
      "salle": "Salle 102",
      "objectifs": "Comprendre Scrum, Kanban et l'agilité en entreprise."
    },
    {
      "name": "Gestion financiere",
      "image": "asset/Images/gestionfinanciere.jpg",
      "prof": "Mr Sanogo",
      "date": "Mercredi",
      "heure": "13h30 - 15h30",
      "salle": "116",
      "objectifs":
          "pouvoir faire un bilan financier, voir un projet est rentable ou pas."
    },
    {
      "name": "Statistiques et Probabilite",
      "image": "asset/Images/statistique.png",
      "prof": "Mme Doumbia",
      "date": "Jeudi",
      "heure": "15h45 - 17h45",
      "salle": "102",
      "objectifs":
          "Connaitre les outils de statistiques, collecte de donnes et analyse."
    },
    {
      "name": "Oracle",
      "image": "asset/Images/oracle.jpg",
      "prof": "Mme Diarra",
      "date": "Jeudi",
      "heure": "13h30 - 15h30",
      "salle": "101",
      "objectifs": "Connaitre et pouvoir Utiliser les clint Oracle."
    },
    {
      "name": "Anglais",
      "image": "asset/Images/anglais.jpg",
      "prof": "Mr Ould",
      "date": "Lundi",
      "heure": "15h45 - 17h45",
      "salle": "En ligne",
      "objectifs":
          "S'exprimer en entreprise et connaitre le vocabulaire informatique courant."
    },
    {
      "name": "Droit du travail et TIC",
      "image": "asset/Images/droit.jpg",
      "prof": "Mme Diall",
      "date": "Mardi",
      "heure": "13h30 - 15h30",
      "salle": "102",
      "objectifs":
          "Comprendre ce qu'est le droit du travail et comment les TIC sont prises en charge par cette derniere ."
    },
    {
      "name": "Statistiques et Probabilite",
      "image": "asset/Images/artoratoire.jpg",
      "prof": "Mme .....",
      "date": "Lundi",
      "heure": "10h15 - 12h15",
      "salle": "111",
      "objectifs": "Donner un discours en 7 avec des diapo."
    },
  ];

  void navigateToDetail(Map<String, String> module) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Cours(module: module),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Modules"),
        backgroundColor: const Color.fromARGB(255, 180, 131, 131),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: modules.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => navigateToDetail(modules[index]),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      modules[index]['image']!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      color: Colors.black.withOpacity(0.7),
                      child: Text(
                        modules[index]['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Cours extends StatelessWidget {
  final Map<String, String> module;

  const Cours({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(module['name']!),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(module['image']!,
                  width: double.infinity, height: 200, fit: BoxFit.cover),
              const SizedBox(height: 20),
              _buildInfoRow(Icons.calendar_today, "Date :", module['date']!),
              _buildInfoRow(Icons.access_time, "Heure :", module['heure']!),
              _buildInfoRow(Icons.person, "Professeur :", module['prof']!),
              _buildInfoRow(Icons.location_on, "Salle :", module['salle']!),
              const SizedBox(height: 20),
              const Text(
                "Objectifs du cours :",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              const SizedBox(height: 8),
              Text(
                module['objectifs']!,
                style: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
