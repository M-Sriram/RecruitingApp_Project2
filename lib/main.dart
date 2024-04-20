import 'package:flutter/material.dart';
import 'package:project2_recruiting/screens/cover_page.dart';
import 'package:project2_recruiting/screens/create_post_screen.dart';
import 'screens/candidates_screen.dart';
import 'screens/job_listings_screen.dart';
import 'models/post.dart';
import 'screens/post_detail_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Post> posts = [
    Post(
      title: 'Software Engineer',
      content:
      'We are looking for a skilled software engineer to join our team. Experience with Flutter framework is preferred.',
    ),
    Post(
      title: 'Marketing Specialist',
      content:
      'We are hiring a marketing specialist to develop and execute marketing strategies. Previous experience in digital marketing is required.',
    ),
    Post(
      title: 'Customer Support Representative',
      content:
      'We are seeking a customer support representative to assist our customers with technical issues. Excellent communication skills are a must.',
    ),
    Post(
      title: 'Data Analyst',
      content:
      'We have an opening for a data analyst to analyze large datasets and provide insights to drive business decisions. Proficiency in SQL and data visualization tools is required.',
    ),
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
        '/job_listings': (context) => JobListingsScreen(),
        '/cover_page': (context) => CoverPage(),
        '/create_post': (context) => CreatePostScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  final List<Post> posts;

  const HomeScreen({Key? key, required this.posts}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          Center(
            child: Column(
              children: [
                Text(
                  'Welcome to the Recruiting Application!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cover_page');
                  },
                  child: Text('Cover Page'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: widget.posts.length,
              itemBuilder: (context, index) {
                final post = widget.posts[index];
                final cardColorIndex = index % cardColors.length;
                return AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: Opacity(
                        opacity: _animation.value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: cardColors[cardColorIndex],
                            elevation: 3,
                            shadowColor: Colors.grey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(
                                    post.title,
                                    style: TextStyle(color: Colors.white), // Set text color to white
                                  ),
                                  subtitle: Text(
                                    post.content,
                                    style: TextStyle(color: Colors.white), // Set text color to white
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PostDetailScreen(post: post),
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Posted on: ${post.dateTime}',
                                        style: TextStyle(fontSize: 12, color: Colors.white), // Set text color to white
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.thumb_up, color: Colors.white), // Set icon color to white
                                        onPressed: () {
                                          // Handle like button tap
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                _buildMenuItem(context, 'Job Listings', '/job_listings'),
                _buildMenuItem(context, 'Cover Page', '/cover_page'),
                _buildMenuItem(context, 'Create Post', '/create_post'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.black)), // Set text color to black
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}

class Post {
  final String title;
  final String content;
  final DateTime dateTime; // Added dateTime field

  Post({required this.title, required this.content})
      : dateTime = DateTime.now(); // Initialize dateTime when creating a new Post object
}

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${post.title}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 16),
            Text(
              'Content: ${post.content}',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

List<Color> cardColors = [
  Colors.brown[200]!,
  Colors.brown[300]!,
  Colors.brown[200]!,
  Colors.brown[300]!,
  Colors.brown[200]!,
];
