class JobListing {
  final int jobId;
  final String title;
  final String company;
  final String logo;
  final String description;
  final String location;
  final double pay;
  final String responsibilities; // Additional field for job responsibilities
  final String qualifications; // Additional field for job qualifications
  final String benefits; // Additional field for job benefits

  JobListing({
    required this.jobId,
    required this.title,
    required this.company,
    required this.logo,
    required this.description,
    required this.location,
    required this.pay,
    required this.responsibilities,
    required this.qualifications,
    required this.benefits,
  });
}
