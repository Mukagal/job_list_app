import 'package:flutter/material.dart';

void main() {
  runApp(const SmartrApp());
}


class SmartrApp extends StatelessWidget {
  const SmartrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smartr',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: const SmartrWelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FeatureItem {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class FeatureListTile extends StatelessWidget {
  final FeatureItem feature;

  const FeatureListTile({
    super.key,
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              feature.icon,
              color: Colors.white,
              size: 15,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  feature.subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class SmartrWelcomeScreen extends StatelessWidget {
  const SmartrWelcomeScreen({super.key});

  static const List<FeatureItem> features = [
    FeatureItem(
      icon: Icons.swap_vert,
      title: 'SmartRecruiters candidate portal is now Smartr.',
      subtitle: '',
    ),
    FeatureItem(
      icon: Icons.login,
      title: 'Enter the same login info used for your SmartrProfile',
      subtitle: '',
    ),
    FeatureItem(
      icon: Icons.refresh,
      title: 'If login details were saved, you may need to re-save.',
      subtitle: '',

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(18, 170, 115, 1),
              Color.fromRGBO(19, 91, 70, 0.81),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Text(
                  'Smartr',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: 170,
                  height: 175,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color.fromRGBO(18, 170, 115, 1),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/login_man.png",
                      width: 160,
                      height: 160,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Fresh look, same login.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),


                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: features.map((feature) =>
                        FeatureListTile(feature: feature)
                    ).toList(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Why Smartr?'),
                          content: const Text('Learn more about our new platform and improved features.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'Why Smartr? Read here',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const JobListingScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'GET STARTED',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JobApp extends StatelessWidget {
  const JobApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Listings',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
      ),
      home: const JobListingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Job {
  final String id;
  final String title;
  final String company;
  final String category;
  final String payType;
  final String salary;
  final String? status;
  final Color? statusColor;

  const Job({
    required this.id,
    required this.title,
    required this.company,
    required this.category,
    required this.payType,
    required this.salary,
    this.status,
    this.statusColor,
  });
}

class JobCategory {
  final String title;
  final List<Job> jobs;

  const JobCategory({
    required this.title,
    required this.jobs,
  });
}

class JobDetail {
  final String applyBefore;
  final String jobNature;
  final String salaryRange;
  final String jobLocation;
  final String description;
  final List<String> responsibilities;

  const JobDetail({
    required this.applyBefore,
    required this.jobNature,
    required this.salaryRange,
    required this.jobLocation,
    required this.description,
    required this.responsibilities,
  });
}

class JobCard extends StatelessWidget {
  final Job job;
  final VoidCallback? onTap;

  const JobCard({
    super.key,
    required this.job,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF00D4AA), Color(0xFF0066FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              job.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          if (job.status != null) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: job.statusColor ?? Colors.orange,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                job.status!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        job.company,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8F5E8),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              job.payType,
                              style: const TextStyle(
                                color: Color(0xFF2E7D32),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            job.salary,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
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
  }
}

class CategorySection extends StatelessWidget {
  final JobCategory category;
  final Function(Job) onJobTap;

  const CategorySection({
    super.key,
    required this.category,
    required this.onJobTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Text(
            category.title.toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
              letterSpacing: 0.5,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: category.jobs.map((job) =>
                JobCard(
                  job: job,
                  onTap: () => onJobTap(job),
                )
            ).toList(),
          ),
        ),
      ],
    );
  }
}

class JobListingScreen extends StatelessWidget {
  const JobListingScreen({super.key});

  static const List<JobCategory> jobCategories = [
    JobCategory(
      title: 'DESIGNER',
      jobs: [
        Job(
          id: '1',
          title: 'Junior UX Designer',
          company: 'Canva',
          category: 'DESIGNER',
          payType: 'Paystack',
          salary: '\$40-60k/yearly',
        ),
        Job(
          id: '2',
          title: 'Junior Product Designer',
          company: 'Canva',
          category: 'DESIGNER',
          payType: 'Paystack',
          salary: '\$40-60k/yearly',
          status: 'Applied',
          statusColor: Colors.green,
        ),
        Job(
          id: '3',
          title: 'Middle motion Designer',
          company: 'Canva',
          category: 'DESIGNER',
          payType: 'Paystack',
          salary: '\$40-60k/yearly',
          status: 'Expires Soon',
          statusColor: Colors.orange,
        ),
      ],
    ),
    JobCategory(
      title: 'ANDROID',
      jobs: [
        Job(
          id: '4',
          title: 'Junior Android developer',
          company: 'Kotlin, Java',
          category: 'ANDROID',
          payType: 'Paystack',
          salary: '\$40-60k/yearly',
        ),
        Job(
          id: '5',
          title: 'Middle Android developer',
          company: 'Kotlin, Java',
          category: 'ANDROID',
          payType: 'Paystack',
          salary: '\$40-60k/yearly',
          status: 'Expires Soon',
          statusColor: Colors.orange,
        ),
        Job(
          id: '6',
          title: 'Junior UX Designer',
          company: 'Canva',
          category: 'ANDROID',
          payType: 'Paystack',
          salary: '\$40-60k/yearly',
          status: 'Expires Soon',
          statusColor: Colors.orange,
        ),
      ],
    ),
  ];

  void _navigateToJobDetail(BuildContext context, Job job) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JobDetailScreen(job: job),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB8D4C8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB8D4C8),
        elevation: 0,
        leading: Padding(

          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SmartrWelcomeScreen(),
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  "assets/Avatar.png",
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ),

        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications tapped')),
              );
            },
            icon: const Icon(
              Icons.notifications_outlined,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: ListView(
        children: jobCategories.map((category) =>
            CategorySection(
              category: category,
              onJobTap: (job) => _navigateToJobDetail(context, job),
            )
        ).toList(),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isTag;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.isTag = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            child: isTag
                ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F5E8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF2E7D32),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
                : Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 16),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class JobDetailScreen extends StatelessWidget {
  final Job job;

  const JobDetailScreen({
    super.key,
    required this.job,
  });

  static const JobDetail sampleJobDetail = JobDetail(
    applyBefore: '03 June, 2022',
    jobNature: 'Full-time',
    salaryRange: '40k - 60k/yearly',
    jobLocation: 'Work from anywhere',
    description: 'Can you bring creative human-centered ideas to life and make great things happen beyond what meets the eye?\n\nWe believe in teamwork, fun, complex projects, diverse perspectives, and simple solutions. How about you? We\'re looking for a like-minded',
    responsibilities: [
      'Drive the design process with cross-functional partners and design leads.',
      'Design new experiences and patterns in a complex ecosystem across platforms.',
      'Partner with UX Research and Content Strategists through the design process.',
      'Work closely with Product and Engineering to',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to favorites')),
              );
            },
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header section
                  Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00D4AA), Color(0xFF0066FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Center(
                          child: Text(
                            'C',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              job.title,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              job.company,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Posted on 3 March',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 40, thickness: 1),

                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: InfoRow(
                              label: 'Apply Before',
                              value: sampleJobDetail.applyBefore,
                            ),
                          ),
                          Expanded(
                            child: InfoRow(
                              label: 'Job Nature',
                              value: sampleJobDetail.jobNature,
                              isTag: true,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InfoRow(
                              label: 'Salary Range',
                              value: sampleJobDetail.salaryRange,
                            ),
                          ),
                          Expanded(
                            child: InfoRow(
                              label: 'Job Location',
                              value: sampleJobDetail.jobLocation,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Divider(height: 40, thickness: 1),

                  SectionHeader(title: 'Job Description'),
                  Text(
                    sampleJobDetail.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Full Description'),
                          content: const Text('Here would be the complete job description...'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      'See more ▼',
                      style: TextStyle(
                        color: Color(0xFF00D4AA),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const Divider(height: 40, thickness: 1),

                  SectionHeader(title: 'Roles and Responsibilities'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: sampleJobDetail.responsibilities.map((responsibility) =>
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 8, right: 12),
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: Colors.black87,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  responsibility,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    height: 1.5,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ).toList(),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Applied for ${job.title}!'),
                      backgroundColor: const Color(0xFF00D4AA),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4AA),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'APPLY NOW',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}