import 'package:flutter/material.dart';
import 'package:project2_recruiting/models/candidate.dart';

class ConnectionsScreen extends StatelessWidget {
  final List<Candidate> connectedCandidates;

  ConnectionsScreen({required this.connectedCandidates});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EBDE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF815854),
        title: Text('Connections'),
      ),
      body: ListView.builder(
        itemCount: connectedCandidates.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(connectedCandidates[index].imagePath),
            ),
            title: Text(connectedCandidates[index].name),
            subtitle: Text(connectedCandidates[index].jobTitle),
          );
        },
      ),
    );
  }
}
