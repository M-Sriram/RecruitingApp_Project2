import 'package:flutter/material.dart';
import '../models/job_listing.dart';
import 'job_detail_screen.dart';

class JobListingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data
    List<JobListing> jobListings = [
      JobListing(
        title: 'Software Engineer',
        company: 'Google',
        logo: 'assets/google.jpeg',
        description: 'Develop software applications and solutions.',
        location: 'Mountain View, CA',
        pay: 100000.0, responsibilities: 'Design and implement software applications. Collaborate with cross-functional teams to define, design, and ship new features. Write clean, maintainable, and efficient code. Ensure software meets quality standards through unit testing, code reviews, and continuous integration. Identify and correct bottlenecks and fix bugs. Continuously discover, evaluate, and implement new technologies to maximize development efficiency.',
        qualifications: 'Bachelor\'s degree in Computer Science or related field. Proficiency in one or more programming languages such as Java, Python, C++, etc. Strong problem-solving skills. Experience with software development methodologies such as Agile or Scrum. Ability to work effectively in a fast-paced environment with minimal supervision. Excellent communication and teamwork skills.',
        benefits: 'Competitive salary and stock options. Comprehensive health, dental, and vision plans. Generous parental leave. Retirement savings plans. Onsite gyms and fitness classes. Free meals and snacks. Transportation assistance. Paid time off and holidays. Employee assistance programs. Opportunities for career growth and professional development.',

      ),
      JobListing(
        title: 'UX Designer',
        company: 'Microsoft',
        logo: 'assets/microsoft.jpg',
        description: 'Design user experiences for various products.',
        location: 'Toronto, ON',
        pay: 90000.0, responsibilities: 'Conduct user research and analyze user feedback. Create wireframes, prototypes, and mockups. Collaborate with product managers, developers, and other stakeholders to define user requirements. Design intuitive and engaging user interfaces. Ensure consistency across all product interfaces. Iterate on designs based on user feedback and usability testing. Stay up-to-date with industry trends and best practices in UX design.',
        qualifications: 'Bachelor\'s degree in Design, Human-Computer Interaction, or related field. Proven experience as a UX Designer or similar role. Proficiency in design tools such as Sketch, Adobe XD, or Figma. Strong understanding of user-centered design principles. Excellent visual design skills with sensitivity to user-system interaction. Ability to present and justify design decisions. Strong communication and collaboration skills.',
        benefits: 'Competitive salary and stock options. Comprehensive health, dental, and vision plans. Generous parental leave. Retirement savings plans. Onsite gyms and fitness classes. Free meals and snacks. Transportation assistance. Paid time off and holidays. Employee assistance programs. Opportunities for career growth and professional development.',

      ),
      JobListing(
        title: 'Web Developer',
        company: 'Infosys',
        logo: 'assets/infosys.jpeg',
        description: 'Create and maintain websites and web applications.',
        location: 'Kitchener, ON',
        pay: 80000.0,
        responsibilities: 'Design, develop, and maintain responsive websites and web applications. Collaborate with cross-functional teams to define, design, and ship new features. Write clean, maintainable, and efficient code. Ensure websites and web applications are optimized for speed and scalability. Stay up-to-date with emerging technologies and best practices in web development.',
        qualifications: 'Bachelor\'s degree in Computer Science or related field. Proficiency in HTML, CSS, JavaScript, and other web development languages and frameworks. Experience with front-end and back-end development. Strong problem-solving skills. Excellent communication and teamwork skills.',
        benefits: 'Competitive salary and benefits package. Opportunities for career growth and advancement. Training and professional development programs. Health, dental, and vision insurance. Retirement savings plans. Flexible work hours and remote work options. Employee assistance programs. Onsite amenities and wellness programs.',
      ),
      JobListing(
        title: 'Market Specialist',
        company: 'Tata',
        logo: 'assets/tata.jpeg',
        description: 'Analyze market trends and develop strategies to promote products or services in targeted markets.',
        location: 'Cambridge, ON',
        pay: 70000.0,
        responsibilities: 'Analyze market trends and consumer behavior to identify new market opportunities. Develop marketing strategies and campaigns to promote products or services. Conduct market research and competitor analysis. Collaborate with sales and product teams to develop marketing collateral and promotional materials. Monitor and evaluate the effectiveness of marketing campaigns.',
        qualifications: 'Bachelor\'s degree in Marketing, Business Administration, or related field. Proven experience in marketing or market research. Strong analytical and problem-solving skills. Excellent communication and presentation skills. Ability to work effectively in a team environment. Proficiency in market research tools and techniques.',
        benefits: 'Competitive salary and benefits package. Opportunities for career growth and advancement. Training and professional development programs. Health, dental, and vision insurance. Retirement savings plans. Flexible work hours and remote work options. Employee assistance programs. Onsite amenities and wellness programs.',
      ),
      JobListing(
        title: 'Data Analyst',
        company: 'Reliance',
        logo: 'assets/reliance.jpeg',
        description: 'Collect, analyze, and interpret data to provide insights and support strategic decision-making processes.',
        location: 'Kitchener, ON',
        pay: 60000.0,
        responsibilities: 'Collect, clean, and organize large datasets. Perform statistical analysis and data mining to identify trends and patterns. Develop data models and visualization dashboards to communicate insights. Collaborate with stakeholders to understand business requirements and provide data-driven recommendations. Monitor data quality and integrity.',
        qualifications: 'Bachelor\'s degree in Statistics, Mathematics, Economics, Computer Science, or related field. Proven experience in data analysis or business intelligence. Proficiency in SQL, Python, R, or other data analysis tools and languages. Strong analytical and problem-solving skills. Excellent communication and collaboration skills.',
        benefits: 'Competitive salary and benefits package. Opportunities for career growth and advancement. Training and professional development programs. Health, dental, and vision insurance. Retirement savings plans. Flexible work hours and remote work options. Employee assistance programs. Onsite amenities and wellness programs.',
      ),
      JobListing(
        title: 'Database Administrator',
        company: 'Infosys',
        logo: 'assets/infosys.jpeg',
        description: 'Manage and maintain databases to ensure data integrity, security, and optimal performance.',
        location: 'Waterloo, ON',
        pay: 50000.0,
        responsibilities: 'Design, implement, and maintain databases. Monitor database performance and capacity. Troubleshoot database issues and perform root cause analysis. Develop and implement database security policies and procedures. Backup and restore databases. Collaborate with development teams to optimize database design and performance.',
        qualifications: 'Bachelor\'s degree in Computer Science, Information Technology, or related field. Proven experience as a database administrator or related role. Proficiency in SQL and database management systems such as MySQL, Oracle, or SQL Server. Strong problem-solving and troubleshooting skills. Excellent communication and teamwork skills.',
        benefits: 'Competitive salary and benefits package. Opportunities for career growth and advancement. Training and professional development programs. Health, dental, and vision insurance. Retirement savings plans. Flexible work hours and remote work options. Employee assistance programs. Onsite amenities and wellness programs.',
      ),
      JobListing(
        title: 'Network Administrator',
        company: 'Google',
        logo: 'assets/google.jpeg',
        description: 'Design, implement, and maintain computer networks, ensuring reliability and security.',
        location: 'Guelph, ON',
        pay: 40000.0,
        responsibilities: 'Design, implement, and maintain computer networks. Configure and troubleshoot network devices such as routers, switches, and firewalls. Monitor network performance and security. Implement network security policies and procedures. Provide technical support and troubleshooting for network-related issues. Collaborate with cross-functional teams to implement network infrastructure projects.',
        qualifications: 'Bachelor\'s degree in Computer Science, Information Technology, or related field. Proven experience as a network administrator or related role. Proficiency in networking protocols and technologies such as TCP/IP, DNS, DHCP, VLANs, VPNs, etc. Strong problem-solving and troubleshooting skills. Excellent communication and teamwork skills.',
        benefits: 'Competitive salary and benefits package. Opportunities for career growth and advancement. Training and professional development programs. Health, dental, and vision insurance. Retirement savings plans. Flexible work hours and remote work options. Employee assistance programs. Onsite amenities and wellness programs.',
      ),
      JobListing(
        title: 'Support Specialist',
        company: 'Reliance',
        logo: 'assets/reliance.jpeg',
        description: 'Provide technical support and assistance to users, troubleshooting hardware and software issues.',
        location: 'Brampton, ON',
        pay: 30000.0,
        responsibilities: 'Provide technical support and assistance to users via phone, email, or in person. Troubleshoot hardware and software issues and escalate complex problems to appropriate teams. Install, configure, and maintain hardware and software components. Train users on new systems and applications. Document support procedures and resolutions. Collaborate with IT teams to improve support processes and systems.',
        qualifications: 'Associate degree or technical certification in Information Technology, Computer Science, or related field. Proven experience in technical support or helpdesk role. Knowledge of hardware and software troubleshooting techniques. Excellent customer service and communication skills. Ability to prioritize and manage multiple tasks in a fast-paced environment.',
        benefits: 'Competitive salary and benefits package. Opportunities for career growth and advancement. Training and professional development programs. Health, dental, and vision insurance. Retirement savings plans. Flexible work hours and remote work options. Employee assistance programs. Onsite amenities and wellness programs.',
      ),
      JobListing(
        title: 'Programmer Analyst',
        company: 'Microsoft',
        logo: 'assets/microsoft.jpg',
        description: 'Design, code, and test software applications and systems to meet business requirements.',
        location: 'Etobicoke, ON',
        pay: 20000.0,
        responsibilities: 'Analyze user requirements and design software solutions. Develop and maintain software applications and systems. Write clean, efficient, and maintainable code. Perform unit testing and debugging. Collaborate with cross-functional teams to define, design, and ship new features. Provide technical support and troubleshooting for software-related issues.',
        qualifications: 'Bachelor\'s degree in Computer Science or related field. Proven experience as a software developer or programmer analyst. Proficiency in programming languages such as Java, C#, Python, etc. Strong problem-solving and analytical skills. Excellent communication and teamwork skills.',
        benefits: 'Competitive salary and benefits package. Opportunities for career growth and advancement. Training and professional development programs. Health, dental, and vision insurance. Retirement savings plans. Flexible work hours and remote work options. Employee assistance programs. Onsite amenities and wellness programs.',
      ),
      JobListing(
        title: 'Application Developer',
        company: 'Tata',
        logo: 'assets/tata.jpeg',
        description: 'Develop and maintain mobile and web applications to meet client specifications and business needs.',
        location: 'Mississauga, ON',
        pay: 10000.0,
        responsibilities: 'Develop, test, and maintain mobile and web applications. Collaborate with clients to gather requirements and define project scope. Write clean, efficient, and maintainable code. Ensure applications meet quality standards and performance benchmarks. Troubleshoot and debug applications as needed. Stay up-to-date with emerging technologies and industry trends.',
        qualifications: 'Bachelor\'s degree in Computer Science, Software Engineering, or related field. Proven experience as an application developer or similar role. Proficiency in programming languages such as Swift, Kotlin, JavaScript, etc. Experience with mobile and web development frameworks. Strong problem-solving and analytical skills. Excellent communication and teamwork skills.',
        benefits: 'Competitive salary and benefits package. Opportunities for career growth and advancement. Training and professional development programs. Health, dental, and vision insurance. Retirement savings plans. Flexible work hours and remote work options. Employee assistance programs. Onsite amenities and wellness programs.',
      )

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
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(jobListing.company),
                Text('Description: ${jobListing.description}'),
                Text('Location: ${jobListing.location}'),
                Text('Pay: \$${jobListing.pay.toStringAsFixed(2)}'),
              ],
            ),

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
