import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/job_listing.dart';

class JobDetailScreen extends StatefulWidget {
  final JobListing jobListing;

  JobDetailScreen({required this.jobListing});

  @override
  _JobDetailScreenState createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  bool _applied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EBDE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF815854),
        title: Text('Job Detail'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.jobListing.logo),
                radius: 50,
              ),
              SizedBox(height: 10),
              Text(
                widget.jobListing.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                widget.jobListing.company,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.jobListing.description),
                    SizedBox(height: 10),
                    Text(
                      'Location:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.jobListing.location),
                    SizedBox(height: 10),
                    Text(
                      'Pay:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('\$${widget.jobListing.pay.toStringAsFixed(2)}'),
                    SizedBox(height: 10),
                    // Additional content specific to each job
                    Text(
                      'Responsibilities:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.jobListing.responsibilities),
                    SizedBox(height: 10),
                    Text(
                      'Qualifications:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.jobListing.qualifications),
                    SizedBox(height: 10),
                    Text(
                      'Benefits:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(widget.jobListing.benefits),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _applied ? null : _applyForJob,
                      child: Text(
                          _applied ? 'You have applied to job' : 'Apply Now'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkIfApplied();
  }

  void _checkIfApplied() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool alreadyApplied = prefs.containsKey(widget.jobListing.jobId.toString());
    setState(() {
      _applied = alreadyApplied;
    });
  }

  void _applyForJob() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(widget.jobListing.jobId.toString(), 'applied');
    setState(() {
      _applied = true;
    });
  }
}
