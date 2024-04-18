import 'package:flutter/material.dart';

import 'models/post.dart';
import 'screens/candidates_screen.dart';
import 'screens/create_post_screen.dart';
import 'screens/job_listings_screen.dart';
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

          //Code update by Singh
          Container(
            margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              'Welcome to the Recruiting Application!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //End

          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];

                //Code update by Singh
                return Card(
                  elevation: 5, // Adds shadow under the card
                  margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Rounded corners for the card
                  ),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    title: Text(
                      post.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(post.author),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      //**Singh**//
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  PostDetailScreen(post: post),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(0.0, 1.0);
                            var end = Offset.zero;
                            var curve = Curves.ease;

                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
                //End
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
        return DialogAnimation(
          child: AlertDialog(
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

//Code update by Singh
class DialogAnimation extends StatelessWidget {
  final Widget child;

  DialogAnimation({required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      // Add some padding at the bottom to create a slide-up effect
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: SlideTransition(
        // Apply slide-up animation
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: ModalRoute.of(context)!.animation!,
          curve: Curves.fastOutSlowIn,
        )),
        child: child,
      ),
    );
  }
}
