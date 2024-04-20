import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EBDE), // Background color for the entire page
      appBar: AppBar(
        backgroundColor: const Color(0xFF815854), // Background color for the app bar
        title: Text(
          'Team Members',
          style: TextStyle(color: Colors.white), // Text color for the app bar title
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu), // Menu icon
            onPressed: () {
              _showMenu(context); // Show the menu when the icon is pressed
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
                color: const Color(0xFF815854), // Text color for the heading
              ),
            ),
            SizedBox(height: 20),
            // Member names with their ID numbers
            _buildMember('Sonali Sachdev', '8826040'),
            _buildMember('Sriram Mekala', '8906745'),
            _buildMember('Druvansh Balar', '8856778'),
            _buildMember('Jodhwinder Singh', '8831809'),
            // Add more member names as needed
            SizedBox(height: 20),
            Text(
              'Course Code: PROG8700', // Heading for the course code
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF815854), // Text color for the heading
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the menu dialog
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
                _buildMenuItem(context, 'Job Listings', '/job_listings'),// Menu item to navigate to the home screen
                // Add more menu items as needed
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to build a menu item widget
  Widget _buildMenuItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the menu dialog
        Navigator.pushNamed(context, route); // Navigate to the specified route
      },
    );
  }

  // Function to build a widget for a team member with name and ID
  Widget _buildMember(String name, String id) {
    return Text(
      '$name ($id)', // Concatenating name and ID
      style: TextStyle(
        fontSize: 18,
        color: const Color(0xFF333333), // Text color for the member name
      ),
    );
  }
}
