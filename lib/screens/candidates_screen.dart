import 'package:flutter/material.dart';
import 'package:project2_recruiting/models/candidate.dart';
import 'candidate_detail_screen.dart';

class CandidatesScreen extends StatelessWidget {
  final List<Candidate> candidates = [
    Candidate(
      name: 'Robert Stark',
      jobTitle: 'Software Engineer',
      description: 'Experienced software engineer with expertise in Flutter.',
      imagePath: 'assets/profile_image_0.jpg',
    ),
    Candidate(
      name: 'John Snow',
      jobTitle: 'UX Designer',
      description: 'Passionate UX designer with a focus on mobile applications.',
      imagePath: 'assets/profile_image_1.jpg',
    ),
    Candidate(
      name: 'Bran Stark',
      jobTitle: 'Web Developer',
      description: 'Creative web developer proficient in various front-end technologies.',
      imagePath: 'assets/profile_image_2.jpg',
    ),
    Candidate(
      name: 'Sansa Stark',
      jobTitle: 'Marketing Specialist',
      description: 'Strategic marketing specialist with experience in digital campaigns.',
      imagePath: 'assets/profile_image_3.jpg',
    ),
    Candidate(
      name: 'Arya Stark',
      jobTitle: 'Data Analyst',
      description: 'Analytical data analyst skilled in interpreting and presenting data.',
      imagePath: 'assets/profile_image_4.jpg',
    ),
  ];

  final List<Candidate> connectedCandidates = []; // Initialize connectedCandidates list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EBDE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF815854),
        title: Text('Candidates'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _showMenu(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CandidateDetailScreen(candidate: candidates[index], connectedCandidates: connectedCandidates),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: AspectRatio(
                        aspectRatio: 16 / 16,
                        child: Image.asset(
                          candidates[index].imagePath,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        candidates[index].name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Center(
                      child: Text(
                        candidates[index].jobTitle,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
}
