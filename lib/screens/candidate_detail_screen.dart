import 'package:flutter/material.dart';
import 'package:project2_recruiting/models/candidate.dart';

import 'connections_screen.dart';
class CandidateDetailScreen extends StatelessWidget {
  final Candidate candidate;
  final List<Candidate> connectedCandidates;

  CandidateDetailScreen({required this.candidate, required this.connectedCandidates});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EBDE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF815854),
        title: Text('Candidate Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _showMenu(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 400,
                height: 400,
                child: Image.asset(
                  candidate.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Name: ${candidate.name}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Job Title: ${candidate.jobTitle}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${candidate.description}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _connectCandidate(context);
              },
              child: Text('Connect'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConnectionsScreen(connectedCandidates: connectedCandidates)),
                );
              },
              child: Text('Your Connections'),
            ),
          ],
        ),
      ),
    );
  }

  void _showMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Menu'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                _buildMenuItem(context, 'Home', '/'),
                _buildMenuItem(context, 'Candidates', '/candidates'),
                _buildMenuItem(context, 'Create Post', '/create_post'),
                _buildMenuItem(context, 'Job Listings', '/job_listings'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the menu
        Navigator.pushReplacementNamed(context, route); // Replace the current screen with the selected route
      },
    );
  }

  void _connectCandidate(BuildContext context) {
    if (!connectedCandidates.contains(candidate)) {
      connectedCandidates.add(candidate);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ConnectionsScreen(connectedCandidates: connectedCandidates)),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Already Connected'),
            content: Text('You are already connected to ${candidate.name}.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
