import 'package:flutter/material.dart';
import 'screens/candidates_screen.dart';
import 'screens/create_post_screen.dart';
import 'screens/job_listings_screen.dart';
import 'models/post.dart';
import 'screens/post_detail_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Post> posts = [
    Post(title: 'Post 1', author: 'Author 1'),
    Post(title: 'Post 2', author: 'Author 2'),
  ];

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
        '/': (context) => HomeScreen(posts: posts),
        '/candidates': (context) => CandidatesScreen(),
        '/create_post': (context) => CreatePostScreen(),
        '/job_listings': (context) => JobListingsScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Post> posts;

  const HomeScreen({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EBDE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF815854),
        title: Text('Recruiting Application'),
        leading: Padding(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(
            'Welcome to the Recruiting Application!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.author),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(post: post),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
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
