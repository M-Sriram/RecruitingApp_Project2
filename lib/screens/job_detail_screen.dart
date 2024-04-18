import 'package:flutter/material.dart';
import '../models/job_listing.dart';

class JobDetailScreen extends StatelessWidget {
  final JobListing jobListing;

  JobDetailScreen({required this.jobListing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(jobListing.logo),
            radius: 50,
          ),
          SizedBox(height: 10),
          Text(jobListing.title),
          Text(jobListing.company),
          // Add more details about the job listing
          ElevatedButton(
            onPressed: () {
              // Implement logic to apply for the job
            },
            child: Text('Apply Now'),
          ),
        ],
      ),
    );
  }
}
