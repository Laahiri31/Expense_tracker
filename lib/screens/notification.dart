import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {"title": "Transaction Received", "subtitle": "\$1000 received from John Doe"},
    {"title": "Payment Sent", "subtitle": "\$200 sent to Jane Doe"},
    {"title": "Transaction Failed", "subtitle": "Transaction of \$500 failed"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationTile(
            title: notifications[index]['title']!,
            subtitle: notifications[index]['subtitle']!,
          );
        },
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;

  NotificationTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: PopupMenuButton<String>(
        onSelected: (String result) {
          switch (result) {
            case 'Archive':
              // Handle archive action
              break;
            case 'Mark as Read':
              // Handle mark as read action
              break;
            case 'Delete':
              // Handle delete action
              break;
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          const PopupMenuItem<String>(
            value: 'Archive',
            child: Text('Archive'),
          ),
          const PopupMenuItem<String>(
            value: 'Mark as Read',
            child: Text('Mark as Read'),
          ),
          const PopupMenuItem<String>(
            value: 'Delete',
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}


void main() {
  runApp(
     MaterialApp(
      home: NotificationsPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}