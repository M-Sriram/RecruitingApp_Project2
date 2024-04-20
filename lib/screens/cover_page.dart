import 'package:flutter/material.dart';

class CoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EBDE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF815854),
        title: Text(
          'Team Members',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _showMenu(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Team Members',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF815854),
              ),
            ),
            SizedBox(height: 20),
            _buildMember('Sonali Sachdev', '8826040'),
            _buildMember('Sriram Mekala', '8906745'),
            _buildMember('Druvansh Balar', '8856778'),
            _buildMember('Jodhwinder Singh', '8831809'),
            SizedBox(height: 20),
            Text(
              'Course Code: PROG8700',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF815854),
              ),
            ),
            SizedBox(height: 10),
            Text(
              '1. Sonali - Worked on Post Functionality and Create Post Screen,\n'
                  '2. Sriram - Worked on Candidates Functionality, Candidates Screen, Candidate Details Screen, and Connections Screen,\n'
                  '3. Druvansh - Worked on Job Listing Functionality, Job Details Screen, Job Listing Screen,\n'
                  '4. Jodhwinder - Worked on the Animation part of the entire project, Animation and Design.',
              style: TextStyle(
                fontSize: 16,
                color: const Color(0xFF333333),
              ),
              textAlign: TextAlign.center,
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
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  Widget _buildMember(String name, String id) {
    return Text(
      '$name ($id)',
      style: TextStyle(
        fontSize: 18,
        color: const Color(0xFF333333),
      ),
    );
  }
}
