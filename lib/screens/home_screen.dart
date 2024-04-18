import 'package:flutter/material.dart';
import '../models/post.dart';
import 'post_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data
    List<Post> posts = [
      Post(title: 'Post 1', author: 'Author 1'),
      Post(title: 'Post 2', author: 'Author 2'),
      // Add more posts
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
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
    );
  }
}
