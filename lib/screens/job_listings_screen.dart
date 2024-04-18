import 'package:flutter/material.dart';
import '../models/job_listing.dart';
import 'job_detail_screen.dart';

class JobListingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data
    List<JobListing> jobListings = [
      JobListing(title: 'Job 1', company: 'Company 1', logo: 'assets/company1_logo.jpg'),
      JobListing(title: 'Job 2', company: 'Company 2', logo: 'assets/company2_logo.jpg'),
      // Add more job listings
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
      ),
      body: ListView.builder(
        itemCount: jobListings.length,
        itemBuilder: (context, index) {
          final jobListing = jobListings[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(jobListing.logo),
            ),
            title: Text(jobListing.title),
            subtitle: Text(jobListing.company),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailScreen(jobListing: jobListing),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
