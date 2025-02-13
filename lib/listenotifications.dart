import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<String> _notifications = [
    "LE COURS EN LIGNE VACOMMENCER DANS 15 MINUTES",
    "LE COURS EN LIGNE A COMMENCE ET VOUS ETES ATTENDU",
    "UNE NOUVELLE NOTE D'ART ORATOIRE EST DISPONIBLE , VEUILLEZ VOUS CONNECTER A VOTRE PORTAIL POUR",
  ];

  void _showAddNotificationDialog() {
    String newNotificationText = "";

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Ajouter une notification',
            style: TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Entrez le texte de la notification',
              hintStyle: TextStyle(color: Colors.white54),
            ),
            onChanged: (value) {
              newNotificationText = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                if (newNotificationText.isNotEmpty) {
                  setState(() {
                    _notifications.add(newNotificationText);
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Ajouter'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Notifications'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: _notifications.isEmpty
          ? const Center(
              child: Text(
                'Aucune notification',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notificationText = _notifications[index];
                return Card(
                  color: Colors.grey[850],
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    title: Text(
                      notificationText,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNotificationDialog,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
