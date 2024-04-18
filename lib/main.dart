import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/candidates_screen.dart';
import 'screens/create_post_screen.dart';
import 'screens/job_listings_screen.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recruiting App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/candidates': (context) => CandidatesScreen(),
        '/create_post': (context) => CreatePostScreen(),
        '/job_listings': (context) => JobListingsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EBDE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF815854),
        title: Text('Recruiting Application'),
        leading: Padding( // Logo in top left
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/app_logo.png',
            width: 40,
            height: 40,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {

              _showMenu(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Recruiting Application!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
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
        Navigator.pushNamed(context, route);
      },
    );
  }
}

